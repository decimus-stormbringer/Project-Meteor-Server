using Meteor.Common;
using System;
using MySql.Data.MySqlClient;
using Meteor.Map;
using System.Collections.Generic;
using MoonSharp.Interpreter;
using Meteor.Map.DataObjects;
using Meteor.Map.DataObjects.chara;
using Meteor.Map.lua;
using Meteor.Map.packets.WorldPackets.Send.Group;
using Meteor.Map.utils;
using Meteor.Map.actors.group;
using Meteor.Map.actors.chara.player;
using Meteor.Map.actors.director;
using Meteor.Map.actors.chara.npc;
using Meteor.Map.actors.chara.ai;
using Meteor.Map.actors.chara.ai.controllers;
using Meteor.Map.actors.chara.ai.utils;
using Meteor.Map.actors.chara.ai.state;
using Meteor.Map.actors.chara;
using Meteor.Map.Actors.QuestNS;
using Meteor.Map.packets.send;
using Meteor.Map.packets.send.actor;
using Meteor.Map.packets.send.events;
using Meteor.Map.packets.send.actor.inventory;
using Meteor.Map.packets.send.player;
using Meteor.Map.packets.send.actor.battle;
using Meteor.Map.packets.receive.events;
using static Meteor.Map.LuaUtils;
using Meteor.Map.packets.send.actor.events;
using System.Text;

namespace Meteor.Map.Actors
{
    class Shops
    {
        public static void GetShopData()
        {
            using (var conn = new MySqlConnection(String.Format("Server={0}; Port={1}; Database={2}; UID={3}; Password={4}", ConfigConstants.DATABASE_HOST, ConfigConstants.DATABASE_PORT, ConfigConstants.DATABASE_NAME, ConfigConstants.DATABASE_USERNAME, ConfigConstants.DATABASE_PASSWORD)))
            {
                try
                {
                    conn.Open();

                    string query = @"
                                SELECT
                                catalogID,
                                itemID,
                                quality,
                                itemName,
                                gilBuyPrice
                                FROM gamedata_shopdata
                                ";

                    MySqlCommand cmd = new MySqlCommand(query, conn);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            uint id = reader.GetUInt32("catalogID");
                            uint itemid = reader.GetUInt32("itemID");
                            uint quality = reader.GetUInt16("quality");
                            string itemname = reader.GetString("itemName");
                            uint price = reader.GetUInt32("gilBuyPrice");
                        }
                    }
                }
                catch (MySqlException e)
                {
                    Program.Log.Error(e.ToString());
                }
                finally
                {
                    conn.Dispose();
                }
            }
        }
    }
}