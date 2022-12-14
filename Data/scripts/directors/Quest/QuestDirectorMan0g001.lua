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

function onEventStarted(player, actor, triggerName)
	player:SendMessage(0x1D,"",">STARTING function onEventStarted");
	man0g0Quest = player:GetQuest("Man0g0");
	if (man0g0Quest:GetSequence() == SEQ_005) then -- make it only do things before it switches to seq10
		player:SendMessage(0x1D,"",">if sequence 5 check");
		startTutorialMode(player);
	
	
	
	--[[if (quest:GetSequence() == SEQ_005) then -- make it only do things before it switches to seq10
		player:SendMessage(0x1D,"",">if quest:GetSequence 5 check");
	end]]

		--Combat portion of tutorial
	
		if player:IsDiscipleOfWar() then
			player:SendMessage(0x1D,"",">if DOW");
			callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl001");
			player:SendMessage(0x1D,"",">if DOW, played DOW cutscene");
			player:EndEvent();
			waitForSignal("playerActive");
			wait(1); --If this isn't here, the scripts bugs out. TODO: Find a better alternative.
			player:SendMessage(0x1D,"",">Director DOW kickevent Start");
			kickEventContinue(player, actor, "noticeEvent", "noticeEvent");	
			player:SendMessage(0x1D,"",">Director DOW kickevent End");
			callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl002", nil, nil, nil);
			player:EndEvent();        
	
			--waitForSignal("playerAttack");
			closeTutorialWidget(player);
			showTutorialSuccessWidget(player, 9055); --Open TutorialSuccessWidget for attacking enemy
			openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_TP);

			wait(3);
			closeTutorialWidget(player);
			openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_WEAPONSKILLS);
			--waitForSignal("weaponskillUsed");
			wait(3);
			--player:SetMod(modifiersGlobal.MinimumTpLock, 0);
			closeTutorialWidget(player);
			showTutorialSuccessWidget(player, 9065); --Open TutorialSuccessWidget for weapon skill
			player:SendMessage(0x1D,"",">DOW finished");
		elseif player:IsDiscipleOfMagic() then
			player:SendMessage(0x1D,"",">elseif DOM");
			callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtlMagic001"); 
			player:SendMessage(0x1D,"",">if DOM, played DOM cutscene");
			player:EndEvent();
			wait(1);
			player:SendMessage(0x1D,"",">Director DOM kickevent Start");
			kickEventContinue(player, actor, "noticeEvent", "noticeEvent");
			player:SendMessage(0x1D,"",">Director DOM kickevent End");
			closeTutorialWidget(player);
			--player:SendMessage(0x20, "", "Sending success");
			showTutorialSuccessWidget(player, 9050); --Open TutorialSuccessWidget for magic skill
			wait(1)
			openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_DEFEATENEMY);
			wait(3);
			closeTutorialWidget(player);
			player:SendMessage(0x1D,"",">DOM finished");

			--waitForSignal("spellUsed");  9050

		elseif player:IsDiscipleOfHand() then
			--waitForSignal("abilityUsed");
		elseif player:IsDiscipleOfLand() then
			--waitForSignal("abilityUsed");
		end
	
	player:SendMessage(0x1D,"",">after DOW/DOM if statements");
    wait(3);
	worldMaster = GetWorldMaster();
	player:SendDataPacket("attention", worldMaster, "", 51073, 2);
	wait(7);
	player:SendMessage(0x1D,"",">music change");
	player:ChangeMusic(7);
	player:ChangeState(0); 
	
	player:SendMessage(0x1D,"",">Director afterDOW/DOM kickevent Start");
	kickEventContinue(player, actor, "noticeEvent", "noticeEvent");  -- uncommenting this plays cutscene?  
	player:SendMessage(0x1D,"",">Director afterDOW/DOM kickevent End");
	player:SendMessage(0x1D,"",">before post-tutorial cutscene");
	callClientFunction(player, "delegateEvent", player, man0g0Quest, "processEvent020_1");
	player:SendMessage(0x1D,"",">after post-tutorial cutscene");
    man0g0Quest:StartSequence(10);
	player:SendMessage(0x1D,"",">S10 Start");
	--player:EndEvent();	
    player.CurrentArea:ContentFinished();
	GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 1, 15, 175.38, -1.21, -1156.51, -2.1);
	player:SendMessage(0x1D,"",">end of seq 5 statements");
	player:EndEvent();
	elseif (man0g0Quest:GetSequence() == SEQ_010) then
		player:SendMessage(0x1D,"",">directors10 check?");
		player:EndEvent();
	end
	player:SendMessage(0x1D,"",">after sequence checks");
	player:EndEvent();
end

--[[function onEventStarted(player, actor, triggerName)

	man0g0Quest = player:GetQuest("Man0g0");
	startTutorialMode(player);


	--Combat portion of tutorial
	
	if player:IsDiscipleOfWar() then
		player:SendMessage(0x1D,"",">before meeting wolves cutscene DOW");
        callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl001");
		player:SendMessage(0x1D,"",">after meeting wolves cutscene DOW");
        player:EndEvent();
        waitForSignal("playerActive");
        wait(1); --If this isn't here, the scripts bugs out. TODO: Find a better alternative.
        kickEventContinue(player, actor, "noticeEvent", "noticeEvent");	
        
        callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl002", nil, nil, nil);
        player:EndEvent();        

		--waitForSignal("playerAttack");
		closeTutorialWidget(player);
		showTutorialSuccessWidget(player, 9055); --Open TutorialSuccessWidget for attacking enemy
		openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_TP);

        wait(3);
		closeTutorialWidget(player);
		openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_WEAPONSKILLS);
		--waitForSignal("weaponskillUsed");
        wait(3);
		--player:SetMod(modifiersGlobal.MinimumTpLock, 0);
		closeTutorialWidget(player);
		showTutorialSuccessWidget(player, 9065); --Open TutorialSuccessWidget for weapon skill
        player:SendMessage(0x1D,"",">DOW finished");
	elseif player:IsDiscipleOfMagic() then
    player:SendMessage(0x1D,"",">elseif DOM");
        player:SendMessage(0x1D,"",">before meeting wolves cutscene DOW");
		callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtlMagic001");
		player:SendMessage(0x1D,"",">before meeting wolves cutscene DOW");	
        player:EndEvent();
        wait(1);
        kickEventContinue(player, actor, "noticeEvent", "noticeEvent");
        closeTutorialWidget(player);
        player:SendMessage(0x20, "", "Sending success");
        showTutorialSuccessWidget(player, 9050); --Open TutorialSuccessWidget for magic skill
        wait(1)
		openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_DEFEATENEMY);
        wait(3);
        closeTutorialWidget(player);
 

		--waitForSignal("spellUsed");  9050

	elseif player:IsDiscipleOfHand() then
		--waitForSignal("abilityUsed");
	elseif player:IsDiscipleOfLand() then
		--waitForSignal("abilityUsed");
	end
	player:SendMessage(0x1D,"",">after DOW if statements");
    wait(3);
	worldMaster = GetWorldMaster();
	player:SendDataPacket("attention", worldMaster, "", 51073, 2);
	wait(7);
	player:SendMessage(0x1D,"",">music change");
	player:ChangeMusic(7);
	player:ChangeState(0); 
	player:SendMessage(0x1D,"",">before beating wolves cutscene");
	kickEventContinue(player, actor, "noticeEvent", "noticeEvent");  -- uncommenting this plays cutscene?  
	callClientFunction(player, "delegateEvent", player, man0g0Quest, "processEvent020_1");
	player:SendMessage(0x1D,"",">after beating wolves cutscene");
    man0g0Quest:StartSequence(10);
	player:SendMessage(0x1D,"",">S10 Start");
	--player:EndEvent();	
    player.CurrentArea:ContentFinished();
	GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 1, 15, 175.38, -1.21, -1156.51, -2.1);
	player:EndEvent();	
end]]

--[[
	IF DoW:
		OpenWidget (TP)
		IF TP REACHED:
			CloseWidget
			OpenWidget (WS)
		IF WS USED:
			Success
			CloseWidget
	ELSE MAGIC:
		OpenWidget (DEFEAT ENEMY)
]]