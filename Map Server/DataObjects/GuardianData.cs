using Meteor.Map.actors.chara;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;

namespace Meteor.Map.DataObjects
{
    public class GuardianData
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

        public GuardianData(MySqlDataReader reader)
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

        public Guardian? GetGuardian()
        {
            if (Enum.IsDefined(typeof(Guardian), Id) == false)
            {
                return null;
            }

            return (Guardian)Id;
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

    public enum Guardian : ushort
    {
        Halone = 1,
        Menphina = 2,
        Thaliak = 3,
        Nymeia = 4,
        Llymlaen = 5,
        Oschon = 6,
        Byregot = 7,
        Rhalgr = 8,
        Azeyma = 9,
        Naldthal = 10,
        Nophica = 11,
        Althyx = 12
    }
}
