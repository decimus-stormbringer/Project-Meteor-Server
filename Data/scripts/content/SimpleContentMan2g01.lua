
function onCreate(starterPlayer, contentArea, director)
	
	grinnaux = contentArea:SpawnActor(2290015, "grinnaux", -2009.278, -11.894, -931.778, -2.419);
	handeloup = contentArea:SpawnActor(2290016, "handeloup", -2008.337, -11.846, -933.208, -2.243);
	tkebbe = contentArea:SpawnActor(2290017, "tkebbe", -2007.933, -11.759, -935.472, -1.849);
	oapppesi = contentArea:SpawnActor(1000033, "oapppesi", -2013.375, -11.986, -926.686, -2.953);
	
	spiritofthewood = contentArea:SpawnActor(1000608, "spiritofthewood", -2017.339, -11.072, -947.748, 0.039);
	
	director:AddMember(starterPlayer);
	director:AddMember(director);
	director:AddMember(grinnaux);
	director:AddMember(handeloup);
	director:AddMember(tkebbe);
	director:AddMember(oapppesi);
	director:AddMember(spiritofthewood);
	
	director:StartContentGroup();
	
end

function onDestroy()

	

end