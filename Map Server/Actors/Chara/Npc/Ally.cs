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

using Meteor.Map.actors.chara.ai;
using Meteor.Map.actors.chara.ai.controllers;
using Meteor.Map.Actors;
using Meteor.Map.packets.send.actor;

namespace Meteor.Map.actors.chara.npc
{
    class Ally : BattleNpc
    {
        // todo: ally class is probably not necessary
        public Ally(int actorNumber, ActorClass bnpcId, string uniqueId, Area spawnedArea, float posX, float posY, float posZ, float rot, ushort actorState, uint animId, string displayName)
            : base(actorNumber, bnpcId, uniqueId, spawnedArea, posX, posY, posZ, rot, actorState, animId, displayName)
        {
            aiContainer = new AIContainer(this, new AllyController(this), new PathFind(this), new TargetFind(this));

            //this.currentSubState = SetActorStatePacket.SUB_STATE_MONSTER;
            //this.currentMainState = SetActorStatePacket.MAIN_STATE_ACTIVE;

            //this.currentMainState = actorState;
            //this.animationId = animId;

            //charaWork.property[2] = 1;
            //npcWork.hateType = 1;

            this.hateContainer = new HateContainer(this);
            this.allegiance = CharacterTargetingAllegiance.Player;

            this.DisplayName = displayName;
            this.uniqueIdentifier = uniqueId;

            this.isAutoAttackEnabled = true;
            this.isMovingToSpawn = false;

            spawnX = posX;
            spawnY = posY;
            spawnZ = posZ;
        }
    }
}
