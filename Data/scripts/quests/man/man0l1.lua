require ("global")
require ("quest")
require ("tutorial")

--[[

Quest Script

Name: 	Treasures of the Main
Code: 	Man0l1
Id: 	110002
Prereq: Shapeless Melody (Man0l0 - 110001)

Map Markers
11000101,,1,-431,187,1000015,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000101,Visible
11000102,,1,35,-32,4000257,-1,common/mapMarker.le.spk,m00013,101,101,0,MapMarker,　,Visible
11000103,,1,-431,187,1000015,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000103,Visible
11000104,,1,-512,27,1000066,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000104,Visible
11000105,,1,-611,-56,1200100,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000105,Visible
11000106,,1,-604,-87,4000257,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000106,Visible
11000107,,1,-611,-56,1200100,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000107,Visible
11000108,,1,-594,-46,4000257,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000108,Visible
11000109,,1,-613,341,1900011,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarkerQuest,@5208/i11000109,Visible
11000110,,1,-617.400024,344.920013,1500024,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarkerQuest,@5208/i11000110,Visible
11000111,,1,-22,147,4000257,-1,common/mapMarker.le.spk,m00013,101,101,0,MapMarkerQuest,@5208/i11000111,Visible
11000112,,1,117,1274,4000257,-1,common/mapMarker.le.spk,m00013,101,101,0,MapMarkerQuest,@5208/i11000112,Visible
11000113,,1,150.970001,1312.800049,4000016,-1,common/mapMarker.le.spk,m00013,101,101,0,MapMarkerQuest,@5208/i11000113,Visible
11000114,,1,136,1324,4000257,-1,common/mapMarker.le.spk,m00013,101,101,0,MapMarkerQuest,@5208/i11000114,Visible
11000115,,1,-501,416,2200064,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000115,Visible
11000116,,1,-506.769989,432.070007,1900029,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000116,Visible
11000117,,1,-490,418,4000257,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000117,Visible
11000118,,1,-431,187,1000015,-1,common/mapMarker.le.spk,m00013,101,121,50,MapMarkerQuest,@5208/i11000118,Visible
11000119,,1,-624,359,4000257,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarkerQuest,@5208/i11000119,Visible
11000120,,1,0,0,1900006,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarkerQuest,@5208/i11000120,Visible


]]

-- Sequence Numbers
SEQ_000	= 0;  	-- (Private Area) Drowning Wench Echo Scene.
SEQ_003	= 3;  	-- Go attune to Camp Bearded Rock.
SEQ_005	= 5;  	-- Attuned, go back to Baderon. Info: <param1> If 1, Baderon gave you a tutorial guildleve else 0.
SEQ_006	= 6;  	-- Talk to Baderon again
SEQ_007	= 7;  	-- Find the CUL and MSK Guilds. Info: Params '0,5,20' will show the msg that you visited both guilds and to notify Baderon on the LS.
SEQ_035	= 35;	-- Go to the FSH Guild.
SEQ_040	= 40;	-- Learn hand signals from the guild
SEQ_048	= 48;	-- Travel to Zephyr Gate
SEQ_050	= 50;	-- Escort mission
SEQ_055	= 55;	-- Search lighthouse for corpse
SEQ_060	= 60;	-- Talk to Sisipu
SEQ_065	= 65;	-- Return to FSH Guild
SEQ_070	= 70;	-- Contact Baderon on LS
SEQ_075	= 75;	-- Go to the ARM and BSM Guilds. Talk to Bodenolf.
SEQ_080	= 80;	-- Speak with H'naanza
SEQ_085	= 85;	-- Walk into push trigger
SEQ_090	= 90;	-- Contact Baderon on LS
SEQ_092	= 92;	-- Return to Baderon.

-- Actor Class Ids
	-- Echo in Adv Guild
YSHTOLA 				= 1000001;
CRAPULOUS_ADVENTURER 	= 1000075;
DUPLICITOUS_TRADER	 	= 1000076;
DEBONAIR_PIRATE 		= 1000077;
ONYXHAIRED_ADVENTURER	= 1000098;
SKITTISH_ADVENTURER		= 1000099;
RELAXING_ADVENTURER 	= 1000100;
BADERON 				= 1000137;
MYTESYN 				= 1000167;
COCKAHOOP_COCKSWAIN 	= 1001643;
SENTENIOUS_SELLSWORD 	= 1001649;
SOLICITOUS_SELLSWORD 	= 1001650;
BLOCKER					= 1090372;

	-- Sequence 005
BEARDEDROCK_AETHERYTE	= 1280002;

	-- Sequence 007
CHARLYS					= 1000138;
ISANDOREL				= 1000152;
MERLZIRN				= 1000472;
MSK_TRIGGER				= 1090001;

	-- Echo in MSK Guild
NERVOUS_BARRACUDA		= 1000096;
INTIMIDATING_BARRACUDA	= 1000097;
OVEREAGER_BARRACUDA		= 1000107;
SOPHISTICATED_BARRACUDA	= 1000108;
SMIRKING_BARRACUDA		= 1000109;
MANNSKOEN				= 1000142;
TOTORUTO				= 1000161;
ADVENTURER1				= 1000869;
ADVENTURER2				= 1000870;
ADVENTURER3				= 1000871;
ECHO_EXIT_TRIGGER		= 1090003;

	-- Fsh Guild
NNMULIKA				= 1000153;
SISIPU_EMOTE			= 1000155;
ZEPHYR_TRIGGER			= 1090004;

	-- Sequence 050, 055, 060, 065
LIGHTHOUSE_TRIGGER		= 1090176;
SISIPU					= 1000156;
WINDWORN_CORPSE			= 1000091;
GLASSYEYED_CORPSE		= 1000092;
FEARSTRICKEN_CORPSE		= 1000378;
FSH_TRIGGER				= 1090006;

	-- Echo in the Bsm Guild
TATTOOED_PIRATE			= 1000111;
IOFA					= 1000135;
BODENOLF				= 1000144;
HNAANZA					= 1000145;
MIMIDOA					= 1000176;
JOELLAUT				= 1000163;
WERNER					= 1000247;
HIHINE					= 1000267;
TRINNE					= 1000268;
ECHO_EXIT_TRIGGER2		= 1090007;

-- ActorId Fixes
NANAKA					= 1000276;
CARRILAUT				= 1000062;
BRICTT					= 1000051;
AENTFOET				= 1000064;

-- Quest Markers
MRKR_BADERON			= 11000101;
MRKR_CAMPBEARDEDROCK	= 11000102;
MRKR_BADERON2			= 11000103;
MRKR_CULGUILD			= 11000104;
MRKR_MSKGUILD			= 11000105;
MRKR_MSKGUILD2			= 11000106;
MRKR_MSKGUILD3			= 11000107;
MRKR_MSKGUILD4			= 11000108;
MRKR_FSHGUILD			= 11000109;
MRKR_SISIPU				= 11000110;
MRKR_ESCORTSTART		= 11000111;
MRKR_LIGHTHOUSE			= 11000112;		--Used in Escort Mission
MRKR_CORPSE				= 11000113;
MRKR_SISIPU2			= 11000114;
MRKR_BODENOLF			= 11000115;
MRKR_HNAANZA			= 11000116;
MRKR_SEQ085PSH			= 11000117;
MRKR_QUESTCOMPLETE		= 11000118;
MRKR_FSHGUILD2			= 11000119;


-- Quest Data
CNTR_SEQ7_CUL		= 1;
CNTR_SEQ7_MSK		= 2;
CNTR_SEQ40_FSH		= 3;
CNTR_LS_MSG			= 4;

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{339},
	{80, 81, 82},
	{131, 326, 132},
	{161, 162, 163, 164}
};

function onStart(player, quest)	
	quest:StartSequence(SEQ_000);
	
	-- Immediately move to the Adventurer's Guild private area
	callClientFunction(player, "delegateEvent", player, quest, "processEvent010");	
	GetWorldManager():DoZoneChange(player, 133, "PrivateAreaMasterPast", 2, 15, -459.619873, 40.0005722, 196.370377, 2.010813);
	player:SendGameMessage(quest, 320, 0x20);
	player:SendGameMessage(quest, 321, 0x20);
end

function onFinish(player, quest)
	local data = quest:GetData();
	local subseqCUL = data:GetCounter(CNTR_SEQ7_CUL);
	local subseqMSK = data:GetCounter(CNTR_SEQ7_MSK);

	-- Reset counters to zero (mostly for testing purposes)
	data:SetCounter(CNTR_SEQ7_CUL, 0);
	data:SetCounter(CNTR_SEQ7_MSK, 0);
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();



	if (sequence == SEQ_000) then
		quest:SetENpc(YSHTOLA);
		quest:SetENpc(CRAPULOUS_ADVENTURER);
		quest:SetENpc(DUPLICITOUS_TRADER);
		quest:SetENpc(DEBONAIR_PIRATE);
		quest:SetENpc(ONYXHAIRED_ADVENTURER);
		quest:SetENpc(SKITTISH_ADVENTURER);
		quest:SetENpc(RELAXING_ADVENTURER);
		quest:SetENpc(BADERON, QFLAG_TALK);
		quest:SetENpc(MYTESYN);
		quest:SetENpc(COCKAHOOP_COCKSWAIN);
		quest:SetENpc(SENTENIOUS_SELLSWORD);
		quest:SetENpc(SOLICITOUS_SELLSWORD);
		quest:SetENpc(BLOCKER, QFLAG_NONE, false, true);
		quest:SetENpc(NANAKA);
	elseif (sequence == SEQ_003) then
		quest:SetENpc(NANAKA);
		quest:SetENpc(BADERON);
	elseif (sequence == SEQ_005) then
		quest:SetENpc(BADERON, QFLAG_TALK);
	elseif (sequence == SEQ_006) then
		data:SetCounter(CNTR_SEQ7_CUL, 0);
		data:SetCounter(CNTR_SEQ7_MSK, 0);
		quest:SetENpc(BADERON, QFLAG_TALK);
	elseif (sequence == SEQ_007) then
		local subseqCUL = data:GetCounter(CNTR_SEQ7_CUL);
		local subseqMSK = data:GetCounter(CNTR_SEQ7_MSK);

		-- Always active in this seqence
		quest:SetENpc(BADERON);
		quest:SetENpc(CHARLYS, subseqCUL == 0 and QFLAG_TALK or QFLAG_NONE);
		-- Down and Up the MSK guild
		quest:SetENpc(ISANDOREL, (subseqMSK == 0 or subseqMSK == 2) and QFLAG_TALK or QFLAG_NONE);
		if (subseqMSK == 1) then
			quest:SetENpc(MSK_TRIGGER, QFLAG_PUSH, false, true);
		elseif (subseqMSK == 2) then
			quest:SetENpc(MERLZIRN);
		end
		-- In Echo
		quest:SetENpc(NERVOUS_BARRACUDA);
		quest:SetENpc(INTIMIDATING_BARRACUDA);
		quest:SetENpc(OVEREAGER_BARRACUDA);
		quest:SetENpc(SOPHISTICATED_BARRACUDA);
		quest:SetENpc(SMIRKING_BARRACUDA);
		quest:SetENpc(MANNSKOEN);
		quest:SetENpc(TOTORUTO);
		quest:SetENpc(ADVENTURER1);
		quest:SetENpc(ADVENTURER2);
		quest:SetENpc(ADVENTURER3);
		quest:SetENpc(ECHO_EXIT_TRIGGER, subseqMSK == 3 and QFLAG_PUSH or QFLAG_NONE, false, subseqMSK == 3);	
		quest:SetENpc(CARRILAUT);
	elseif (sequence == SEQ_035) then
		quest:SetENpc(NNMULIKA, QFLAG_TALK);
	elseif (sequence == SEQ_040) then
		local emoteTestStep = data:GetCounter(CNTR_SEQ40_FSH);

 		quest:SetENpc(SISIPU_EMOTE, QFLAG_TALK, true, false, true);
		quest:SetENpc(NNMULIKA); 
		quest:SetENpc(CARRILAUT);
	elseif (sequence == SEQ_048) then
		quest:SetENpc(CARRILAUT);
		quest:SetENpc(BADERON);
		quest:SetENpc(ZEPHYR_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(NNMULIKA);
	elseif (sequence == SEQ_050) then
		quest:SetENpc(LIGHTHOUSE_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_055) then
		quest:SetENpc(WINDWORN_CORPSE, QFLAG_TALK);
		quest:SetENpc(GLASSYEYED_CORPSE);
		quest:SetENpc(FEARSTRICKEN_CORPSE);
		quest:SetENpc(SISIPU);
		quest:SetENpc(ZEPHYR_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(BRICTT);
	elseif (sequence == SEQ_060) then
		quest:SetENpc(SISIPU, QFLAG_TALK);
		quest:SetENpc(WINDWORN_CORPSE);
		quest:SetENpc(GLASSYEYED_CORPSE);
		quest:SetENpc(FEARSTRICKEN_CORPSE);
		quest:SetENpc(ZEPHYR_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(BRICTT);
	elseif (sequence == SEQ_065) then
		quest:SetENpc(BRICTT);
		quest:SetENpc(FSH_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_075) then	
		quest:SetENpc(BODENOLF, QFLAG_TALK);
	elseif (sequence == SEQ_080) then	
		quest:SetENpc(HNAANZA, QFLAG_TALK);
		quest:SetENpc(TATTOOED_PIRATE);
		quest:SetENpc(IOFA);
		quest:SetENpc(BODENOLF);
		quest:SetENpc(MIMIDOA);
		quest:SetENpc(JOELLAUT);
		quest:SetENpc(WERNER);
		quest:SetENpc(HIHINE);
		quest:SetENpc(TRINNE);
		quest:SetENpc(AENTFOET);
	elseif (sequence == SEQ_085) then	
		quest:SetENpc(HNAANZA);
		quest:SetENpc(TATTOOED_PIRATE);
		quest:SetENpc(WERNER);
		quest:SetENpc(HIHINE);
		quest:SetENpc(TRINNE);
		quest:SetENpc(ECHO_EXIT_TRIGGER2, QFLAG_PUSH, false, true);
		quest:SetENpc(AENTFOET);
	elseif (sequence == SEQ_092) then	
		quest:SetENpc(BADERON, QFLAG_REWARD);
	end	
	
end

function onTalk(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_000) then

		seq000_onTalk(player, quest, npc, classId);
	elseif (sequence == SEQ_003) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
			player:EndEvent();
		end
	elseif (sequence == SEQ_005) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent026");
			player:EndEvent();
			quest:StartSequence(SEQ_006);
		end
	elseif (sequence == SEQ_006) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027");			
			player:EndEvent();
			player:SendGameMessage(GetWorldMaster(), 25117, 0x20, 11000125); -- You obtain Baderon's Recommendation
			quest:StartSequence(SEQ_007);
		end
	elseif (sequence == SEQ_007) then
		seq007_onTalk(player, quest, npc, classId);
	elseif (sequence == SEQ_035) then
		if (classId == NNMULIKA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent600");
			quest:StartSequence(SEQ_040);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 5);
		end
	elseif (sequence == SEQ_040) then
		if (classId == SISIPU_EMOTE) then
			local emoteTestStep = quest:GetData():GetCounter(CNTR_SEQ40_FSH);
			if (emoteTestStep == 0 or emoteTestStep == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent601_1");
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
				if (emoteTestStep == 0) then
					quest:GetData():IncCounter(CNTR_SEQ40_FSH);
				end
			elseif (emoteTestStep == 2) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent601_2");
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
			elseif (emoteTestStep == 3) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent601_3");
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
			elseif (emoteTestStep == 4) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent601_4");
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
			elseif (emoteTestStep == 5) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent601_5");
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
			elseif (emoteTestStep == 6) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent601_6");
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
			end			
		elseif (classId == NNMULIKA) then
			if(npc.CurrentArea.IsPrivate()) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent600_2");
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent600");
				player:EndEvent();
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 5);
				data:SetCounter(CNTR_SEQ40_FSH, 0);
			end
		end
		player:EndEvent();
	elseif (sequence == SEQ_048) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent602_3");			
		elseif (classId == NNMULIKA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent602_2");		
		end		
		player:EndEvent();
	elseif (sequence == SEQ_055 or sequence == SEQ_060) then
		if (classId == SISIPU) then
			if (sequence == SEQ_060) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent615");
				quest:StartSequence(SEQ_065);
				player:EndEvent();
				GetWorldManager():DoZoneChange(player, 230, nil, 0, 15, -83.245, 30, 176.216, -0.764);
				return;
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent605_2");					
			end
		elseif (classId == WINDWORN_CORPSE) then
			if (sequence == SEQ_055) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent610");
				quest:StartSequence(SEQ_060);
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent610_2");
			end
		elseif (classId == FEARSTRICKEN_CORPSE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent610_2");
		elseif (classId == GLASSYEYED_CORPSE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent610_2");		
		end		
		player:EndEvent();
	elseif (sequence == SEQ_070) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent615_2");
		end
		player:EndEvent();
	elseif (sequence == SEQ_075) then
		if (classId == BODENOLF) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent630");
			player:EndEvent();
			quest:StartSequence(SEQ_080);
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -504.985, 42.490, 433.712, 2.35);
		end
	elseif (sequence == SEQ_080) then
		if (classId == HNAANZA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent632");
			player:EndEvent();
			quest:StartSequence(SEQ_085);
		else
			seq080_085_onTalk(player, quest, npc, classId);
		end
	elseif (sequence == SEQ_085) then
		if (classId == HNAANZA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent632_2");
			--Adding end event to prevent softlock if you talk to Hnaanza twice.
			player:EndEvent();
		else
			seq080_085_onTalk(player, quest, npc, classId);
		end
	elseif (sequence == SEQ_092) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:EndEvent();
			player:CompleteQuest(quest);
			player:AddItem(1000001, 6000);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 6000);
			player:AddExp(10000, player:GetCurrentClassOrJobId(), 0);
			return;
		end
	end
	quest:UpdateENPCs();
end

function seq000_onTalk(player, quest, npc, classId)
	if     (classId == CRAPULOUS_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
	elseif (classId == SKITTISH_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_3");
	elseif (classId == DUPLICITOUS_TRADER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_4");	
	elseif (classId == DEBONAIR_PIRATE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_5");
	elseif (classId == ONYXHAIRED_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_6");
	elseif (classId == RELAXING_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_7");
	elseif (classId == YSHTOLA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_8");
	elseif (classId == BADERON) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020");
		quest:NewNpcLsMsg(1);
		quest:StartSequence(SEQ_003);
		player:EndEvent();
		
		--local director = GetWorldManager():GetArea(133):CreateDirector("AfterQuestWarpDirector", false);
		--player:AddDirector(director);
		--director:StartDirector(true);
		--player:SetLoginDirector(director);
		--player:KickEvent(director, "noticeEvent", true);
		
		quest:UpdateENPCs();
		GetWorldManager():DoZoneChange(player, 133, nil, 0, 15, player.positionX, player.positionY, player.positionZ, player.rotation);
		return;
	elseif (classId == MYTESYN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_7");	
	elseif (classId == COCKAHOOP_COCKSWAIN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEtc001");
	elseif (classId == SOLICITOUS_SELLSWORD) then
		callClientFunction(player, "delegateEvent", player, quest, "processEtc002");
	elseif (classId == SENTENIOUS_SELLSWORD) then
		callClientFunction(player, "delegateEvent", player, quest, "processEtc003");
	end
	player:EndEvent();
end

function seq007_onTalk(player, quest, npc, classId)
	local data = quest:GetData();
	local subseqCUL = data:GetCounter(CNTR_SEQ7_CUL);
	local subseqMSK = data:GetCounter(CNTR_SEQ7_MSK);
	
	if (classId == BADERON) then
		if (subseqCUL == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027_3");
		elseif (subseqMSK == 4) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027_4");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027_2");
		end
	elseif (classId == CHARLYS) then
		if (subseqCUL == 0) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			data:IncCounter(CNTR_SEQ7_CUL);			
			if (data:GetCounter(CNTR_SEQ7_MSK) == 4) then
				seq007_endSequence(player, quest);
			end
			--give 1000g
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
		end
	elseif (classId == ISANDOREL) then
		if (subseqMSK == 2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			data:IncCounter(CNTR_SEQ7_MSK);
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3);
		elseif (subseqMSK == 0) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent035");
			data:IncCounter(CNTR_SEQ7_MSK);
		elseif (subseqMSK == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent035_2");
		end
	elseif (classId == MERLZIRN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent40_2");
	elseif (classId == INTIMIDATING_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
	elseif (classId == TOTORUTO) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_4");		
	elseif (classId == MANNSKOEN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_6");
	elseif (classId == NERVOUS_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_7");
	elseif (classId == OVEREAGER_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_8");
	elseif (classId == SOPHISTICATED_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_9");
	elseif (classId == SMIRKING_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_10");
	elseif (classId == ADVENTURER2) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_13");
	elseif (classId == ADVENTURER3) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_14");
	elseif (classId == ADVENTURER1) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_15");
	end
		
	player:EndEvent();
end

function seq007_endSequence(player, quest)
	callClientFunction(player, "delegateEvent", player, quest, "processEvent033");
	quest:NewNpcLsMsg(1);
end

function seq080_085_onTalk(player, quest, npc, classId)
	if (classId == IOFA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_2");
	elseif (classId == TRINNE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_3");
	elseif (classId == HIHINE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_4");
	elseif (classId == MIMIDOA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_5");
	elseif (classId == WERNER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_6");
	elseif (classId == TATTOOED_PIRATE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_7");
	elseif (classId == JOELLAUT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_8");
	elseif (classId == BODENOLF) then
		if (npc.CurrentArea.IsPrivate()) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent630_9");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent630");
			player:EndEvent();
			quest:StartSequence(SEQ_080);
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -504.985, 42.490, 433.712, 2.35);
		end
	end
	player:EndEvent();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_000) then
		if (classId == BLOCKER) then

		posz = player:GetPos()[3];

			if (posz >= 170 and posz <= 175) then	
				callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml002");
				GetWorldManager():DoPlayerMoveInZone(player, -448.171, 41.802, 172.497, 0, 0x11);
			else 
				callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml001");
				GetWorldManager():DoPlayerMoveInZone(player, -466.673, 40, 200.142, 1.957, 0x11);
			end
		end

	elseif (sequence == SEQ_007) then
		if (classId == MSK_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			data:IncCounter(CNTR_SEQ7_MSK);
			player:EndEvent();
			quest:UpdateENPCs();
			GetWorldManager():DoZoneChange(player, 230, nil, 0, 15, -620.0, 29.476, -70.050, 0.791);
		elseif (classId == ECHO_EXIT_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			data:IncCounter(CNTR_SEQ7_MSK);
			if (data:GetCounter(CNTR_SEQ7_CUL) == 1) then
				seq007_endSequence(player, quest);
			end
			player:EndEvent();
			quest:UpdateENPCs();
			GetWorldManager():WarpToPublicArea(player);
		end
	elseif (sequence == SEQ_048) then
		if (classId == ZEPHYR_TRIGGER) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				-- DO ESCORT DUTY HERE
				-- startMan0l1Content(player, quest);
				-- For now just skip the sequence
				callClientFunction(player, "delegateEvent", player, quest, "processEvent604");
				GetWorldManager():DoZoneChange(player, 128, "", 0, 15, 94.053, 44.198, 1216.803, 0.291);
				quest:StartSequence(SEQ_050);
				return;
			end
			player:EndEvent();
		end
	elseif (sequence == SEQ_050) then
		if (classId == LIGHTHOUSE_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent605");
			GetWorldManager():DoZoneChange(player, 128, "PrivateAreaMasterPast", 2, 15, 137.44, 60.33, 1322.0, -1.60);
			quest:StartSequence(SEQ_055);
			player:EndEvent();
		end
	elseif (sequence == SEQ_055) then
		if (classId == ZEPHYR_TRIGGER) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				-- DO ESCORT DUTY HERE
				-- startMan0l1Content(player, quest);
				-- For now just skip the sequence
				callClientFunction(player, "delegateEvent", player, quest, "processEvent604");
				GetWorldManager():DoZoneChange(player, 128, "", 0, 15, 94.053, 44.198, 1216.803, 0.291);
				quest:StartSequence(SEQ_050);
				return;
			end
			player:EndEvent();
		end
	elseif (sequence == SEQ_060) then
		if (classId == ZEPHYR_TRIGGER) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				-- DO ESCORT DUTY HERE
				-- startMan0l1Content(player, quest);
				-- For now just skip the sequence
				callClientFunction(player, "delegateEvent", player, quest, "processEvent604");
				GetWorldManager():DoZoneChange(player, 128, "", 0, 15, 94.053, 44.198, 1216.803, 0.291);
				quest:StartSequence(SEQ_050);
				return;
			end
			player:EndEvent();
		end
	elseif (sequence == SEQ_065) then
		if (classId == FSH_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent620");	
			player:AddItem(1000001, 3000);		-- Give 3000 gil
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 3000);
			player:EndEvent();
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_070);
		end		
	elseif (sequence == SEQ_085) then
		if (classId == ECHO_EXIT_TRIGGER2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent635");			
			player:EndEvent();			
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_090);
			quest:UpdateENPCs();
			GetWorldManager():WarpToPublicArea(player);
		end
	end
end

function onEmote(player, quest, npc, eventName)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();	

	-- Play the emote
	if (eventName == "emoteDefault1") then 		-- Bow
		player:DoEmote(npc.Id, 5, 21041);
	elseif (eventName == "emoteDefault2") then	-- Clap
		player:DoEmote(npc.Id, 7, 21061);
	elseif (eventName == "emoteDefault3") then	-- Congratulate
		player:DoEmote(npc.Id, 29, 21281);
	elseif (eventName == "emoteDefault4") then	-- Poke
		player:DoEmote(npc.Id, 28, 21271);
	elseif (eventName == "emoteDefault5") then	-- Joy
		player:DoEmote(npc.Id, 18, 21171);
	elseif (eventName == "emoteDefault6") then	-- Wave
		player:DoEmote(npc.Id, 16, 21151);
	end
	wait(2.5);
	
	-- Handle the result
	if (sequence == SEQ_040) then
		if (classId == SISIPU_EMOTE) then
			local emoteTestStep = data:GetCounter(CNTR_SEQ40_FSH);
			-- Bow
			if (emoteTestStep == 1) then
				if (eventName == "emoteDefault1") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_2");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
					data:IncCounter(CNTR_SEQ40_FSH);
				else
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_8");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_1");
				end
			-- Clap
			elseif (emoteTestStep == 2) then
				if (eventName == "emoteDefault2") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_3");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
					data:IncCounter(CNTR_SEQ40_FSH);
				else
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_8");					
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_2");
				end
			-- Congratulate
			elseif (emoteTestStep == 3) then
				if (eventName == "emoteDefault3") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_4");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
					data:IncCounter(CNTR_SEQ40_FSH);
				else
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_8");					
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_3");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
				end
			-- Poke
			elseif (emoteTestStep == 4) then
				if (eventName == "emoteDefault4") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_5");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
					data:IncCounter(CNTR_SEQ40_FSH);					
				else
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_8");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_4");
				end
			-- Joy
			elseif (emoteTestStep == 5) then
				if (eventName == "emoteDefault5") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_6");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 1);
					data:IncCounter(CNTR_SEQ40_FSH);
				else
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_8");					
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_5");
				end
			-- Wave
			elseif (emoteTestStep == 6) then
				if (eventName == "emoteDefault6") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent602");
					player:EndEvent();					
					GetWorldManager():WarpToPublicArea(player);
					quest:StartSequence(SEQ_048);
					return;
				else
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_8");					
					callClientFunction(player, "delegateEvent", player, quest, "processEvent601_6");
				end
			end
		end
	end
		
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNotice(player, quest, target)
	local sequence = quest:getSequence();
	if (sequence == SEQ_003) then
		player:EndEvent();
	end
	quest:UpdateENPCs();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_003) then
			msgPack = 1;
		elseif (sequence == SEQ_007 or sequence == SEQ_035) then
			msgPack = 2;
		elseif (sequence == SEQ_070 or sequence == SEQ_075) then
			msgPack = 3;
		elseif (sequence == SEQ_090 or sequence == SEQ_092) then
			msgPack = 4;
		end		
		-- Quick way to handle all msgs nicely.
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1000015);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
		
		-- Handle anything else
		if (sequence == SEQ_003) then
			endTutorialMode(player);
		elseif (sequence == SEQ_007) then
			quest:StartSequenceForNpcLs(SEQ_035);
		elseif (sequence == SEQ_070) then
			quest:StartSequenceForNpcLs(SEQ_075);
		elseif (sequence == SEQ_090) then
			quest:StartSequenceForNpcLs(SEQ_092);
		end
	end
	player:EndEvent();
end

function startMan0l1Content(player, quest)
	quest:StartSequence(SEQ_050);	
	callClientFunction(player, "delegateEvent", player, quest, "processEvent604");
	player:EndEvent();
		
	local contentArea = player.CurrentArea:CreateContentArea(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "Man0l101", "SimpleContent30002", "Quest/QuestDirectorMan0l101");
	
	if (contentArea == nil) then
		return;
	end
	
	local director = contentArea:GetContentDirector();
	player:AddDirector(director);
	director:StartDirector(true);
	GetWorldManager():DoZoneChangeContent(player, contentArea, -63.25, 33.15, 164.51, 0.8, 16);
end

function getJournalInformation(player, quest)
	return 0, quest:GetData():GetCounter(CNTR_SEQ7_CUL) * 5, quest:GetData():GetCounter(CNTR_SEQ7_MSK) * 5;
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
	local data = quest:GetData();
    local possibleMarkers = {};
	local subseqCUL = data:GetCounter(CNTR_SEQ7_CUL);
	local subseqMSK = data:GetCounter(CNTR_SEQ7_MSK);
	
	if (sequence == SEQ_000) then
		table.insert(possibleMarkers, MRKR_BADERON);
	elseif (sequence == SEQ_003) then
		table.insert(possibleMarkers, MRKR_CAMPBEARDEDROCK);
	elseif (sequence == SEQ_005) then
		table.insert(possibleMarkers, MRKR_BADERON2);
	elseif (sequence == SEQ_006) then
		table.insert(possibleMarkers, MRKR_BADERON2);
	elseif (sequence == SEQ_007) then
		if (subseqCUL == 0) then
			table.insert(possibleMarkers, MRKR_CULGUILD);
		end
		if (subseqMSK == 0) then
			table.insert(possibleMarkers, MRKR_MSKGUILD);
		elseif (subseqMSK == 1) then
			table.insert(possibleMarkers, MRKR_MSKGUILD2);
		elseif (subseqMSK == 2) then
			table.insert(possibleMarkers, MRKR_MSKGUILD3);
		elseif (subseqMSK == 4) then
			table.insert(possibleMarkers, MRKR_MSKGUILD4);
		end
	elseif (sequence == SEQ_035) then
			table.insert(possibleMarkers, MRKR_FSHGUILD);
	elseif (sequence == SEQ_040) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_SISIPU);
		else
			table.insert(possibleMarkers, MRKR_FSHGUILD);
		end
	elseif (sequence == SEQ_048) then
		table.insert(possibleMarkers, MRKR_ESCORTSTART);
	elseif (sequence == SEQ_050) then
		table.insert(possibleMarkers, MRKR_LIGHTHOUSE);
	elseif (sequence == SEQ_055) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_CORPSE);
		else
			table.insert(possibleMarkers, MRKR_ESCORTSTART);
		end
	elseif (sequence == SEQ_060) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_SISIPU2);
		else
			table.insert(possibleMarkers, MRKR_ESCORTSTART);
		end
	elseif (sequence == SEQ_065) then
		table.insert(possibleMarkers, MRKR_FSHGUILD2);
	elseif (sequence == SEQ_075) then	
		table.insert(possibleMarkers, MRKR_BODENOLF);
	elseif (sequence == SEQ_080) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_HNAANZA);
		else
			table.insert(possibleMarkers, MRKR_BODENOLF);
		end
	elseif (sequence == SEQ_085) then
		table.insert(possibleMarkers, MRKR_SEQ085PSH);
	elseif (sequence == SEQ_092) then
		table.insert(possibleMarkers, MRKR_QUESTCOMPLETE);
	end

    return unpack(possibleMarkers)
end