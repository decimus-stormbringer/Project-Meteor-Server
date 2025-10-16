/*
===========================================================================
Copyright (C) 2015-2019 Project Meteor Dev Team

This file is part of Project Meteor Server.

Project Meteor Server is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Project Meteor Server is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with Project Meteor Server. If not, see <https:www.gnu.org/licenses/>.
===========================================================================
*/

using System;
using System.Collections.Generic;


namespace Meteor.Map.actors.chara
{
    //These will need to be redone at some point. remember to update tables in db.
    //Consider using text_paramname sheet. that matches up with the stats on armor, but some things will need special handling
    //Also, 0-35 should probably match with up BattleTemp
    public enum Modifier : UInt32
    {
        //These line up with ParamNames starting at 15001 and appear on gear
        //Health
        Hp = 0,    //Max HP
        Mp = 1,    //Max MP
        Tp = 2,    //Max TP

        //Main stats
        Strength = 3,
        Vitality = 4,
        Dexterity = 5,
        Intelligence = 6,
        Mind = 7,
        Piety = 8,

        //Elemental Resistances
        FireResistance = 9,    //Lowers Fire damage taken
        IceResistance = 10,   //Lowers Ice damage taken
        WindResistance = 11,   //Lowers Wind damage taken
        EarthResistance = 12,   //Lowers Earth damage taken
        LightningResistance = 13,   //Lowers Lightning damage taken
        WaterResistance = 14,   //Lowers Water damage taken

        //Physical Secondary stats
        Accuracy = 15,   //Increases chance to hit with physical attacks
        Evasion = 16,   //Decreases chance to be hit by physical attacks
        Attack = 17,   //Increases damage done with physical attacks
        Defense = 18,   //Decreases damage taken from physical attacks

        //Physical crit stats
        CriticalHitRating = 19,   //Increases chance to crit with physical attacks
        CriticalHitEvasion = 20,   //Decreases chance to be crit by physical attacks
        CriticalHitAttackPower = 21,   //Increases damage done by critical physical attacks
        CriticalHitResilience = 22,   //Decreases damage taken from critical physical attacks

        //Magic secondary stats
        AttackMagicPotency = 23,   //Increases damage done with magical attacks
        HealingMagicPotency = 24,   //Increases healing done with magic healing
        EnhancementMagicPotency = 25,   //Increases effect of enhancement magic
        EnfeeblingMagicPotency = 26,   //Increases effect of enfeebling magic
        MagicAccuracy = 27,   //Decreases chance for magic to be evaded
        MagicEvasion = 28,   //Increases chance to evade magic

        //Crafting stats
        Craftsmanship = 29,
        MagicCraftsmanship = 30,
        Control = 31,
        Gathering = 32,
        Output = 33,
        Perception = 34,

        //Magic crit stats
        MagicCriticalHitRating = 35,   //Increases chance to crit with magical attacks
        MagicCriticalHitEvasion = 36,   //Decreases chance to be crit by magical attacks
        MagicCriticalHitPotency = 37,   //Increases damage done by critical magical attacks
        MagicCriticalHitResilience = 38,   //Decreases damage taken from critical magical attacks

        //Blocking stats
        Parry = 39,   //Increases chance to parry
        BlockRate = 40,   //Increases chance to block
        Block = 41,   //Reduces damage taken from blocked attacks

        //Elemental Potencies
        FireMagicPotency = 42,   //Increases damage done by Fire Magic
        IceMagicPotency = 43,   //Increases damage done by Ice Magic
        WindMagicPotency = 44,   //Increases damage done by Wind Magic
        EarthMagicPotency = 45,   //Increases damage done by Earth Magic
        LightningMagicPotency = 46,   //Increases damage done by Lightning Magic
        WaterMagicPotency = 47,   //Increases damage done by Water Magic

        //Miscellaneous
        Regen = 48,   //Restores health over time
        Refresh = 49,   //Restores MP over time
        StoreTp = 50,   //Increases TP gained by auto attacks and damaging abiltiies
        Enmity = 51,   //Increases enmity gained from actions
        Spikes = 52,   //Deals damage or status to attacker when hit
        Haste = 53,   //Increases attack speed
        //54 and 55 didn't have names and seem to be unused
        ReducedDurabilityLoss = 56,   //Reduces durability loss
        IncreasedSpiritbondGain = 57,   //Increases rate of spiritbonding
        Damage = 58,   //Increases damage of auto attacks
        Delay = 59,   //Increases rate of auto attacks
        Fastcast = 60,   //Increases speed of casts
        MovementSpeed = 61,   //Increases movement speed
        Exp = 62,   //Increases experience gained
        RestingHp = 63,   //?
        RestingMp = 64,   //?

        //Attack property resistances
        SlashingResistance = 65,   //Reduces damage taken by slashing attacks
        PiercingResistance = 66,   //Reduces damage taken by piercing attacks
        BluntResistance = 67,   //Reduces damage taken by blunt attacks
        ProjectileResistance = 68,   //Reduces damage taken by projectile attacks
        SonicResistance = 69,   //Reduces damage taken by sonic attacks
        BreathResistance = 70,   //Reduces damage taken by breath attacks
        PhysicalResistance = 71,   //Reduces damage taken by physical attacks
        MagicResistance = 72,   //Reduces damage taken by magic attacks

        //Status resistances
        SlowResistance = 73,   //Reduces chance to be inflicted with slow by status magic
        PetrificationResistance = 74,   //Reduces chance to be inflicted with petrification by status magic
        ParalysisResistance = 75,   //Reduces chance to be inflicted with paralysis by status magic
        SilenceResistance = 76,   //Reduces chance to be inflicted with silence by status magic
        BlindResistance = 77,   //Reduces chance to be inflicted with blind by status magic
        PoisonResistance = 78,   //Reduces chance to be inflicted with poison by status magic
        StunResistance = 79,   //Reduces chance to be inflicted with stun by status magic
        SleepResistance = 80,   //Reduces chance to be inflicted with sleep by status magic
        BindResistance = 81,   //Reduces chance to be inflicted with bind by status magic
        HeavyResistance = 82,   //Reduces chance to be inflicted with heavy by status magic
        DoomResistance = 83,   //Reduces chance to be inflicted with doom by status magic

        //84-100 didn't have names and seem to be unused
        //Miscellaneous
        ConserveMp = 101,  //Chance to reduce mp used by actions
        SpellInterruptResistance = 102,  //Reduces chance to be interrupted by damage while casting
        DoubleDownOdds = 103,  //Increases double down odds
        HqDiscoveryRate = 104,

        #region Miscellaneous artificial modifiers (not aligned with any values in db or client)

        //Non-gear mods
        None = 105,
        NAMEPLATE_SHOWN = 106,
        TARGETABLE = 107,
        NAMEPLATE_SHOWN2 = 108,

        HpPercent = 109,
        MpPercent = 110,
        TpPercent = 111,

        AttackRange = 112,  //How far away in yalms this character can attack from (probably won't need this when auto attack skills are done)

        Raise = 113,
        MinimumHpLock = 114,  //Stops HP from falling below this value
        MinimumMpLock = 115,  //Stops MP from falling below this value
        MinimumTpLock = 116,  //Stops TP from falling below this value
        AttackType = 117,  //Attack property of auto attacks (might not need this when auto attack skills are done, unsure)
        CanBlock = 118,  //Whether the character can block attacks. (For players this is only true when they have a shield)
        HitCount = 119,  //Amount of hits in an auto attack. Usually 1, 2 for h2h, 3 with spinning heel

        //Flat percent increases to these rates. Might not need these?
        RawEvadeRate = 120,
        RawParryRate = 121,
        RawBlockRate = 122,
        RawResistRate = 123,
        RawHitRate = 124,
        RawCritRate = 125,

        DamageTakenDown = 126,  //Percent damage taken down
        Regain = 127,  //TP regen, should be -90 out of combat, Invigorate sets to 100+ depending on traits
        RegenDown = 128,  //Damage over time effects. Separate from normal Regen because of how they are displayed in game
        Stoneskin = 129,  //Nullifies damage
        KnockbackImmune = 130,  //Immune to knockback effects when above 0
        Stealth = 131,  //Not visisble when above 0

        #endregion

        // 16001 and onwards => (16001 - 15001 = 1000), see xtx_text_paramName.csv
        HpRegen = 1000,
        MpRegen = 1001,
        CriticalHitRating_when_Hp_LessThanOrEqual_75Percent = 1002,
        CriticalHitPower_when_Hp_LessThanOrEqual_75Percent = 1003,
        MagicCriticalHitRating_when_Hp_LessThanOrEqual_75Percent = 1004,
        CriticalHitPotency_when_Hp_LessThanOrEqual_75Percent = 1005,
        StormGearPiecesRequirement = 1006, // n or more pieces for requirement to be met
        SerpentGearPiecesRequirement = 1007, // n or more pieces for requirement to be met
        FlameGearPiecesRequirement = 1008, // n or more pieces for requirement to be met
        SanctionRequirement = 1009,
        // 20001 and onwards => (20001 - 15001 = 5000)
        Level10ExpBonus = 5000,
        Level10HalvesWeaknessDuration = 5001,
        Level10EnhanceMainArm = 5002,
        TemporaryMovementSpeedIncrease = 5003,

        ChanceTo_Inflict_Silence_and_Poison = 5004,
        ChanceTo_Inflict_Paralysis_and_Poison = 5005,
        ChanceTo_Inflict_Paralysis = 5006,
        ChanceTo_Inflict_IncreasedEnmity = 5007,
        ChanceTo_Inflict_Poison = 5008,
        ChanceTo_Inflict_Blind = 5009,
        ChanceTo_Inflict_Silence = 5010,
        ChanceTo_Inflict_Sleep = 5011,
        ChanceTo_Inflict_FireDamage = 5012,
        ChanceTo_Inflict_IceDamage = 5013,
        ChanceTo_Inflict_WindDamage = 5014,
        ChanceTo_Inflict_EarthDamage = 5015,
        ChanceTo_Inflict_LightningDamage = 5016,
        ChanceTo_Inflict_WaterDamage = 5017,
        ChanceTo_Absorb_Hp = 5018,
        ChanceTo_Absorb_Mp = 5019,
        ChanceTo_Absorb_Tp = 5020,
        Converts_Damage_to_Mp = 5021,
        Converts_Damage_to_Tp = 5022,
        ChanceTo_Restore_Hp = 5023,
        ChanceTo_Restore_Mp = 5024,
        CannotEquipGear_Head = 5025,
        CannotEquipGear_Hand_Leg_Feet = 5026,
        CannotEquipGear_Feet = 5027,
        RecoverMpDuringCover = 5028,
        IncreaseHolySuccorHpRecovery = 5029,
        IncreaseDivineVeilHpRecovery = 5030,
        ReduceCollusionRecast = 5031,
        EnhanceAntagonize = 5032,
        RedirectMagicDamageDuringVengeance = 5033,
        ConserveMpCostOfFistActions = 5034,
        EnhanceFistsOfWind = 5035,
        ReduceShoulderTackleRecast = 5036,
        EnhanceBallads = 5037,
        EnhancePaeons = 5038,
        EnhanceMinuets = 5039,
        ReduceJumpRecast = 5040,
        EnhanceElusiveJump = 5041,
        IncreaseTpDuringInvigorate = 5042,
        EnhanceRegen = 5043,
        ReducePresentOfMindRecast = 5044,
        EnhanceCure = 5045,
        ReduceConvertRecast = 5046,
        ReduceResonanceRecast = 5047,
        EnhanceExcruciate = 5048,
        IncreaseSpiritsWithinDamage = 5049,
        IncreaseShoulderTackleDamage = 5050,
        ReduceVengeanceRecast = 5051,
        IncreaseJumpDamage = 5052,
        IncreaseSongDuration = 5053,
        IncreaseHolyDamage = 5054,
        IncreaseFlareDamageOverTime = 5055,
        InhibitMainArmSpiritbond = 5056
    }

    public class ModifierData
    {
        public Modifier Modifier { get; set; }
        public double StartValue { get; set; }
        public double EndValue { get; set; }
        public ModifierData PrerequisiteModifier { get; set; }
        public double GrowthRate;
    }

    public enum ModifierOrigin : int
    {
        Miscellaneous = 0,
        Tribe = 1,
        Guardian = 2,
        Job = 3,
        Equipment = 4,
        StatusEffect = 5,
        BattleTrait = 6,
        AttributePointAllotment = 7,
        ModifierDownstreamEffects = 8,
        Base = 9,
        // TODO: allow npc pool, genus, and spawn to be set and used here
        //NpcPool = 10,
        //NpcGenus = 11,
        //NpcSpawn = 12,
    }

    public class ModifierContainer
    {
        private readonly IDictionary<ModifierOrigin, IDictionary<Modifier, double>> AllModifiers;
        private readonly IDictionary<Modifier, double> ModifierDefaults;
        private readonly IDictionary<Modifier, double> ModifierMultipliers;

        public ModifierContainer()
        {
            AllModifiers = new Dictionary<ModifierOrigin, IDictionary<Modifier, double>>();

            foreach (ModifierOrigin origin in Enum.GetValues(typeof(ModifierOrigin)))
            {
                AllModifiers.Add(origin, new Dictionary<Modifier, double>());
            }

            ModifierDefaults = new Dictionary<Modifier, double>();
            ModifierMultipliers = new Dictionary<Modifier, double>();
        }

        public double GetMod(Modifier modifier)
        {
            double totalValue = 0;
            bool modFound = false;

            foreach (ModifierOrigin origin in AllModifiers.Keys)
            {
                double value;
                if (AllModifiers[origin].TryGetValue(modifier, out value))
                {
                    totalValue += value;
                    modFound = true;
                }
            }

            if (modFound == false)
            {
                ModifierDefaults.TryGetValue(modifier, out totalValue);
            }

            totalValue *= GetModMultiplier(modifier);

            return totalValue;
        }

        public double SetMod(Modifier modifier, double value, ModifierOrigin origin)
        {
            AllModifiers[origin][modifier] = value;
            return value;
        }

        public double SetModDefault(Modifier modifier, double value)
        {
            ModifierDefaults[modifier] = value;
            return value;
        }

        public double AddMod(Modifier modifier, double value, ModifierOrigin origin)
        {
            double currentValue;
            if (AllModifiers[origin].TryGetValue(modifier, out currentValue))
            {
                value += currentValue;
            }

            return SetMod(modifier, value, origin);
        }

        public double SubtractMod(Modifier modifier, double value, ModifierOrigin origin)
        {
            return AddMod(modifier, -value, origin);
        }

        private double GetModMultiplier(Modifier modifier)
        {
            double multiplier;
            if (ModifierMultipliers.TryGetValue(modifier, out multiplier) == false)
            {
                return 1;
            }

            return multiplier;
        }

        private double SetModMultiplier(Modifier modifier, double value)
        {
            ModifierMultipliers[modifier] = value;
            return value;
        }

        public double MultiplyMod(Modifier modifier, double value)
        {
            double currentMultiplier = GetModMultiplier(modifier);

            return SetModMultiplier(modifier, currentMultiplier * value);
        }

        public double DivideMod(Modifier modifier, double value)
        {
            if (value == 0)
            {
                return GetModMultiplier(modifier);
            }
            return MultiplyMod(modifier, 1 / value);
        }

        public void ClearMods(params ModifierOrigin[] origins)
        {
            foreach (ModifierOrigin origin in origins)
            {
                AllModifiers[origin].Clear();
            }
        }
    }
}
