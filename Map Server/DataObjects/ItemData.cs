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

using Meteor.Map.actors.chara;
using Meteor.Map.Actors;
using MySql.Data.MySqlClient;
using MoonSharp.Interpreter;
using System;
using System.Collections.Generic;


namespace Meteor.Map.DataObjects
{
    public class ItemData
    {
        //Basic
        public readonly uint catalogID;
        public readonly string name;
        
        //_item sheet
        public readonly string category;
        public readonly int maxStack;
        public readonly bool isRare;
        public readonly bool isExclusive;

        //itemData sheet
        public readonly int durability;
        public readonly int sellPrice;
        public readonly int icon;
        public readonly int kind;
        public readonly int rarity;
        public readonly int isUseable;
        public readonly int mainSkill;
        public readonly int subSkill;
        public readonly int levelType;
        public readonly int level;
        public readonly int compatibility;
        public readonly float effectMagnitude;
        public readonly float effectRate;
        public readonly float shieldBlocking;
        public readonly float effectDuration;
        public readonly float recastTime;
        public readonly byte recastGroup;
        public readonly int repairSkill;
        public readonly int repairItem;
        public readonly int repairItemNum;
        public readonly int repairLevel;
        public readonly int repairLicense;

        public ItemData(MySqlDataReader reader)
        {
            catalogID = reader.GetUInt32("catalogID");
            name = reader.GetString("name");

            category = reader.GetString("category");
            maxStack = reader.GetInt32("maxStack");
            isRare = reader.GetBoolean("isRare");
            isExclusive = reader.GetBoolean("isExclusive");

            durability = reader.GetInt32("durability");
            sellPrice = reader.GetInt32("sellPrice");

            icon = reader.GetInt32("icon");
            kind = reader.GetInt32("kind");
            rarity = reader.GetInt32("rarity");
            isUseable = reader.GetInt32("isUseable");
            mainSkill = reader.GetInt32("mainSkill");
            subSkill = reader.GetInt32("subSkill");
            levelType = reader.GetInt32("levelType");
            level = reader.GetInt32("level");
            compatibility = reader.GetInt32("compatibility");
            effectMagnitude = reader.GetFloat("effectMagnitude");
            effectRate = reader.GetFloat("effectRate");
            shieldBlocking = reader.GetFloat("shieldBlocking");
            effectDuration = reader.GetFloat("effectDuration");
            recastTime = reader.GetFloat("recastTime");
            recastGroup = reader.GetByte("recastGroup");
            repairSkill = reader.GetInt32("repairSkill");
            repairItem = reader.GetInt32("repairItem");
            repairItemNum = reader.GetInt32("repairItemNum");
            repairLevel = reader.GetInt32("repairLevel");
            repairLicense = reader.GetInt32("repairLicense");            
        }

        #region Utility Functions
        public bool IsMoney()
        {
            return catalogID >= 1000000 && catalogID <= 1999999;
        }

        public bool IsImportant()
        {
            return catalogID >= 2000001 && catalogID <= 2002048;
        }

        public bool IsFood()
        {
            return catalogID >= 3010000 && catalogID <= 3019999;
        }

        public bool IsDrink()
        {
            return catalogID >= 3010600 && catalogID <= 3010699;
        }

        public bool IsPotion()
        {
            return catalogID >= 3020000 && catalogID <= 3029999;
        }

        public bool IsEquipment()
        {
            return catalogID >= 3900000 && catalogID <= 9999999;
        }

        public bool IsWeapon()
        {
            return IsWeapon(catalogID);
        }

        public static bool IsWeapon(uint catalogID)
        {
            return catalogID >= 3900000 && catalogID <= 7999999;
        }

        public bool IsBattleWeapon()
        {
            return catalogID >= 3900000 && catalogID <= 5999999;
        }

        public bool IsAttackWeapon()
        {
            return catalogID >= 4020000 && catalogID <= 4999999;
        }

        public bool IsNailWeapon()
        {
            return catalogID >= 4020000 && catalogID <= 4029999;
        }

        public bool IsSwordWeapon()
        {
            return catalogID >= 4030000 && catalogID <= 4039999;
        }

        public bool IsAxeWeapon()
        {
            return catalogID >= 4040000 && catalogID <= 4049999;
        }

        public bool IsRapierWeapon()
        {
            return catalogID >= 4050000 && catalogID <= 4059999;
        }

        public bool IsMaceWeapon()
        {
            return catalogID >= 4060000 && catalogID <= 4069999;
        }

        public bool IsBowWeapon()
        {
            return catalogID >= 4070000 && catalogID <= 4079999;
        }

        public bool IsLanceWeapon()
        {
            return catalogID >= 4080000 && catalogID <= 4089999;
        }

        public bool IsGunWeapon()
        {
            return catalogID >= 4090000 && catalogID <= 4099999;
        }

        public bool IsLongRangeWeapon()
        {
            return catalogID >= 4050000 && catalogID <= 4059999;
        }

        public bool IsShotWeapon()
        {
            return !IsBowWeapon() ? IsGunWeapon() : false;
        }

        public bool IsAmmoWeapon()
        {
            return !IsThrowWeapon() && !IsArrowWeapon();
        }

        public bool IsThrowWeapon()
        {
            return catalogID >= 3910000 && catalogID <= 3919999;
        }

        public bool IsArrowWeapon()
        {
            return catalogID >= 3920000 && catalogID <= 3929999;
        }

        public bool IsBulletWeapon()
        {
            return catalogID >= 3930000 && catalogID <= 3939999;
        }

        public bool IsShieldWeapon()
        {
            return IsShieldWeapon(catalogID);
        }

        public static bool IsShieldWeapon(uint catalogID)
        {
            return catalogID >= 4100000 && catalogID <= 4109999;
        }

        public bool IsManualGuardShieldWeapon()
        {
            return IsShieldWeapon() && GetShieldGuardTime() != -1;
        }

        public bool IsMagicWeapon()
        {
            return catalogID >= 5000000 && catalogID <= 5999999;
        }

        public bool IsMysticWeapon()
        {
            return catalogID >= 5010000 && catalogID <= 5019999;
        }

        public bool IsThaumaturgeWeapon()
        {
            return catalogID >= 5020000 && catalogID <= 5029999;
        }

        public bool IsConjurerWeapon()
        {
            return catalogID >= 5030000 && catalogID <= 5039999;
        }

        public bool IsArchanistWeapon()
        {
            return catalogID >= 5040000 && catalogID <= 5049999;
        }

        public bool IsCraftWeapon()
        {
            return catalogID >= 6000000 && catalogID <= 6999999;
        }

        public bool IsCarpenterWeapon()
        {
            return catalogID >= 6010000 && catalogID <= 6019999;
        }

        public bool IsBlackSmithWeapon()
        {
            return catalogID >= 6020000 && catalogID <= 6029999;
        }

        public bool IsArmorerWeapon()
        {
            return catalogID >= 6030000 && catalogID <= 6039999;
        }

        public bool IsGoldSmithWeapon()
        {
            return catalogID >= 6040000 && catalogID <= 6049999;
        }

        public bool IsTannerWeapon()
        {
            return catalogID >= 6050000 && catalogID <= 6059999;
        }

        public bool IsWeaverWeapon()
        {
            return catalogID >= 6060000 && catalogID <= 6069999;
        }

        public bool IsAlchemistWeapon()
        {
            return catalogID >= 6070000 && catalogID <= 6079999;
        }

        public bool IsCulinarianWeapon()
        {
            return catalogID >= 6080000 && catalogID <= 6089999;
        }

        public bool IsHarvestWeapon()
        {
            return catalogID >= 7000000 && catalogID <= 7999999;
        }

        public bool IsMinerWeapon()
        {
            return catalogID >= 7010000 && catalogID <= 7019999;
        }

        public bool IsBotanistWeapon()
        {
            return catalogID >= 7020000 && catalogID <= 7029999;
        }

        public bool IsFishingWeapon()
        {
            return catalogID >= 7030000 && catalogID <= 7039999;
        }

        public bool IsShepherdWeapon()
        {
            return catalogID >= 7040000 && catalogID <= 7049999;
        }

        public bool IsFishingBaitWeapon()
        {
            return catalogID >= 3940000 && catalogID <= 3949999;
        }

        public bool IsFishingLureWeapon()
        {
            return catalogID >= 3940100 && catalogID <= 3940199;
        }

        public bool IsArmor()
        {
            return catalogID >= 8000000 && catalogID <= 8999999;
        }

        public static bool IsArmor(uint catalogID)
        {
            return catalogID >= 8000000 && catalogID <= 8999999;
        }

        public bool IsAccessory()
        {
            return catalogID >= 9000000 && catalogID <= 9079999;
        }

        public static bool IsAccessory(uint catalogID)
        {
            return catalogID >= 9000000 && catalogID <= 9079999;
        }

        public bool IsAmulet()
        {
            return catalogID >= 9080000 && catalogID <= 9089999;
        }

        public static bool IsEnchantMateria(uint catalogID)
        {
            return catalogID >= 10100000 && catalogID <= 10199999;
        }

        public bool IsMaterial()
        {
            return catalogID >= 10000000 && catalogID <= 10999999;
        }

        public bool IsEventItem()
        {
            return catalogID >= 11000000 && catalogID <= 15000000;
        }

        public bool IsUseForBattle()
        {
            return false;
        }

        public bool IsHostilityItem()
        {
            return true;
        }

        public bool IsUsable()
        {
            return isUseable != 0;
        }

        public bool IsUseFree()
        {
            return isUseable == -1;
        }

        public bool IsLostAfterUsed()
        {
            return !IsEquipment();
        }

        public int GetShieldGuardTime()
        {
            return -1;
        }

        public Double GetItemHQValue(float value1, float value2)
        {
            return Math.Max(value1 + 1, Math.Ceiling(value1 * value2));
        }

        public int GetLevel()
        {
            return level;
        }

        public bool IsLevelRestricted()
        {
            return levelType == 1;
        }

        public double GetCompatibilityMultiplier(Job job)
        {
            return Server.GetCompatibilityGamedata(compatibility)?.GetCompatibilityMultiplier(job) ?? 0;
        }

        public double GetLevelPenaltyMultiplier(short characterLevel)
        {
            // TODO: Update formula to reflect 1.23b verified data. Note that the formula is roughly correct
            int itemLevel = GetLevel();
            if (characterLevel >= itemLevel)
            {
                return 1;
            }

            // higher level items have more drastic penalties applied
            double penaltyMultiplier = itemLevel <= 10 ? .5 : itemLevel <= 20 ? .35 : itemLevel <= 30 ? .3 : .11;

            // as character level approaches item level, gain some potency back (roughly 10% each level within 6 of item level)
            int levelDifference = itemLevel - characterLevel;
            if (levelDifference < 7)
            {
                penaltyMultiplier = Math.Min(.90, penaltyMultiplier + ((7 - levelDifference) * .1));
            }

            return penaltyMultiplier;
        }

        public short GetModAfterMultipliers(double value, params double[] multipliers)
        {
            foreach (double multiplier in multipliers)
            {
                value = (short)(value * multiplier);
            }
            return (short)value;
        }

        protected void AddModToList(IList<ModifierData> mods, int bonusType, short bonusValue)
        {
            Modifier? mod = GetBonusMod(bonusType);
            if (mod == null)
            {
                return;
            }

            AddModToList(mods, mod.Value, bonusValue);
        }

        protected void AddModToList(IList<ModifierData> mods, Modifier modifier, short bonusValue)
        {
            mods.Add(new ModifierData
            {
                Modifier = modifier,
                EndValue = bonusValue
            });
        }

        protected Modifier? GetBonusMod(int bonusType)
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

        #endregion

    }

    class EquipmentItem : ItemData
    {
        //graphics
        public readonly uint graphicsWeaponId;
        public readonly uint graphicsEquipmentId;
        public readonly uint graphicsVariantId;
        public readonly uint graphicsColorId;
   
        //equipment sheet
        public readonly int equipPoint;
        public readonly short equipTribe;

        public readonly int paramBonusType1;
        public readonly short paramBonusValue1;
        public readonly int paramBonusType2;
        public readonly short paramBonusValue2;
        public readonly int paramBonusType3;
        public readonly short paramBonusValue3;
        public readonly int paramBonusType4;
        public readonly short paramBonusValue4;
        public readonly int paramBonusType5;
        public readonly short paramBonusValue5;
        public readonly int paramBonusType6;
        public readonly short paramBonusValue6;
        public readonly int paramBonusType7;
        public readonly short paramBonusValue7;
        public readonly int paramBonusType8;
        public readonly short paramBonusValue8;
        public readonly int paramBonusType9;
        public readonly short paramBonusValue9;
        public readonly int paramBonusType10;
        public readonly short paramBonusValue10;

        public readonly short AdditionalEffect;
        public readonly bool materialBindPermission;
        public readonly short materializeTable;

        public EquipmentItem(MySqlDataReader reader) 
            : base (reader)
        {
            if (!reader.IsDBNull(reader.GetOrdinal("weaponId")) && !reader.IsDBNull(reader.GetOrdinal("equipmentId")) && !reader.IsDBNull(reader.GetOrdinal("variantId")) && !reader.IsDBNull(reader.GetOrdinal("colorId")))
            {
                graphicsWeaponId = reader.GetUInt32("weaponId");
                graphicsEquipmentId = reader.GetUInt32("equipmentId");
                graphicsVariantId = reader.GetUInt32("variantId");
                graphicsColorId = reader.GetUInt32("colorId");
            }

            equipPoint = reader.GetInt32("equipPoint");
            equipTribe = reader.GetInt16("equipTribe");

            paramBonusType1 = reader.GetInt32("paramBonusType1");
            paramBonusValue1 = reader.GetInt16("paramBonusValue1");
            paramBonusType2 = reader.GetInt32("paramBonusType2");
            paramBonusValue2 = reader.GetInt16("paramBonusValue2");
            paramBonusType3 = reader.GetInt32("paramBonusType3");
            paramBonusValue3 = reader.GetInt16("paramBonusValue3");
            paramBonusType4 = reader.GetInt32("paramBonusType4");
            paramBonusValue4 = reader.GetInt16("paramBonusValue4");
            paramBonusType5 = reader.GetInt32("paramBonusType5");
            paramBonusValue5 = reader.GetInt16("paramBonusValue5");
            paramBonusType6 = reader.GetInt32("paramBonusType6");
            paramBonusValue6 = reader.GetInt16("paramBonusValue6");
            paramBonusType7 = reader.GetInt32("paramBonusType7");
            paramBonusValue7 = reader.GetInt16("paramBonusValue7");
            paramBonusType8 = reader.GetInt32("paramBonusType8");
            paramBonusValue8 = reader.GetInt16("paramBonusValue8");
            paramBonusType9 = reader.GetInt32("paramBonusType9");
            paramBonusValue9 = reader.GetInt16("paramBonusValue9");
            paramBonusType10 = reader.GetInt32("paramBonusType10");
            paramBonusValue10 = reader.GetInt16("paramBonusValue10");

            AdditionalEffect = reader.GetInt16("additionalEffect");
            materialBindPermission = reader.GetBoolean("materiaBindPermission");
            materializeTable = reader.GetInt16("materializeTable");
        }

        public virtual IList<ModifierData> GetModifiers(short level, Job job)
        {
            List<ModifierData> mods = new List<ModifierData>();

            if (level >= GetLevel())
            {
                double compatibilityModifier = GetCompatibilityMultiplier(job);

                // param 1 is for specifying that the item satisfies a requirement modifier for param 2 and/or that param 2 requires param 1's criteria to be met
                // param 1 could be "sanction" or "N pieces of grand company gear equipped", while param 2 will be a normal bonus modifier
                Modifier? param1BonusMod = GetBonusMod(paramBonusType1);
                if (param1BonusMod != null)
                {
                    ModifierData param1Mod = new ModifierData { Modifier = param1BonusMod.Value, EndValue = paramBonusValue1 };
                    mods.Add(param1Mod);

                    Modifier? param2BonusMod = GetBonusMod(paramBonusType2);
                    if (param2BonusMod != null)
                    {
                        ModifierData param2Mod = new ModifierData { Modifier = param2BonusMod.Value, EndValue = GetModAfterMultipliers(paramBonusValue2, compatibilityModifier), PrerequisiteModifier = param1Mod };
                        mods.Add(param2Mod);
                    }
                }

                // param 3 is for equipment special effects that are either "on" or "off"
                // param 3 could be "cannot equip gear to head" or "chance to restore mp", etc.
                // in the database, param value 3 is always "0", so override it as "1" to enable the effect when param type 3 is present
                var param3BonusMod = GetBonusMod(paramBonusType3);
                if (param3BonusMod != null)
                {
                    mods.Add(new ModifierData { Modifier = param3BonusMod.Value, EndValue = 1 });
                }

                AddModToList(mods, paramBonusType4, GetModAfterMultipliers(paramBonusValue4, compatibilityModifier));
                AddModToList(mods, paramBonusType5, GetModAfterMultipliers(paramBonusValue5, compatibilityModifier));
                AddModToList(mods, paramBonusType6, GetModAfterMultipliers(paramBonusValue6, compatibilityModifier));
                AddModToList(mods, paramBonusType7, GetModAfterMultipliers(paramBonusValue7, compatibilityModifier));
                AddModToList(mods, paramBonusType8, GetModAfterMultipliers(paramBonusValue8, compatibilityModifier));
                AddModToList(mods, paramBonusType9, GetModAfterMultipliers(paramBonusValue9, compatibilityModifier));
                AddModToList(mods, paramBonusType10, GetModAfterMultipliers(paramBonusValue10, compatibilityModifier));

            }

            return mods;
        }
    }

    class WeaponItem : EquipmentItem
    {
        //extra graphics
        public readonly uint graphicsOffhandWeaponId;
        public readonly uint graphicsOffhandEquipmentId;
        public readonly uint graphicsOffhandVariantId;

        //weapon sheet
        public readonly short attack;
        public readonly short magicAttack;
        public readonly short craftProcessing;
        public readonly short craftMagicProcessing;
        public readonly short harvestPotency;
        public readonly short harvestLimit;
        public readonly byte frequency; // hit count, 2 for h2h weapons
        public readonly short rate;
        public readonly short magicRate;
        public readonly short craftProcessControl;
        public readonly short harvestRate;
        public readonly short critical;
        public readonly short magicCritical;
        public readonly short parry;

        public readonly int damageAttributeType1; // 1 slashing, 2 piercing, 3 blunt, 4 projectile
        public readonly float damageAttributeValue1;
        public readonly int damageAttributeType2;
        public readonly float damageAttributeValue2;
        public readonly int damageAttributeType3;
        public readonly float damageAttributeValue3;

        public readonly short damagePower;
        public readonly float damageInterval;
        public readonly short ammoVirtualDamagePower;
        public readonly float dps;

        public WeaponItem(MySqlDataReader reader)
            : base(reader)
        {
            if (!reader.IsDBNull(reader.GetOrdinal("offHandWeaponId")) && !reader.IsDBNull(reader.GetOrdinal("offHandEquipmentId")) && !reader.IsDBNull(reader.GetOrdinal("offHandVarientId")))
            {
                graphicsOffhandWeaponId = reader.GetUInt32("offHandWeaponId");
                graphicsOffhandEquipmentId = reader.GetUInt32("offHandEquipmentId");
                graphicsOffhandVariantId = reader.GetUInt32("offHandVarientId");
            }

            attack = reader.GetInt16("attack");
            magicAttack = reader.GetInt16("magicAttack");
            craftProcessing = reader.GetInt16("craftProcessing");
            craftMagicProcessing = reader.GetInt16("craftMagicProcessing");
            harvestPotency = reader.GetInt16("harvestPotency");
            harvestLimit = reader.GetInt16("harvestLimit");
            frequency = reader.GetByte("frequency");
            rate = reader.GetInt16("rate");
            magicRate = reader.GetInt16("magicRate");
            craftProcessControl = reader.GetInt16("craftProcessControl");
            harvestRate = reader.GetInt16("harvestRate");
            critical = reader.GetInt16("critical");
            magicCritical = reader.GetInt16("magicCritical");
            parry = reader.GetInt16("parry");

            damageAttributeType1 = reader.GetInt32("damageAttributeType1");
            damageAttributeValue1 = reader.GetFloat("damageAttributeValue1");
            damageAttributeType2 = reader.GetInt32("damageAttributeType2");
            damageAttributeValue2 = reader.GetFloat("damageAttributeValue2");
            damageAttributeType3 = reader.GetInt32("damageAttributeType3");
            damageAttributeValue3 = reader.GetFloat("damageAttributeValue3");

            damagePower = reader.GetInt16("damagePower");
            damageInterval = reader.GetFloat("damageInterval");
            ammoVirtualDamagePower = reader.GetInt16("ammoVirtualDamagePower");
            dps = (damagePower + ammoVirtualDamagePower) / damageInterval;
        }

        public override IList<ModifierData> GetModifiers(short level, Job job)
        {
            IList<ModifierData> mods = base.GetModifiers(level, job);

            double compatibilityMultiplier = GetCompatibilityMultiplier(job);
            double levelPenaltyMultiplier = GetLevelPenaltyMultiplier(level);

            if (level >= GetLevel())
            {
                AddModToList(mods, Modifier.Craftsmanship, GetModAfterMultipliers(craftProcessing, compatibilityMultiplier));
                AddModToList(mods, Modifier.MagicCraftsmanship, GetModAfterMultipliers(craftMagicProcessing, compatibilityMultiplier));
                AddModToList(mods, Modifier.Control, GetModAfterMultipliers(craftProcessControl, compatibilityMultiplier));
            }

            if (IsHarvestWeapon() && level >= GetLevel())
            {
                AddModToList(mods, Modifier.Gathering, GetModAfterMultipliers(harvestPotency, compatibilityMultiplier));
                AddModToList(mods, Modifier.Output, GetModAfterMultipliers(harvestLimit, compatibilityMultiplier));
                AddModToList(mods, Modifier.Perception, GetModAfterMultipliers(harvestRate, compatibilityMultiplier));
            }

            if (damageInterval > 0)
            {
                AddModToList(mods, Modifier.Damage, GetModAfterMultipliers(damagePower, compatibilityMultiplier, levelPenaltyMultiplier));

                AddModToList(mods, Modifier.AttackType, (short)damageAttributeType1);
                AddModToList(mods, Modifier.Delay, (short)(damageInterval * 1000));
                AddModToList(mods, Modifier.HitCount, frequency);
            }

            if (IsShieldWeapon())
            {
                AddModToList(mods, Modifier.Block, GetModAfterMultipliers(effectMagnitude, compatibilityMultiplier, levelPenaltyMultiplier));
                AddModToList(mods, Modifier.BlockRate, GetModAfterMultipliers(effectRate, compatibilityMultiplier, levelPenaltyMultiplier));
                AddModToList(mods, Modifier.CanBlock, 1);
            }

                return mods;
        }
    }

    class ArmorItem : EquipmentItem
    {
        //armor sheet
        public readonly short defense;
        public readonly short magicDefense;
        public readonly short criticalDefense;
        public readonly short evasion;
        public readonly short magicResistance;

        public readonly int damageDefenseType1;
        public readonly short damageDefenseValue1;
        public readonly int damageDefenseType2;
        public readonly short damageDefenseValue2;
        public readonly int damageDefenseType3;
        public readonly short damageDefenseValue3;
        public readonly int damageDefenseType4;
        public readonly short damageDefenseValue4;

        public ArmorItem(MySqlDataReader reader)
            : base(reader)
        {
            defense = reader.GetInt16("defense");
            magicDefense = reader.GetInt16("magicDefense");
            criticalDefense = reader.GetInt16("criticalDefense");
            evasion = reader.GetInt16("evasion");
            magicResistance = reader.GetInt16("magicResistance");

            damageDefenseType1 = reader.GetInt32("damageDefenseType1");
            damageDefenseValue1 = reader.GetInt16("damageDefenseValue1");
            damageDefenseType2 = reader.GetInt32("damageDefenseType2");
            damageDefenseValue2 = reader.GetInt16("damageDefenseValue2");
            damageDefenseType3 = reader.GetInt32("damageDefenseType3");
            damageDefenseValue3 = reader.GetInt16("damageDefenseValue3");
            damageDefenseType4 = reader.GetInt32("damageDefenseType4");
            damageDefenseValue4 = reader.GetInt16("damageDefenseValue4");
        }

        public override IList<ModifierData> GetModifiers(short level, Job job)
        {
            IList<ModifierData> mods = base.GetModifiers(level, job);

            double compatibilityMultiplier = GetCompatibilityMultiplier(job);
            double levelPenaltyMultiplier = GetLevelPenaltyMultiplier(level);

            AddModToList(mods, Modifier.Defense, GetModAfterMultipliers(defense, compatibilityMultiplier, levelPenaltyMultiplier));


            return mods;
        }
    }

    class AccessoryItem : ArmorItem
    {
        //accessory sheet
        public readonly byte power;
        public readonly byte size;

        public AccessoryItem(MySqlDataReader reader)
            : base(reader)
        {
            power = reader.GetByte("power");
            size = reader.GetByte("size");
        }
    }

    /// <summary>
    /// There exists one Materia Item per materia tier.
    /// There are 4 materia tiers for each materia type.
    /// Each Materia Item has 4 bonus values per bonus type, one for each grade.
    /// </summary>
    public class MateriaItem : ItemData
    {
        public readonly ushort Id;
        public readonly int Bonus1Type;
        public readonly short Bonus1Value0;
        public readonly short Bonus1Value1;
        public readonly short Bonus1Value2;
        public readonly short Bonus1Value3;
        public readonly int Bonus2Type;
        public readonly short Bonus2Value0;
        public readonly short Bonus2Value1;
        public readonly short Bonus2Value2;
        public readonly short Bonus2Value3;
        #region Meldable (per item type)
        public readonly bool Meldable1;
        public readonly bool Meldable2;
        public readonly bool Meldable3;
        public readonly bool Meldable4;
        public readonly bool Meldable5;
        public readonly bool Meldable6;
        public readonly bool Meldable7;
        public readonly bool Meldable8;
        public readonly bool Meldable9;
        public readonly bool Meldable10;
        public readonly bool Meldable11;
        public readonly bool Meldable12;
        public readonly bool Meldable13;
        public readonly bool Meldable14;
        public readonly bool Meldable15;
        public readonly bool Meldable16;
        public readonly bool Meldable17;
        public readonly bool Meldable18;
        public readonly bool Meldable19;
        public readonly bool Meldable20;
        public readonly bool Meldable21;
        public readonly bool Meldable22;
        public readonly bool Meldable23;
        public readonly bool Meldable24;
        public readonly bool Meldable25;
        public readonly bool Meldable26;
        public readonly bool Meldable27;
        public readonly bool Meldable28;
        public readonly bool Meldable29;
        public readonly bool Meldable30;
        public readonly bool Meldable31;
        public readonly bool Meldable32;
        public readonly bool Meldable33;
        public readonly bool Meldable34;
        public readonly bool Meldable35;
        public readonly bool Meldable36;
        public readonly bool Meldable37;
        public readonly bool Meldable38;

        #endregion

        public MateriaItem(MySqlDataReader reader)
            : base(reader)
        {
            // some materia exists as a game item, but not as a materia modifier. they are not valid and have been removed from the game
            bool isInvalid = reader.IsDBNull(reader.GetOrdinal("id"));
            if (isInvalid)
            {
                return;
            }
            Id = reader.GetUInt16("id");
            Bonus1Type = reader.GetInt32("bonus1Type");
            Bonus2Type = reader.GetInt32("bonus2Type");
            if (catalogID == reader.GetUInt32("tier1CatalogID"))
            {
                Bonus1Value0 = reader.GetInt16("bonus1Grade0Value");
                Bonus1Value1 = reader.GetInt16("bonus1Grade1Value");
                Bonus1Value2 = reader.GetInt16("bonus1Grade2Value");
                Bonus1Value3 = reader.GetInt16("bonus1Grade3Value");
                Bonus2Value0 = reader.GetInt16("bonus2Grade0Value");
                Bonus2Value1 = reader.GetInt16("bonus2Grade1Value");
                Bonus2Value2 = reader.GetInt16("bonus2Grade2Value");
                Bonus2Value3 = reader.GetInt16("bonus2Grade3Value");
            }
            else if (catalogID == reader.GetUInt32("tier2CatalogID"))
            {
                Bonus1Value0 = reader.GetInt16("bonus1Grade4Value");
                Bonus1Value1 = reader.GetInt16("bonus1Grade5Value");
                Bonus1Value2 = reader.GetInt16("bonus1Grade6Value");
                Bonus1Value3 = reader.GetInt16("bonus1Grade7Value");
                Bonus2Value0 = reader.GetInt16("bonus2Grade4Value");
                Bonus2Value1 = reader.GetInt16("bonus2Grade5Value");
                Bonus2Value2 = reader.GetInt16("bonus2Grade6Value");
                Bonus2Value3 = reader.GetInt16("bonus2Grade7Value");
            }
            else if (catalogID == reader.GetUInt32("tier3CatalogID"))
            {
                Bonus1Value0 = reader.GetInt16("bonus1Grade8Value");
                Bonus1Value1 = reader.GetInt16("bonus1Grade9Value");
                Bonus1Value2 = reader.GetInt16("bonus1Grade10Value");
                Bonus1Value3 = reader.GetInt16("bonus1Grade11Value");
                Bonus2Value0 = reader.GetInt16("bonus2Grade8Value");
                Bonus2Value1 = reader.GetInt16("bonus2Grade9Value");
                Bonus2Value2 = reader.GetInt16("bonus2Grade10Value");
                Bonus2Value3 = reader.GetInt16("bonus2Grade11Value");
            }
            else if (catalogID == reader.GetUInt32("tier4CatalogID"))
            {
                Bonus1Value0 = reader.GetInt16("bonus1Grade12Value");
                Bonus1Value1 = reader.GetInt16("bonus1Grade13Value");
                Bonus1Value2 = reader.GetInt16("bonus1Grade14Value");
                Bonus1Value3 = reader.GetInt16("bonus1Grade15Value");
                Bonus2Value0 = reader.GetInt16("bonus2Grade12Value");
                Bonus2Value1 = reader.GetInt16("bonus2Grade13Value");
                Bonus2Value2 = reader.GetInt16("bonus2Grade14Value");
                Bonus2Value3 = reader.GetInt16("bonus2Grade15Value");
            }
            #region Meldable (per item type)
            Meldable1 = reader.GetBoolean("meldable1");
            Meldable2 = reader.GetBoolean("meldable2");
            Meldable3 = reader.GetBoolean("meldable3");
            Meldable4 = reader.GetBoolean("meldable4");
            Meldable5 = reader.GetBoolean("meldable5");
            Meldable6 = reader.GetBoolean("meldable6");
            Meldable7 = reader.GetBoolean("meldable7");
            Meldable8 = reader.GetBoolean("meldable8");
            Meldable9 = reader.GetBoolean("meldable9");
            Meldable10 = reader.GetBoolean("meldable10");
            Meldable11 = reader.GetBoolean("meldable11");
            Meldable12 = reader.GetBoolean("meldable12");
            Meldable13 = reader.GetBoolean("meldable13");
            Meldable14 = reader.GetBoolean("meldable14");
            Meldable15 = reader.GetBoolean("meldable15");
            Meldable16 = reader.GetBoolean("meldable16");
            Meldable17 = reader.GetBoolean("meldable17");
            Meldable18 = reader.GetBoolean("meldable18");
            Meldable19 = reader.GetBoolean("meldable19");
            Meldable20 = reader.GetBoolean("meldable20");
            Meldable21 = reader.GetBoolean("meldable21");
            Meldable22 = reader.GetBoolean("meldable22");
            Meldable23 = reader.GetBoolean("meldable23");
            Meldable24 = reader.GetBoolean("meldable24");
            Meldable25 = reader.GetBoolean("meldable25");
            Meldable26 = reader.GetBoolean("meldable26");
            Meldable27 = reader.GetBoolean("meldable27");
            Meldable28 = reader.GetBoolean("meldable28");
            Meldable29 = reader.GetBoolean("meldable29");
            Meldable30 = reader.GetBoolean("meldable30");
            Meldable31 = reader.GetBoolean("meldable31");
            Meldable32 = reader.GetBoolean("meldable32");
            Meldable33 = reader.GetBoolean("meldable33");
            Meldable34 = reader.GetBoolean("meldable34");
            Meldable35 = reader.GetBoolean("meldable35");
            Meldable36 = reader.GetBoolean("meldable36");
            Meldable37 = reader.GetBoolean("meldable37");
            Meldable38 = reader.GetBoolean("meldable38");
            #endregion
        }
        public MateriaType? GetMateriaType()
        {
            if (Enum.IsDefined(typeof(MateriaType), Id) == false)
            {
                return null;
            }
            return (MateriaType)Id;
        }
        public IList<ModifierData> GetModifiers(ushort grade, short level, Job job)
        {
            List<ModifierData> mods = new List<ModifierData>();
            if (level >= GetLevel())
            {
                double compatibilityMultiplier = GetCompatibilityMultiplier(job);

                switch (grade % 4)
                {
                    case 0:
                        AddModToList(mods, Bonus1Type, GetModAfterMultipliers(Bonus1Value0, compatibilityMultiplier));
                        AddModToList(mods, Bonus2Type, GetModAfterMultipliers(Bonus2Value0, compatibilityMultiplier));
                        break;
                    case 1:
                        AddModToList(mods, Bonus1Type, GetModAfterMultipliers(Bonus1Value1, compatibilityMultiplier));
                        AddModToList(mods, Bonus2Type, GetModAfterMultipliers(Bonus2Value1, compatibilityMultiplier));
                        break;
                    case 2:
                        AddModToList(mods, Bonus1Type, GetModAfterMultipliers(Bonus1Value2, compatibilityMultiplier));
                        AddModToList(mods, Bonus2Type, GetModAfterMultipliers(Bonus2Value2, compatibilityMultiplier));
                        break;
                    case 3:
                        AddModToList(mods, Bonus1Type, GetModAfterMultipliers(Bonus1Value3, compatibilityMultiplier));
                        AddModToList(mods, Bonus2Type, GetModAfterMultipliers(Bonus2Value3, compatibilityMultiplier));
                        break;
                    default:
                        break;
                }
            }

            return mods;
        }

        public static uint CalculateCatalogID(ushort materiaType, ushort materiaGrade)
        {
            int baseCatalogID = 10100001;
            int tiersPerType = 4;
            int gradesPerTier = 4;
            return (uint)(baseCatalogID + (materiaType * tiersPerType - tiersPerType) + (materiaGrade / gradesPerTier));
        }
    }

    public enum MateriaType : ushort
    {
        HP = 1, // bloodthirst
        MP = 2, // manathirst
        HP_and_MP = 3, // lifethirst
        Strength = 4, // strength
        Vitality = 5, // vitality
        Dexterity = 6, // dexterity
        Intelligence = 7, // intelligence
        Mind = 8, // mind
        Piety = 9, // piety
        Strength_and_Vitality = 10, // ironman's will
        Strength_and_Dexterity = 11, // swordman's cry
        Vitality_and_Dexterity = 12, // watchman's vigil
        Intelligence_and_Mind = 13, // loresman's wit
        Intelligence_and_Piety = 14, // wise man's vision
        Mind_and_Piety = 15, // vestryman's wit
        FireMagicPotency = 16, // fire
        IceMagicPotency = 17, // ice
        WindMagicPotency = 18, // wind
        EarthMagicPotency = 19, // earth
        LightningMagicPotency = 20, // lightning
        WaterMagicPotency = 21, // water
        FireResistance = 22, // fire veil
        IceResistance = 23, // ice veil
        WindResistance = 24, // wind veil
        EarthResistance = 25, // earth veil
        LightningResistance = 26, // lightning veil
        WaterResistance = 27, // water veil
        AttackPower = 28, // heaven's fist
        Accuracy = 29, // heaven's eye
        AttackMagicPotency = 30, // hell's fist
        MagicAccuracy = 31, // hell's eye
        CriticalHitRate = 32, // savage aim
        CriticalAttackPower = 33, // savage might
        // 34 sagacious aim materia, crashes the client
        MagicCriticalPotency = 35, // sagacious might
        Parry = 36, // battledance
        Gathering = 37, // gatherer's guerdon
        Perception = 38, // gatherer's guile
        Output = 39, // gatherer's grasp
        Craftsmanship = 40, // craftman's competence
        MagicCraftsmanship = 41, // craftman's cunning
        Control = 42, // craftman's command
        Evasion = 43, // bloodflight
        MagicEvasion = 44, // manaflight
        Defense = 45, // bloodwall
        // 46 manawall materia, crashes the client
        SlowResistance = 47, // cactuar foot
        PetrificationResistance = 48, // wyvern skin
        ParalysisResistance = 49, // bomb blood
        SilenceResistance = 50, // pixie tongue
        BlindResistance = 51, // coeurl eye
        PoisonResistance = 52, // aurelia kiss
        StunResistance = 53, // bison hoof
        SleepResistance = 54, // funguar shriek
        BindResistance = 55, // treant root
        HeavyResistance = 56, // chocobo down
        // 57 ahriman gaze materia, not in game
        // 58 bloodflow materia, crashes the client
        // 59 manaflow materia, crashes the client
        // 60 mettleflow materia, crashes the client
        EnmityPlus = 61, // touch of rage
        EnmityMinus = 62, // touch of serenity
        // 63 everspike materia, crashes the client
        // 64 soldier's step materia, crashes the client
        // 65 sorcerer's step materia, crashes the client
        // 66 sprinter's step materia, crashes the client
        // 67 savant's step materia, not tested
        HealingMagicPotency = 68, // healer's hand
        // 69 breath of fire materia, not tested
        // 70 breath of ice materia, not tested
        // 71 breath of wind materia, not tested
        // 72 breath of earth materia, not tested
        // 73 breath of lightning materia, not tested
        // 74 breath of water materia, not tested
        // 75 bloodbringer materia, not tested
        // 76 manabringer materia, not tested
        // 77 mettlebringer materia, not tested
        // 78 mana martyr materia, not tested
        // 79 mettle martyr materia, not tested
        // 80 byregot's hammer materia, not tested
        // 81 menphina's whisper materia, not tested
        CriticalAttackPower_and_HP = 82, // sanguinary might
        MagicCriticalPotency_and_MP = 83, // stellar might
        HealingMagicPotency_and_MP = 84, // sound of serenity
        EnhancementMagicPotency = 85, // sound of certainty
        EnfeeblingMagicPotency = 86, // sound of suffering
        BlockRatePlus = 87, // swift wall
        StoreTP_and_Accuracy = 88, // evenflow
    }
}
