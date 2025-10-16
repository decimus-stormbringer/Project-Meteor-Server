using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Meteor.Map.utils
{
    class SessionCleanupService
    {
        private readonly Server _server;
        private readonly TimeSpan _cleanupInterval = TimeSpan.FromSeconds(10); // How often the cleanup service is ran.
        private CancellationTokenSource _cts;
        private Task _cleanupTask;

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
            var snapshot = sessions.ToList(); // safe snapshot

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

                    if (!shouldClean)
                    {
                        var worldConn = Server.GetWorldConnection();
                        if (worldConn == null || !worldConn.IsConnected())
                            shouldClean = true;
                    }

                    if (!shouldClean)
                        continue;

                    var player = session.GetActor();
                    Program.Log.Info($"[SessionCleanup] Cleaning disconnected session {sessionId} ({player?.DisplayName ?? "unknown player"})...");

                    // mark session disconnected
                    try { session.MarkDisconnected(); } catch (Exception ex) { Program.Log.Warn($"Failed to mark session {sessionId} disconnected: {ex}"); }

                    // Save + remove player from world
                    try { player?.CleanupAndSave(); }
                    catch (Exception ex) { Program.Log.Warn($"Player.CleanupAndSave failed for session {sessionId}: {ex}"); }

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
    }
}