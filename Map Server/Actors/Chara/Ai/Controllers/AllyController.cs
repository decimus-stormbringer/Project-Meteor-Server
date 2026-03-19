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

using Meteor.Common;
using Meteor.Map.actors.chara.npc;
using Meteor.Map.actors.group;
using Meteor.Map.Actors;
using System;
using System.Collections.Generic;
using Meteor.Map.utils;

namespace Meteor.Map.actors.chara.ai.controllers
{
    // todo: this is probably not needed, can do everything in their script
    class AllyController : BattleNpcController
    {
        protected new Ally owner;
        public AllyController(Ally owner) :
            base(owner)
        {
            this.owner = owner;
        }
        
        protected List<Character> GetContentGroupCharas()
        {
            List<Character> contentGroupCharas = null;

            if (owner.currentContentGroup != null)
            {
                contentGroupCharas = new List<Character>(owner.currentContentGroup.GetMemberCount());
                foreach (var charaId in owner.currentContentGroup.GetMembers())
                {
                    var chara = owner.CurrentArea.FindActorInArea<Character>(charaId);

                    if (chara != null)
                        contentGroupCharas.Add(chara);
                }
            }

            return contentGroupCharas;
        }

        protected override void DoRoamTick(DateTime tick, List<Character> contentGroupCharas = null)
        {
            if (contentGroupCharas == null)
                contentGroupCharas = GetContentGroupCharas();

            base.DoRoamTick(tick, contentGroupCharas);
        }
    }
}
