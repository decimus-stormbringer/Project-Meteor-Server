
function onCreate(player, contentArea, director)
	
	thancred = contentArea:SpawnAlly(2290004, "thancred", -17.3, 192, 42.3, 1.1);
	thancred.Level = 1;
	thancred:SetMod(Hp, 500);
	thancred:SetMod(Mp, 500);
	thancred:ChangeState(2);
	thancred:CalculateStats();

	niellefresne = contentArea:SpawnAlly(2290003, "niellefresne", -14.37, 192, 37, -0.6);
	niellefresne.Level = 1;
	niellefresne:SetMod(Hp, 500);
	niellefresne:SetMod(Mp, 500);
	niellefresne:CalculateStats();

	goobbue = contentArea:SpawnEnemy(2203301, "goobbue", -12.1, 192, 42.96, -2.3);
	goobbue.Level = 1;
	goobbue:SetMod(Hp, 200);
	goobbue:SetMod(Mp, 200);
	goobbue:SetMod(Damage, 15);
	goobbue:SetMod(MovementSpeed, 5);
	goobbue:CalculateStats();

	openingStoper = contentArea:SpawnActor(1090385, "openingstoper", -24.34, 192, 34.22, 0);
	
	director:AddMember(player);
	director:AddMember(director);
	director:AddMember(niellefresne);
	director:AddMember(thancred);
	director:AddMember(goobbue);

	player:IsInParty();
	player:IsPartyLeader();
	player.currentParty:AddMember(thancred);
	player.currentParty:AddMember(niellefresne);
	
	director:StartContentGroup();	
end

function onDestroy()
	
end