
function onCreate(player, contentArea, director)

    yda = contentArea:SpawnAlly(2290006, "yda", 365.26, 4.1, -700.73, 1.56);
    yda.Level = 1;
	yda:SetMod(Hp, 500);
	yda:SetMod(Mp, 500);
	yda:SetMod(MovementSpeed, 5);
	yda:CalculateStats();

    papalymo = contentArea:SpawnAlly(2290005, "papalymo", 365.9, 4.1, -706.7, -0.7);
 	papalymo.Level = 1;
	papalymo:SetMod(Hp, 500);
	papalymo:SetMod(Mp, 500);
	papalymo:SetMod(MovementSpeed, 5);
	papalymo:CalculateStats();

    wolf1 = contentArea:SpawnEnemy(2201407, "wolf1", 374.4, 4.4, -698.7, -1.9);
 	wolf1.Level = 1;
	wolf1:SetMod(Hp, 80);
	wolf1:SetMod(Mp, 100);
	wolf1:SetMod(Damage, 15);
	wolf1:SetMod(MovementSpeed, 5);
	wolf1:CalculateStats();
       
    wolf2 = contentArea:SpawnEnemy(2201407, "wolf2", 375.4, 4.4, -700.24, -2);
	wolf2.Level = 1;
	wolf2:SetMod(Hp, 80);
	wolf2:SetMod(Mp, 100);
	wolf2:SetMod(Damage, 15);
	wolf2:SetMod(MovementSpeed, 5);
	wolf2:CalculateStats();
    
    wolf3 = contentArea:SpawnEnemy(2201407, "wolf3", 375.1, 4.4, -703.6, -1.54);
	wolf3.Level = 1;
	wolf3:SetMod(Hp, 80);
	wolf3:SetMod(Mp, 100);
	wolf3:SetMod(Damage, 15);
	wolf3:SetMod(MovementSpeed, 5);
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


	director:StartContentGroup();
end

function onDestroy()

end

