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

namespace Meteor.Map.actors.chara.npc
{
    enum MobModifier
    {
        None              = 0,
        SpawnLeash        = 1, // how far can i move before i deaggro target
        DetectionRange    = 2, // how close mob can detect target/player.
        BuffChance        = 3, 
        HealChance        = 4,
        SkillUseChance    = 5,
        LinkRadius        = 6,
        MagicDelay        = 7,
        SpecialDelay      = 8,
        ExpBonus          = 9, // 
        IgnoreSpawnLeash  = 10, // pursue target forever
        DrawIn            = 11, // do i suck people in around me
        HpScale           = 12, //
        Assist            = 13, // gotta call the bois 
        NoMove            = 14, // cant move
        ShareTarget       = 15, // use this actor's id as target id
        AttackScript      = 16, // call my script's onAttack whenever i attack
        DefendScript      = 17, // call my script's onDamageTaken whenever i take damage
        SpellScript       = 18, // call my script's onSpellCast whenever i finish casting
        WeaponSkillScript = 19, // call my script's onWeaponSkill whenever i finish using a weaponskill
        AbilityScript     = 20, // call my script's onAbility whenever i finish using an ability
        CallForHelp       = 21, // actor with this id outside of target's party with this can attack me
        FreeForAll        = 22, // any actor can attack me
        Roams             = 23, // Do I walk around?
        RoamDelay         = 24, // What is the delay between roam ticks
        Linked            = 25, // Did I get aggroed via linking? 
        LinkCount         = 26  // How many BattleNPCs got linked with me
    }
}
