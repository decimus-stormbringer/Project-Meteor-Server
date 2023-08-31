function onCreate(player, contentArea, director)

	pathcompanion = contentArea:SpawnActor(1070000 + player:GetSNpcSkin(), "pathcompanion", player:GetSNpcNickname(), -203.470, 0, -159.578, 1.552);

	director:AddMember(director);
	director:AddMember(pathcompanion);
	
	director:StartContentGroup();	
end

function onDestroy()
end