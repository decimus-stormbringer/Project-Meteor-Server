require ("global")
require ("tutorial")
require ("quests/man/man0g0")

--processTtrBtl001: Active Mode Tutorial - DoW only
--processTtrBtl002: Targetting Tutorial (After active mode done)

function init()
	return "/Director/Quest/QuestDirectorMan0g001";
end

function onCreateContentArea(players, director, contentArea, contentGroup)

    papalymo = contentArea:SpawnActor(2290005, "papalymo", 365.89, 4.0943, -706.72, -0.718);
    yda = contentArea:SpawnActor(2290006, "yda", 365.266, 4.122, -700.73, 1.5659);

    mob1 = contentArea:SpawnActor(2201407, "mob1", 374.427, 4.4, -698.711, -1.942);
    mob2 = contentArea:SpawnActor(2201407, "mob2", 375.377, 4.4, -700.247, -1.992);
    mob3 = contentArea:SpawnActor(2201407, "mob3", 375.125, 4.4, -703.591, -1.54);
    
    openingStoper = contentArea:SpawnActor(1090384, "openingstoper", 356.09, 3.74, -701.62, -1.41);
	
	for _, player in pairs(players) do
        contentGroup:AddMember(player);
    end;

    

	contentGroup:AddMember(director);
    contentGroup:AddMember(yda);
    contentGroup:AddMember(papalymo);
	contentGroup:AddMember(mob1);
	contentGroup:AddMember(mob2);
	contentGroup:AddMember(mob3);

end

function onEventStarted(player, director, triggerName)	

	man0g0Quest = player:GetQuest("Man0g0");
	startTutorialMode(player);
	callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl001", nil, nil, nil);
	player:EndEvent();	
   	waitForSignal("playerActive");
	wait(1); --If this isn't here, the scripts bugs out. TODO: Find a better alternative.	
	kickEventContinue(player, director, "noticeEvent", "noticeEvent");	
	callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl002", nil, nil, nil);	
	player:EndEvent();	
	wait(4);
	closeTutorialWidget(player);
	showTutorialSuccessWidget(player, 9055); --Open TutorialSuccessWidget for attacking enemy
	wait(3);
	openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_TP);
	wait(5);
	closeTutorialWidget(player);
	openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_WEAPONSKILLS);
	wait(4); --Should be wait for weaponskillUsed signal
	closeTutorialWidget(player);
	showTutorialSuccessWidget(player, 9065); --Open TutorialSuccessWidget for weapon skill
	wait(6); --Should be wait for mobkill
	worldMaster = GetWorldMaster();
	attentionMessage(player, 51073, 1);
	wait(7); -- end of fight?
	player:ChangeMusic(7);
	player:ChangeState(0); 
	kickEventContinue(player, director, "noticeEvent", "noticeEvent");
	callClientFunction(player, "delegateEvent", player, man0g0Quest, "processEvent020_1", nil, nil, nil);	
	man0g0Quest:StartSequence(10);
	player.CurrentArea:ContentFinished();
	GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 1, 15, 175.38, -1.21, -1156.51, -2.1);
	player:EndEvent();
end