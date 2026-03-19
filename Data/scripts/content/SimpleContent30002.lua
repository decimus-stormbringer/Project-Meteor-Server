require ("global")

function onCreate(player, contentArea, director)
	
	yshtola = contentArea:SpawnAlly(2290001, "yshtola", -6, 16.35, 11.58, 2.9);
	yshtola.Level = 1;
	yshtola:SetMod(Hp, 500);
	yshtola:SetMod(Mp, 500);
	yshtola:AttachAI(Healer);
	yshtola:CalculateStats();

	sthalmann = contentArea:SpawnAlly(2290002, "stahlmann", 1.1, 16.35, 17.44, -3.1, 2);
	sthalmann.Level = 1;
	sthalmann:SetMod(Hp, 500);
	sthalmann:SetMod(Mp, 500);
	sthalmann:SetMod(Delay, 12000);
	sthalmann:SetMod(Damage, 80);
	sthalmann:AttachAI(Tank);
	sthalmann:CalculateStats();

	jellyfish1 = contentArea:SpawnEnemy(2205403, "jellyfish1", -4.75, 16.35, 16.86, -3.1);
	jellyfish1.Level = 1;
	jellyfish1:SetMod(Hp, 90);
	jellyfish1:SetMod(Mp, 100);
	jellyfish1:SetMod(Damage, 12);
	jellyfish1:AttachAI(DPS);
	jellyfish1:CalculateStats();
		
	jellyfish2 = contentArea:SpawnEnemy(2205403, "jellyfish2", -2.25, 16.35, 15.55, -2.6);
	jellyfish2.Level = 1;
	jellyfish2:SetMod(Hp, 90);
	jellyfish2:SetMod(Mp, 100);
	jellyfish2:SetMod(Damage, 12);
	jellyfish2:AttachAI(DPS);
	jellyfish2:CalculateStats();	
	
	jellyfish3 = contentArea:SpawnEnemy(2205403, "jellyfish3", -0.8, 16.35, 13.8, -2.5);
	jellyfish3.Level = 1;
	jellyfish3:SetMod(Hp, 90);
	jellyfish3:SetMod(Mp, 100);
	jellyfish3:SetMod(Damage, 12);
	jellyfish3:AttachAI(DPS);
	jellyfish3:CalculateStats();

	director:AddMember(player);
	director:AddMember(director);
	director:AddMember(yshtola);
	director:AddMember(stahlmann);
	director:AddMember(jellyfish1);
	director:AddMember(jellyfish2);
	director:AddMember(jellyfish3);
	
	-- Setup Player Party
	player:IsInParty();
	player:IsPartyLeader();
	player.currentParty:AddMember(yshtola);
	player.currentParty:AddMember(sthalmann);

	-- Setup Monster Party
	monsterParty = MonsterParty.CreateMonsterParty()
	monsterParty:AddMember(jellyfish1)
	monsterParty:AddMember(jellyfish2)
	monsterParty:AddMember(jellyfish3)

	director:StartContentGroup();
end

function onDestroy()	
end