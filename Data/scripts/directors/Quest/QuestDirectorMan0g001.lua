require ("global")
require ("tutorial")
require ("quests/man/man0g0")

--processTtrBtl001: Active Mode Tutorial - DoW only
--processTtrBtl002: Targetting Tutorial (After active mode done)

function init()
	return "/Director/Quest/QuestDirectorMan0g001";
end

function onEventStarted(player, director, triggerName)
	local man0g0Quest = player:GetQuest("Man0g0");	
	local worldMaster = GetWorldMaster();

	startTutorialMode(player);
	if (man0g0Quest:GetSequence() == SEQ_005) then -- make it only do things before it switches to seq10
			
		-- Tutorial: Set Active Stance
		callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl001", nil, nil, nil);
		player:EndEvent();
		waitForSignal("playerActive");
		wait(1); --If this isn't here, the scripts bugs out. TODO: Find a better alternative.
		kickEventContinue(player, director, "noticeEvent", "noticeEvent");			

		-- Tutorial: Target Monster
		callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl002", nil, nil, nil);
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
			player:SetMod(MinimumTpLock, 1000);
			closeTutorialWidget(player);
			openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_WEAPONSKILLS);
			player:EndEvent();
			player:DisableAutoAttack(); -- Ensure mobs don't die early so later script can receive 3 mobkills
			player:SetMod(MinimumTpLock, 0);
			waitForSignal("weaponskillUsed");
			player:EnableAutoAttack();
			wait(1);
			kickEventContinue(player, director, "noticeEvent", "noticeEvent");
			closeTutorialWidget(player);
			showTutorialSuccessWidget(player, 9065);
		
		elseif player:IsDiscipleOfMagic() then
			
			-- Tutorial: Cast Spell
			callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtlMagic001");
			player:DisableAutoAttack(); -- Ensure mobs don't die early so later script can receive 3 mobkills
			waitForSignal("spellUsed");
			player:EnableAutoAttack();
			wait(1);
			kickEventContinue(player, director, "noticeEvent", "noticeEvent");
			closeTutorialWidget(player);
			showTutorialSuccessWidget(player, 9050);
		end

		-- Tutorial: Kill Monster
		wait(2);
		openTutorialWidget(player, CONTROLLER_KEYBOARD, TUTORIAL_DEFEATENEMY);
		player:EndEvent();
		waitForSignal("mobkill");
		waitForSignal("mobkill");
		waitForSignal("mobkill");
		wait(1);
		kickEventContinue(player, director, "noticeEvent", "noticeEvent");
		closeTutorialWidget(player);	
		wait(2);
		player:SendDataPacket("attention", worldMaster, "", 51073, 2);
		wait(7);
		player:ChangeMusic(7);
		player:ChangeState(0); 	
		kickEventContinue(player, director, "noticeEvent", "noticeEvent");
		callClientFunction(player, "delegateEvent", player, man0g0Quest, "processEvent020_1");
		player:EndEvent();
		
		--Warp player to Seq_010 location (Gridania Entrance)
		man0g0Quest:StartSequence(10);	
		player.CurrentArea:ContentFinished();
		GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 1, 15, 175.38, -1.21, -1156.51, -2.1);
		player:EndEvent();
		player:PartyDisband();
		callClientFunction(player, "delegateEvent", player, man0g0Quest, "processTtrBtl004", nil, nil, nil);
		player:EndEvent();
		endTutorialMode(player);
	end
end