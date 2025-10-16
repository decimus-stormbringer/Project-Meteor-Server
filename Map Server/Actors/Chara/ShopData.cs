using System;
using MySql.Data.MySqlClient;

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