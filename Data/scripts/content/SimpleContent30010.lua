require ("global")

function onCreate(player, contentArea, director)

	-- NOTES:	
	-- player.SendMessage() is currently needed here as a packet send  
	-- in order to get Yda/Papalymo to properly appear in player's party.
	-- TO-DO: This is weird. Find a better alternative. 

    papalymo = contentArea:SpawnAlly(2290005, "papalymo", 365.9, 4.1, -706.7, -0.7);
 	papalymo.Level = 1;
	papalymo:SetMod(Hp, 500);
	papalymo:SetMod(Mp, 500);
	papalymo:AttachAI(Healer);
	papalymo:CalculateStats();
	player:SendMessage(0, "", "");

    yda = contentArea:SpawnAlly(2290006, "yda", 365.26, 4.1, -700.73, 1.56, 2);
    yda.Level = 1;
	yda:SetMod(Hp, 500);
	yda:SetMod(Mp, 500);
	yda:SetMod(Delay, 12000);
	yda:SetMod(Damage, 70);
	yda:AttachAI(Tank);
	yda:CalculateStats();
	player:SendMessage(0, "", "");

    wolf1 = contentArea:SpawnEnemy(2201407, "wolf1", 374.4, 4.4, -698.7, -1.9);
 	wolf1.Level = 1;
	wolf1:SetMod(Hp, 80);
	wolf1:SetMod(Mp, 100);
	wolf1:SetMod(Damage, 15);
	wolf1:AttachAI(DPS);
	wolf1:CalculateStats();
       
    wolf2 = contentArea:SpawnEnemy(2201407, "wolf2", 375.4, 4.4, -700.24, -2);
	wolf2.Level = 1;
	wolf2:SetMod(Hp, 80);
	wolf2:SetMod(Mp, 100);
	wolf2:SetMod(Damage, 15);
	wolf2:AttachAI(DPS);
	wolf2:CalculateStats();
    
    wolf3 = contentArea:SpawnEnemy(2201407, "wolf3", 375.1, 4.4, -703.6, -1.54);
	wolf3.Level = 1;
	wolf3:SetMod(Hp, 80);
	wolf3:SetMod(Mp, 100);
	wolf3:SetMod(Damage, 15);
	wolf3:AttachAI(DPS);
	wolf3:CalculateStats();

    openingStoper = contentArea:SpawnActor(1090384, "openingstoper", 356.1, 3.7, -701.6, -1.4);
   
	director:AddMember(player);
	director:AddMember(director);
	director:AddMember(yda);
	director:AddMember(papalymo);
	director:AddMember(wolf1);
	director:AddMember(wolf2);
	director:AddMember(wolf3);

	player:IsInParty();
	player:IsPartyLeader();
	player.currentParty:AddMember(yda);
	player.currentParty:AddMember(papalymo);

	monsterParty = MonsterParty.CreateMonsterParty()
	monsterParty:AddMember(wolf1)
	monsterParty:AddMember(wolf2)
	monsterParty:AddMember(wolf3)

	director:StartContentGroup();
end

function onDestroy()
end

