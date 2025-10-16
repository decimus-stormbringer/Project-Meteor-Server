using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Meteor.Map.Actors.Chara.Player
{
    public class PlayerAttributePointAllotment
    {
        public uint CharacterId { get; set; }
        public short ClassId { get; set; }
        public int Strength { get; set; }
        public int Vitality { get; set; }
        public int Dexterity { get; set; }
        public int Intelligence { get; set; }
        public int Mind { get; set; }
        public int Piety { get; set; }
        // calculated values based on character level
        public int TotalPoints { get; private set; }
        public int AttributeMax { get; private set; }
        public PlayerAttributePointAllotment(short classLevel, uint characterId, short classId)
        {
            CharacterId = characterId;
            ClassId = classId;
            if (classLevel >= 10)
            {
                AttributeMax = 3 + ((classLevel - 10) / 2); // 3 + 1 every other level after 10
                TotalPoints = 5 + (classLevel - 10); // 5 + 1 per level after 10
            }
        }
    }
}