function onCreate(player, contentArea, director)

	pathcompanion = contentArea:SpawnPathCompanion(1070000 + player:GetSNpcSkin(), "pathcompanion", -203.470, 0, -159.578, 1.552, 0, 0, player:GetSNpcNickname());

	director:AddMember(director);
	director:AddMember(pathcompanion);
	
	director:StartContentGroup();	
end

function onDestroy()
end