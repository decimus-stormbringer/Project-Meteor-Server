require ("global")
require ("tutorial")
require ("quests/man/man0g0")

function init()
	return "/Director/Quest/QuestDirectorMan0g001";
end

WOLF				= 2201407;
COUNTER_QUESTKILL	= 0;

function onKillBNpc(player, director, bnpc)
    local quest = player:GetQuest(110005);
	local worldMaster = GetWorldMaster();
    
	if (bnpc == WOLF) then
		local counterAmount = quest:GetData():IncCounter(COUNTER_QUESTKILL)
		if (counterAmount >= 3) then
			wait(1);
			closeTutorialWidget(player);
			wait(2);
			player:SendDataPacket("attention", worldMaster, "", 51073, 2);
			wait(7);
			-- StartSequence AND kickEventContinue are needed here in order for processEvent020 to fire. 
			-- Putting ChangeState OR ChangeMusic above this line causes this to break. 
			-- Also, putting kickEventContinue without StartSequence causes tutorial intro to replay. 
			-- TO-DO: Figure out why the hell this is happening.
			quest:StartSequence(0, true); -- silent, without journal update message.
			kickEventContinue(player, director, "noticeEvent", "noticeEvent");
			player:ChangeState(0); 
			wait(3);
			-- End Tutorial and warp player to next sequence
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_1", nil, nil, nil);
			player:EndEvent();
			endTutorialMode(player);			
			quest:StartSequence(10); -- To display Journal update message. 
			player:ChangeMusic(7);
			player.CurrentArea:ContentFinished();
			GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 1, 15, 175.38, -1.21, -1156.51, -2.1);		
			player:EndEvent();
			player:PartyDisband();
			player:ClearMods();
		end
	end
end

function onEventStarted(player, director, triggerName)
	local quest = player:GetQuest(110005);	

	quest:GetData():SetCounter(COUNTER_QUESTKILL, 0);  -- clears kill counter as a precaution. Mostly to prevent crashes during debugging.
	player:SetMod(MinimumHpLock, 1);	
	startTutorialMode(player);

	-- Tutorial: Set Active Stance
	callClientFunction(player, "delegateEvent", player, quest, "processTtrBtl001", nil, nil, nil);
	player:EndEvent();
	waitForSignal("playerActive");
	wait(1); --If this isn't here, the scripts bugs out. TODO: Find a better alternative.
	kickEventContinue(player, director, "noticeEvent", "noticeEvent");			

	-- Tutorial: Target Monster
	callClientFunction(player, "delegateEvent", player, quest, "processTtrBtl002", nil, nil, nil);
	player:EndEvent();  

	if player:IsDiscipleOfWar() then
			
		-- Tutorial: Auto-Attack Monster
		waitForSignal("playerAttack");
		wait(1);
		kickEventContinue(player, director, "noticeEvent", "noticeEvent");
		closeTutorialWidget(player);
		showTutorialSuccessWidget(player, 9055);
		wait(2);

		-- Tutorial: Use Weaponskill
		openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_TP);
		waitForSignal("tpOver1000");
		player.TP = 1000;
		closeTutorialWidget(player);
		openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_WEAPONSKILLS);
		player:EndEvent();
		waitForSignal("weaponskillUsed");
		wait(1);
		kickEventContinue(player, director, "noticeEvent", "noticeEvent");
		closeTutorialWidget(player);
		showTutorialSuccessWidget(player, 9065);
		
	elseif player:IsDiscipleOfMagic() then
			
		-- Tutorial: Cast Spell
		callClientFunction(player, "delegateEvent", player, quest, "processTtrBtlMagic001");
		waitForSignal("spellUsed");
		wait(1);
		kickEventContinue(player, director, "noticeEvent", "noticeEvent");
		closeTutorialWidget(player);
		showTutorialSuccessWidget(player, 9050);
	end

	-- Tutorial: Kill Monster
	wait(2);
	openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_DEFEATENEMY);
	player:EndEvent();
end