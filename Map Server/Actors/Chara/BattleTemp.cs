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

namespace Meteor.Map.Actors.Chara
{
    class BattleTemp
    {
        public float[] castGauge_speed = { 1.0f, 0.25f };
        public bool[] timingCommandFlag = new bool[4];

        // Character's stat "totals" that include all calculations
        // Stats include character's base stats as well as other modifications, such as equipment, point allocation, etc.
        public short[] generalParameter = new short[35];
    }

    public enum GeneralParameterIndex : int
    {
        NameplateShown = 0,
        Targetable = 1,
        NameplateShown2 = 2,
        Strength = 3,
        Vitality = 4,
        Dexterity = 5,
        Intelligence = 6,
        Mind = 7,
        Piety = 8,

        FireResistance = 9,
        IceResistance = 10,
        WindResistance = 11,
        EarthResistance = 12,
        LightningResistance = 13,
        WaterResistance = 14,

        Accuracy = 15,
        Evasion = 16,
        Attack = 17,
        Defense = 18,

        // 19-22 are Critical Hit, but they are not mapped here

        AttackMagicPotency = 23,
        HealingMagicPotency = 24,
        EnhancementMagicPotency = 25,
        EnfeeblingMagicPotency = 26,

        MagicAccuracy = 27,
        MagicEvasion = 28,

        Craftsmanship = 29,
        MagicCraftsmanship = 30,
        Control = 31,

        Gathering = 32,
        Output = 33,
        Perception = 34,
    }
}
