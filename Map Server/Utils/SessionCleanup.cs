using Meteor.Map.Actors;
using Meteor.Map.Actors.QuestNS;
using Meteor.Map.lua;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Threading;
using System.Threading.Tasks;
using Meteor.Map.actors.area;
using System.Reflection;


namespace Meteor.Map.utils
{
    class SessionCleanupService
    {
        private readonly Server _server;
        private readonly TimeSpan _cleanupInterval = TimeSpan.FromSeconds(10); // How often the cleanup service is ran.
        private CancellationTokenSource _cts;
        private Task _cleanupTask;
        private static readonly uint[] TutorialQuestIds = { 110001u, 110005u, 110009u };

        public SessionCleanupService(Server server)
        {
            _server = server;
        }

        public void Start()
        {
            _cts = new CancellationTokenSource();
            _cleanupTask = Task.Run(async () => await CleanupLoop(_cts.Token));
            Program.Log.Info("Session cleanup service started.");
        }

        public void Stop()
        {
            _cts?.Cancel();
            Program.Log.Info("Session cleanup service stopped.");
        }

        private async Task CleanupLoop(CancellationToken token)
        {
            while (!token.IsCancellationRequested)
            {
                try
                {
                    CleanupDisconnectedSessions();
                }
                catch (Exception ex)
                {
                    Program.Log.Error($"[SessionCleanupService] Cleanup error: {ex}");
                }

                await Task.Delay(_cleanupInterval, token);
            }
        }

        private void CleanupDisconnectedSessions()
        {
            var sessions = _server.GetSessionList();
            var snapshot = sessions.ToList();

            foreach (var kvp in snapshot)
            {
                var sessionId = kvp.Key;
                var session = kvp.Value;
                if (session == null)
                    continue;

                try
                {
                    bool shouldClean = !session.IsSessionConnected();

                    if (!shouldClean)
                        shouldClean = session.CheckIfDCing();

                    //if (!shouldClean)
                    //{
                    //    var worldConn = Server.GetWorldConnection();
                    //    if (worldConn == null || !worldConn.IsConnected())
                    //        shouldClean = true;
                    //}

                    if (!shouldClean)
                        continue;

                    var player = session.GetActor();

                    if (player != null)
                    {
                        if (session.isUpdatesLocked || player.IsInZoneChange())
                            continue;
                    }

                    //Program.Log.Info($"[SessionCleanup] Cleaning disconnected session {sessionId} ({player?.DisplayName ?? "unknown player"})...");
                    Program.Log.Warn(
                    $"[SessionCleanup] Candidate session={sessionId} player={player.DisplayName} " + 
                    $"connected={session.IsSessionConnected()}" +
                    $"locked={session.isUpdatesLocked} zoneChanging={player?.IsInZoneChange() ?? false}");


                    // mark session disconnected
                    try
                    {
                        session.MarkDisconnected();
                    }
                    catch (Exception ex)
                    {
                        Program.Log.Warn($"Failed to mark session {sessionId} disconnected: {ex}");
                    }

                    // Decide which recovery to run (tutorial vs homepoint)
                    try
                    {
                        if (player != null)
                        {
                            bool hasTutorialQuest = false;

                            foreach (var quest in player.questScenario)
                            {
                                if (quest == null)
                                    continue;

                                uint qid = quest.GetQuestId();

                                if (TutorialQuestIds.Contains(qid))
                                {
                                    hasTutorialQuest = true;
                                    break;
                                }
                            }

                            // Run the appropriate recovery
                            if (hasTutorialQuest)
                            {
                                TryTutorialRecovery(player);
                                RefreshTutorialENPCs(player);
                            }
                            else
                            {
                                TryHomepointRecovery(player);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Program.Log.Warn($"[SessionCleanup] Recovery selection failed for char {player?.Id}: {ex}");
                    }


                    // Save + remove player from world
                    try
                    {
                        player?.CleanupAndSave();
                    }
                    catch (Exception ex)
                    {
                        Program.Log.Warn($"Player.CleanupAndSave failed for session {sessionId}: {ex}");
                    }

                    try
                    {
                        _server.RemoveSession(sessionId);
                        Program.Log.Info($"[SessionCleanup] Session {sessionId} removed successfully.");
                    }
                    catch (Exception ex) { Program.Log.Error($"Failed removing session {sessionId}: {ex}"); }
                }
                catch (Exception ex)
                {
                    Program.Log.Error($"Unexpected error in cleanup for session {sessionId}: {ex}");
                }
            }
        }

        public static void TryHomepointRecovery(Player player)
        {
            //  SECTION #1 -- CONTENTAREA CHECK
            //  Checks if player is in ContentArea, and then clears ContentArea fields in database.
            //  Player should not recover to Homepoint if in multiplayer instance (ie. dungeons/raids). 
            if (player.CurrentArea != null)
            {
                bool shouldForceHomepoint = false;
                if (player.CurrentArea is PrivateAreaContent)
                {
                    var field = typeof(Area).GetField("mActorList", BindingFlags.Instance | BindingFlags.NonPublic);
                    var dictObj = field?.GetValue(player.CurrentArea);

                    // mActorList is Dictionary<uint, Actor>
                    if (dictObj is System.Collections.IDictionary dict)
                    {
                        int playerCount = 0;

                        // Prevent Homepoint recovery if other players detected in ContentArea at time of disconnect. 
                        // To-Do: should probably add a party-check in here somewhere. 
                        // !! THIS STILL NEEDS TO BE TESTED ONCE MULTIPLAYER INSTANCES (IE DUNGEONS) ARE ADDED !!
                        //foreach (var value in dict.Values)
                        //{
                        //    if (value is Player)
                        //        playerCount++;
                        //}

                        
                        if (playerCount <= 1)
                            shouldForceHomepoint = true;
                    }
                    // Clear CurrentArea and ContentArea so below Homepoint Recovery can run. 
                    player.CurrentArea = null;
                    Database.ClearPrivateAreaState(player.Id);
                }

                // Only continue recovery script if this is true. Any additional checks should go above this line. 
                if (!shouldForceHomepoint)
                    return;
            }

            // SECTION #2 -- HOMEPOINT RECOVERY
            // Recover player to Homepoint Aetheryte if CurrentArea = Null
            // Used for player being located in ContentAreas or Zones that no longer exist. 
            try
            {
                uint homepoint = player.GetHomePoint(); // aetheryteId stored in DB

                if (homepoint == 0)
                {
                    Program.Log.Warn($"[SessionCleanup] Homepoint recovery: homepoint=0 for char {player.Id}. Falling back to Ul'dah.");
                }
                else
                {
                    string errorMsg = "";
                    string scriptPath = ConfigConstants.OPTIONS_SCRIPTPATH + "/aetheryte.lua";
                    var script = LuaEngine.LoadScript(scriptPath, ref errorMsg);

                    if (script == null)
                    {
                        Program.Log.Warn($"[SessionCleanup] Homepoint recovery: failed to load aetheryte.lua for char {player.Id}: {errorMsg}. Falling back to Ul'dah.");
                    }
                    else
                    {
                        var returnpoint = script.Globals.Get("getAetheryteCoords");
                        if (returnpoint.IsNil())
                        {
                            Program.Log.Warn($"[SessionCleanup] Homepoint recovery: getAetheryteCoords not found in aetheryte.lua for char {player.Id}. Falling back to Ul'dah.");
                        }
                        else
                        {
                            // Fetch aetheryte coords for homepoint return.
                            var callResult = script.Call(returnpoint, homepoint);
                            List<LuaParam> result = LuaUtils.CreateLuaParamList(callResult);

                            if (result == null || result.Count < 4 || result[0] == null || result[1] == null || result[2] == null || result[3] == null)
                            {
                                Program.Log.Warn($"[SessionCleanup] Homepoint recovery: no coords for char {player.Id} (homepoint={homepoint}). Falling back to Ul'dah.");
                            }
                            else
                            {
                                uint zoneId = Convert.ToUInt32(result[0].value);
                                float x = Convert.ToSingle(result[1].value);
                                float y = Convert.ToSingle(result[2].value);
                                float z = Convert.ToSingle(result[3].value);

                                player.CurrentArea = Server.GetWorldManager().GetArea(zoneId, null, 0);
                                player.positionX = x;
                                player.positionY = y;
                                player.positionZ = z;

                                player.destinationZone = 0;
                                player.destinationSpawnType = 0;

                                Program.Log.Info($"[SessionCleanup] Player {player.DisplayName} located in instance/zone that no longer exists. Doing Homepoint recovery to zone {zoneId}.");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Program.Log.Warn($"[SessionCleanup] Homepoint recovery failed for char {player.Id}: {ex}");
            }

            // SECTION #3 -- UL'DAH FALLBACK
            // If homepoint recovery fails for some reason, fallback to Ul'dah Aetheryte for recovery.
            if (player.CurrentArea == null)
            {
                Program.Log.Warn($"[SessionCleanup] Homepoint recovery failed; using Ul'dah fallback for char {player.Id} to prevent save crash.");
                player.CurrentArea = Server.GetWorldManager().GetArea(175, null, 0);
                player.positionX = -235f;
                player.positionY = 185f;
                player.positionZ = -3.9f;
                player.rotation = 0f;
                player.destinationZone = 0;
                player.destinationSpawnType = 0;
            }
        }

        private void TryTutorialRecovery(Player player)
        {
            foreach (var quest in player.questScenario)
            {
                if (quest == null)
                    continue;

                uint qid = quest.GetQuestId();
                if (!TutorialQuestIds.Contains(qid))
                    continue;

                ushort seq = quest.GetSequence();
                if (seq == 0 || seq == 5)
                {
                    var data = quest.GetData();
                    if (data != null)
                    {
                        // Clear flags and counters in a way that marks Dirty
                        for (int i = 0; i < 32; i++)
                            if (data.GetFlag(i))
                                data.ClearFlag(i);

                        data.SetCounter(0, 0);
                        data.SetCounter(1, 0);
                        data.SetCounter(2, 0);
                        data.SetCounter(3, 0);

                        data.ClearNpcLs(); // optional

                        uint startZone = 0;
                        if (qid == 110001u) startZone = 193u;
                        else if (qid == 110005u) startZone = 166u;
                        else if (qid == 110009u) startZone = 184u;
                        else return;

                        player.CurrentArea = Server.GetWorldManager().GetArea(startZone, null, 0); //this is needed to clear player ContentArea location from memory, despite zoneId probably never changing. 
                        player.destinationZone = 0;
                        player.destinationSpawnType = 0;
                        player.positionX = 0f;
                        player.positionY = 0f;
                        player.positionZ = 0f;
                        player.rotation = 0f;
                        Database.ClearPrivateAreaState(player.Id); // Clear ContentArea fields in DB.
                    }
                    // Reset the actual quest sequence
                    quest.StartSequence(0);
                    Program.Log.Info($"[SessionCleanup] Tutorial quest {qid} was reset due to disconnect (was seq {seq}).");
                }
            }
        }

        public static void RefreshTutorialENPCs(Player player)
        {
            if (player == null)
                return;

            // Player.questScenario is a Quest[] (length 16)
            for (int i = 0; i < player.questScenario.Length; i++)
            {
                var quest = player.questScenario[i];
                if (quest == null)
                    continue;

                uint qid = quest.GetQuestId();
                if (!TutorialQuestIds.Contains(qid))
                    continue;

                // Only refresh when it matters (seq 0 tutorial restart)
                if (quest.GetSequence() == 0)
                    quest.UpdateENPCs();
            }
        }
    }
}