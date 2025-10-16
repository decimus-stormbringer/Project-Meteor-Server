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
    class ParameterSave
    {
        /// Current HP of Character
        public short[] hp = new short[8];
        /// Maximum HP of Character
        public short[] hpMax = new short[8];
        /// Current MP of Character
        public short mp;
        /// Maximum MP of Character
        public short mpMax;

        /// Current Class/Job of Character
        public byte[] state_mainSkill = new byte[4];

        /// Level of current Class/Job of Character
        public short state_mainSkillLevel;

        public byte[] state_boostPointForSkill = new byte[4];
         
        public uint[] commandSlot_recastTime = new uint[40];
        public bool[] commandSlot_compatibility = new bool[40];

        public ushort[] giftCommandSlot_commandId = new ushort[10];

        public ushort[] constanceCommandSlot_commandId = new ushort[10];

        public byte abilityCostPoint_used;
        public byte abilityCostPoint_max;

        public byte giftCostPoint_used;
        public byte giftCostPoint_max;

        public byte constanceCostPoint_used;
        public byte constanceCostPoint_max;
    }
}
