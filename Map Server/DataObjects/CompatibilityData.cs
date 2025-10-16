using Meteor.Map.Actors;
using MySql.Data.MySqlClient;
using System.Collections.Generic;

namespace Meteor.Map.DataObjects
{
    public class CompatibilityData
    {
        public readonly int Id;
        public readonly List<short> JobCompatibilities;

        public CompatibilityData(MySqlDataReader reader)
        {
            Id = reader.GetInt32("id");

            JobCompatibilities = new List<short>
            {
                reader.GetInt16("job1"),
                reader.GetInt16("job2"),
                reader.GetInt16("job3"),
                reader.GetInt16("job4"),
                reader.GetInt16("job5"),
                reader.GetInt16("job6"),
                reader.GetInt16("job7"),
                reader.GetInt16("job8"),
                reader.GetInt16("job9"),
                reader.GetInt16("job10"),
                reader.GetInt16("job11"),
                reader.GetInt16("job12"),
                reader.GetInt16("job13"),
                reader.GetInt16("job14"),
                reader.GetInt16("job15"),
                reader.GetInt16("job16"),
                reader.GetInt16("job17"),
                reader.GetInt16("job18"),
                reader.GetInt16("job19"),
                reader.GetInt16("job20"),
                reader.GetInt16("job21"),
                reader.GetInt16("job22"),
                reader.GetInt16("job23"),
                reader.GetInt16("job24"),
                reader.GetInt16("job25"),
                reader.GetInt16("job26"),
                reader.GetInt16("job27"),
                reader.GetInt16("job28"),
                reader.GetInt16("job29"),
                reader.GetInt16("job30"),
                reader.GetInt16("job31"),
                reader.GetInt16("job32"),
                reader.GetInt16("job33"),
                reader.GetInt16("job34"),
                reader.GetInt16("job35"),
                reader.GetInt16("job36"),
                reader.GetInt16("job37"),
                reader.GetInt16("job38"),
                reader.GetInt16("job39"),
                reader.GetInt16("job40"),
                reader.GetInt16("job41"),
                reader.GetInt16("job42"),
                reader.GetInt16("job43"),
                reader.GetInt16("job44")
            };
        }

        public double GetCompatibilityMultiplier(Job job)
        {
            int jobIndex = (ushort)job - 1;
            if (JobCompatibilities.Count <= jobIndex)
            {
                return 0;
            }

            return (double)JobCompatibilities[jobIndex] / 100;
        }
    }
}