
function onCreate(player, contentArea, director)
	
	yshtola = contentArea:SpawnAlly(2290001, "yshtola", -6, 16.35, 11.58, 2.9);
	yshtola.Level = 1;
	yshtola:SetMod(Hp, 500);
	yshtola:SetMod(Mp, 500);
	yshtola:SetMod(MovementSpeed, 5);
	yshtola:CalculateStats();

	stahlmann = contentArea:SpawnAlly(2290002, "stahlmann", 1.1, 16.35, 17.44, 2.65);
	stahlmann.Level = 1;
	stahlmann:SetMod(Hp, 500);
	stahlmann:SetMod(Mp, 500);
	stahlmann:SetMod(MovementSpeed, 5);
	stahlmann:CalculateStats();

	jellyfish1 = contentArea:SpawnEnemy(2205403, "jellyfish1", -3.02+3, 17.35, 14.24, -2.81);
	jellyfish1.Level = 1;
	jellyfish1:SetMod(Hp, 80);
	jellyfish1:SetMod(Mp, 100);
	jellyfish1:SetMod(Damage, 12);
	jellyfish1:SetMod(MovementSpeed, 5);
	jellyfish1:CalculateStats();
		
	jellyfish2 = contentArea:SpawnEnemy(2205403, "jellyfish2", -3.02, 17.35, 14.24, -2.81);
	jellyfish2.Level = 1;
	jellyfish2:SetMod(Hp, 80);
	jellyfish2:SetMod(Mp, 100);
	jellyfish2:SetMod(Damage, 12);
	jellyfish2:SetMod(MovementSpeed, 5);
	jellyfish2:CalculateStats();	
	
	jellyfish3 = contentArea:SpawnEnemy(2205403, "jellyfish3", -3.02-3, 17.35, 14.24, -2.81);
	jellyfish3.Level = 1;
	jellyfish3:SetMod(Hp, 80);
	jellyfish3:SetMod(Mp, 100);
	jellyfish3:SetMod(Damage, 12);
	jellyfish3:SetMod(MovementSpeed, 5);
	jellyfish3:CalculateStats();

	director:AddMember(player);
	director:AddMember(director);
	director:AddMember(yshtola);
	director:AddMember(stahlmann);
	director:AddMember(jellyfish1);
	director:AddMember(jellyfish2);
	director:AddMember(jellyfish3);
	
	player:IsInParty();
	player:IsPartyLeader();
	player.currentParty:AddMember(yshtola);
	player.currentParty:AddMember(stahlmann);

	director:StartContentGroup();
end

function onDestroy()

	

end