using Meteor.Map.actors.chara;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;

namespace Meteor.Map.DataObjects
{
    public class TribeData
    {
        public readonly ushort Id;

        public readonly int Bonus1Type;
        public readonly short Bonus1Value;

        public readonly int Bonus2Type;
        public readonly short Bonus2Value;

        public readonly int Bonus3Type;
        public readonly short Bonus3Value;

        public readonly int Bonus4Type;
        public readonly short Bonus4Value;

        public readonly int Bonus5Type;
        public readonly short Bonus5Value;

        public readonly int Bonus6Type;
        public readonly short Bonus6Value;

        public TribeData(MySqlDataReader reader)
        {
            Id = reader.GetUInt16("id");

            Bonus1Type = reader.GetInt32("bonus1Type");
            Bonus1Value = reader.GetInt16("bonus1Value");

            Bonus2Type = reader.GetInt32("bonus2Type");
            Bonus2Value = reader.GetInt16("bonus2Value");

            Bonus3Type = reader.GetInt32("bonus3Type");
            Bonus3Value = reader.GetInt16("bonus3Value");

            Bonus4Type = reader.GetInt32("bonus4Type");
            Bonus4Value = reader.GetInt16("bonus4Value");

            Bonus5Type = reader.GetInt32("bonus5Type");
            Bonus5Value = reader.GetInt16("bonus5Value");

            Bonus6Type = reader.GetInt32("bonus6Type");
            Bonus6Value = reader.GetInt16("bonus6Value");
        }

        public Tribe? GetTribe()
        {
            if (Enum.IsDefined(typeof(Tribe), Id) == false)
            {
                return null;
            }

            return (Tribe)Id;
        }

        public IList<ModifierData> GetModsFromBonuses()
        {
            List<ModifierData> mods = new List<ModifierData>();

            AddModToList(mods, Bonus1Type, Bonus1Value);
            AddModToList(mods, Bonus2Type, Bonus2Value);
            AddModToList(mods, Bonus3Type, Bonus3Value);
            AddModToList(mods, Bonus4Type, Bonus4Value);
            AddModToList(mods, Bonus5Type, Bonus5Value);
            AddModToList(mods, Bonus6Type, Bonus6Value);

            return mods;
        }

        private void AddModToList(IList<ModifierData> mods, int bonusType, short bonusValue)
        {
            Modifier? mod = GetBonusMod(bonusType);
            if (mod == null)
            {
                return;
            }

            mods.Add(new ModifierData { Modifier = mod.Value, EndValue = bonusValue });
        }

        private Modifier? GetBonusMod(int bonusType)
        {
            if (bonusType < 0)
            {
                return null;
            }

            // e.g. HP: paramBonusType is 15001, Modifier is 0
            int modifierLookupOffset = 15001;
            int modifierLookupValue = bonusType - modifierLookupOffset;
            if (modifierLookupValue < 0)
            {
                return null;
            }

            if (Enum.IsDefined(typeof(Modifier), (uint)modifierLookupValue) == false)
            {
                return null;
            }

            return (Modifier)modifierLookupValue;
        }
    }

    public enum Tribe : ushort
    {
        Clanless = 0,
        MidlanderMale = 1,
        MidlanderFemale = 2,
        HighlanderMale = 3,
        WildwoodMale = 4,
        WildwoodFemale = 5,
        DuskwightMale = 6,
        DuskwightFemale = 7,
        PlainsfolkMale = 8,
        PlainsfolkFemale = 9,
        DunesfolkMale = 10,
        DunesfolkFemale = 11,
        SeekerOfTheSunFemale = 12,
        KeeperOfTheMoonFemale = 13,
        SeaWolfMale = 14,
        HellsguardMale = 15
    }
}
