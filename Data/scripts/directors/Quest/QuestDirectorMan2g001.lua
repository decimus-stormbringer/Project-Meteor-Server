require ("global")
require ("quests/man/man2g0")

function init()
	return "/Director/Quest/QuestDirectorMan2g001";
end

--Actor Class IDs
OPAPPPESI = 1000033;

function onCreateContentArea(players, director, contentArea, contentGroup)

	--Friendly NPCs
	grinnaux = contentArea:SpawnActor(2290015, "grinnaux", -2009.278, -11.894, -931.778, -2.419);
	handeloup = contentArea:SpawnActor(2290016, "handeloup", -2008.337, -11.846, -933.208, -2.243);
	tkebbe = contentArea:SpawnActor(2290017, "tkebbe", -2007.933, -11.759, -935.472, -1.849);
	oapppesi = contentArea:SpawnActor(1000033, "oapppesi", -2013.375, -11.986, -926.686, -2.953);

	-- Enemy NPCs
	spiritofthewood = contentArea:SpawnActor(1000608, "spiritofthewood", -2017.339, -11.072, -947.748, 0.039);

	for _, player in pairs(players) do
        contentGroup:AddMember(player);
    end;
	contentGroup:AddMember(director);
	contentGroup:AddMember(grinnaux);
	contentGroup:AddMember(handeloup);
	contentGroup:AddMember(tkebbe);
	contentGroup:AddMember(oapppesi);
	contentGroup:AddMember(spiritofthewood);
	end

function onEventStarted(player, director, triggerName, classId)
	local classId = npc:GetActorClassId();

	man2g0Quest = player:GetQuest("Man2g0")
	wait(3);
	player:SendMessage(0x1D, "","Combat Sequence Still Work in Progress");
	wait(1);
	player:SendMessage(0x1D,"","Quest Phase Will Automatically Progress in 10 seconds")
	wait(10);
	callClientFunction(player, "delegateEvent", player, man2g0Quest, "processEvent010");
	player:EndEvent();

	man2g0Quest:StartSequence(5);
	player.CurrentArea:ContentFinished();
	GetWorldManager():DoZoneChange(player, 206, nil, 0, 15, 221.580, 10.750, -1249.183, -0.471);