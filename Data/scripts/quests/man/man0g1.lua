require ("global")
require ("quest")
require ("tutorial")
--[[
-- player:SendMessage(0x1D,"",">");
Quest Script

Name:   Souls Gone Wild  
Code:   Man0g1
Id:     110006
Prereq: Sundered Skies (Man0g0 - 110005)
Notes:

]]

ENABLE_GL_TUTORIAL = false;

--[[
ProcessEvents

processEvent100	First cutscene meeting Miounne. Should kick into this.
processEvent100_1	WorldMaster message about instances.
processEvent100_2	Morose Merchant: "Impurity's as bad as a curse, I tell ye."
processEvent100_3	Amiable Adventurer: "You would do well to fear the Twelveswood - and live in awe of it."
processEvent100_4	Well-Bundled Adventurer: "If you are planning to stay a while, you might want to learn a bit about the elementals."
processEvent100_5	Well-Bundled Adventurer: "The ancient elementals of the Twelveswood are much more powerful and wise than those from other parts of the world."
processEvent100_6	Beaming Adventurer: "You met a moogle? Well, count yourself as one of the lucky ones."
processEvent100_7	Narrow-Eyed Adventurer: "As if breaking of the hedge wasn't enough, it seems an airship crashed in the forest as well."
processEvent100_8	Whispily-Whiskered Adventurer: "In Gridania, there live a chosen few who are blessed by the forest."
processEvent100_9	 ???: "The Twelveswood is a sacred place, and runs thicker and deeper than you can imagine."
processEvent110	Cutscene exiting echo and Miounne telling you to go to Camp Bentbranch.
processEvent110_2	Miounne reminder message to go to Bentbranch.
processEvent013	Linkshell chat message from Miounne when you touch the Aetheryte. Gives tutorial leve.
processEvent013_2	Linkshell chat message from Miounne when you touch the Aetheryte. Sans tutorial leve.
processEvent114	Miounne speech when you return.
processEvent115	Miounne speech when you talk again. Tells you to go to the CNJ and LTW guilds.
processEvent115_2	Reminder message to go to the CNJ and LTW guilds.
processEvent120	Cutscene at the LTW guild.
processEvent123	Worldmaster Message teaching you about npc linkshells.
processEvent120_2	Reminder message after talking to the LTW guild.
processEvent125	Soileine Telling you to enter the chamber in the CNJ guild.
processEvent125_2	Soileine Reminder message to enter the chamber.
processEvent130	Cutscene into echo meeting O-App-Pesi and then Yda/Papalimo.
processEvent130_2	 ???: "The two outsiders brought by Swethyna of the Wood Wailers... There was something strange about them."
processEvent130_3	O-App-Pesi: "I pray a moment, please. Swethyna has important words which must be heard."
processEvent130_4	Yda: "Look, Papalymo, he's got horns! This must be one of those Padjal!"
processEvent130_5	Papalymo: "Manners, Yda. Gods, the Gridanians will think us raised in a gutter."
processEvent130_6	Gugula: "The fury of the elementals is sure to be wakened whenever the Hedge is broken through."
processEvent130_7	Ingram: "Brother O-App is a Padjal, of course."
processEvent130_8	Challinie: "We conjurers hear the whispers of the elementals, and see to it that their will is made known to all Gridanians."
processEvent130_9	 ???: "Where are those two outsiders from? We've had dealings with those from beyond the wood before, but never have I witnessed such insolence."
processEvent130_10	 ???: "If Swethyna is involved, it must be a matter of some import. The leader of the Wood Wailers wouldn't waste time dabbling in aught else."
processEvent135	Exiting the echo and more elemental explanation.
processEvent136	Same as above, but adds a worldmaster message about linkshells.
processEvent135_2	Miounne recap message to go to the LTW guild if you already went to the CNJ guild.
processEvent137_2	Miounne recap message to go to the BTN guild.
processEvent140	Cutscene entering the BTN guild into the emote test instance.
processEvent140_10	Fufucha Reminder message: "Let the younglings teach you the dance."
processEvent140_1	Aunille: "Watch how I do it. You have to beckon the elementals near. Like this."
processEvent141_1	Aunille "I wonder if the elementals dance as we do..."
processEvent142_1	Aunille, success: "Hahaha, that's it!"
processEvent140_2	Nicoliaux: "You have to clap to keep the rhythm. Come on, keep up!"
processEvent141_2	Nicoliaux "I don't even want to be here. My parents made me come. "
processEvent142_2	Nicoliaux, success: "Now you've got it!"
processEvent140_3	Sansa: "We bow to show our respect to the elementals. Just like this, see?"
processEvent141_3	Sansa "It's not that hard. The most important thing is to let your heart guide you. "
processEvent142_3	Sansa, success: "Perfect! You're nearly as good as us!"
processEvent140_4	Powle: "You have to cheer like this! Don't be shy, really get in there and throw your weight around!"
processEvent141_4	Powle "You're terrible! You dance worse than my nana, and she's almost dead."
processEvent142_4	Powle, success: "You look like you've done this before."
processEvent140_5	Ryd: "We always d-do this, like we've just b-been surprised by s-something."
processEvent141_5	Ryd "I wonder if any moogles will come and watch this time."
processEvent142_5	Ryd, success: "H-How did you l-learn it so f-fast?"
processEvent140_6	Elyn: "You can't forget this part! You have to keep a lookout for the elementals."
processEvent141_6	Elyn "Hey, what are you here for? Me? I was running in the forest and tripped."
processEvent142_6	Elyn, success: "See how well you did? Aren't we good teachers?"
--????????processEvent150	  startNQCutScene("man0g150", 1)?																			----
processEvent150_2	Fufucha: "Twelve be good, what are those little brats getting into now?"
processEvent150_3	 ???: "<whisper>" (Different in other localizations: "Kosokoso")
processEvent150_4	 ???: "<whisper>" (Different in other localizations: "Hisohiso")
processEvent160	Cutscene of this kids telling you to escort them somewhere in the forest.
processEvent170	Escort Duty Start Cutscene.
processEvent180	Escort Duty End Cutscene. Warps into echo.
processEvent180_2	Hermit reminder: "Seek out the younglin's and bid them return. Unless you'd prefer they make a tasty snack for the nearest feral beast? Bloody fool..."
processEvent181	Cutscene with Moogle telling you the mask can't be fixed.
processEvent182	Cutscene, exit echo. Hermit finds out you know Mooglespeak.
processEvent182_2	Miounne reminder: "Wandered about the Twelveswood with the younglings? Gods save us! It's small wonder you adventurers have a reputation for being dangerous."
processEvent185	Cutscene with Fufucha, giving payments and such.
processEvent185_2	Miounne reminder to go to the LNC guild: "The Wailers and the Quiver have been scouring the wood since the Hedge came down".
processEvent190	Talking to Willelda in the LNC guild.
processEvent190_2	Reminder message from Willelda: "You may proceed. Commander Burchard and Commander Nuala await you within.".
processEvent200	Cutscene, warp into echo in the LNC guild.
processEvent200_2	Nuala: "Tend the wounded! Staunch the bleeding!"
processEvent200_3	T'kebbe: "I couldn't get a good look. Elemental, or perhaps a man... I-I cannot say for certain."
processEvent200_4	Farrimond: "The shadows... They came to life..."
processEvent200_5	Mansel: "You, help us! Quickly! We have wounded!"
processEvent200_6	Jijimaya: "The elementals rage as I've never heard. And I feel great fear among the people, as well—genuine terror. What could have done this?"
processEvent200_7	Langloisiert: "St-Stop...please... The pain is too great..."
processEvent200_8	Cecillia: "<wheeze> I can't...breathe..."
processEvent200_9	Turstin: "What the hells was that?"
processEvent200_10	Hellbhanth: "Bugger it! I lost my bloody polearm. I really liked that polearm."
processEvent200_11	Pasdevillet: "To bring down the Hedge is to bring down the greenwrath upon oneself. Such a life is forfeit."
processEvent210	Cutscene implicating Dunstan and two wailers asking you to join them for a briefing.
processEvent210_2	Burchard: "I can make no sense of it. Dunstan... By the Twelve, but why?"
processEvent220	Cutscene explaining wildlings.
processEvent220_2	Willelda, reminder: "We have seen our share of adventurers in Gridania over the years—some sure-footed on the path of righteousness, and others not so."
processEvent220_3	Burchard: "Adventurers share a certain bond, I know, but should any of your brethren act suspiciously, you must report them to the Wailers."
processEventComplete	Final chat with Miounne to end the quest.
processEvent1000_2	Beaming Adventurer?: "Why the moogles would want to help a complete stranger like you is beyond me. Got me wondering if you might not be one of these forest-beckoned souls the conjurers are always on about."
processEvent1000_3	Opyltyl: Msg to warp back into the BTN instance. "Ah you must be the poor soul Fufucha has running all over creation."
processEvent1000_5	Nuala?: "Understand that we do not wish to see you made the scapegoat in all of this. We seek only to find the perpetrator as swiftly as possible."
processTtrBlkNml001	Blocker npc during the first echo sequence.
processEventTu_001	Starts the linkshell tutorial.


--]]

-- Sequence Numbers
SEQ_000 = 0;	-- (Private Area) Roost Echo Scene.
SEQ_005 = 5;	-- Go attune at Camp Bentbranch
SEQ_010 = 10;	-- Attuned, go back to Miuonne. Info: <param1> If 1, Miounne gave you a tutorial guildleve else 0.
SEQ_012 = 12;	-- Talk to Miuonne again.
SEQ_015 = 15;	-- Find the LTW and CNJ Guilds. Info: Params 2 and 3 set to 5 and 15 will show the msg that you visited both guilds and to notify Baderon on the LS.
SEQ_040 = 40;	-- Go to BTN guild and talk to Opyltyl.
SEQ_050 = 50;	-- Learn the dance from the kids.
SEQ_055 = 55;	-- Chat with the kids.
SEQ_060 = 60;	-- Meet at White Wolf Gate.
SEQ_065 = 65;	-- Escort Mission Duty
SEQ_070 = 70;	-- Walk to the stump.
SEQ_071 = 71;	-- Exit the stump area.
SEQ_072 = 72;	-- Return to the BTN guild.
SEQ_075 = 75;	-- Contact Miounne on LS
SEQ_080 = 80;	-- Visit the LNC guid and talk to Willelda.
SEQ_085 = 85;	-- Talk to Buchard.
SEQ_090 = 90;	-- Talk to Buchard again.
SEQ_095 = 95;	-- Talk to Nuala.
SEQ_100 = 100;	-- Contact Miounne on LS
SEQ_105 = 105;	-- Return to the Roost and talk to Miounne.

-- Quest Data
FLAG_EMOTE_DONE1	= 1;
FLAG_EMOTE_DONE2	= 2;
FLAG_EMOTE_DONE3	= 3;
FLAG_EMOTE_DONE4	= 4;
FLAG_EMOTE_DONE5	= 5;
FLAG_EMOTE_DONE6	= 6;

CNTR_SEQ15_LTW		= 0;
CNTR_SEQ15_CNJ		= 1;

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{330},
	{332, 333, 334, 335},
	{131, 132, 133},
	{210, 211, 212, 213, 214, 215},
	{322, 323, 324}
};

-- Actor Class Ids
MIOUNNE                         = 1000230;
VKOROLON                        = 1000458;
WISPILY_WHISKERED_WOODWORKER    = 1000562;
AMIABLE_ADVENTURER              = 1001057;
MOROSE_MERCHANT                 = 1001058;
NARROW_EYED_ADVENTURER          = 1001059;
BEAMING_ADVENTURER              = 1001062;
WELL_BUNDLED_ADVENTURER         = 1001060;
UNCONCERNED_PASSERBY            = 1001648;
--BLOCKER                       = ;

-- Sequence 015
HEREWARD		= 1000231;
SOILEINE		= 1000234;
CNJ_TRIG		= 1090200;

-- Echo in the CNJ Guild
YDA				= 1000009;
PAPALYMO		= 1000010;
O_APP_PESI		= 1000033;
INGRAM			= 1000372;
HETZKIN			= 1000460;
GUGULA			= 1000513;
SWETHYNA		= 1000680;
BIDDY			= 1000737;
CHALLINIE		= 1000956;

-- BTN Guild
OPYLTYL			= 1000236;
FUFUCHA			= 1000237;
POWLE			= 1000238;
SANSA			= 1000239;
NICOLLAUX		= 1000409;
AUNILLE			= 1000410;
ELYN			= 1000411;
RYD				= 1000412;
KIDS_TRIGGER	= 1090201;
GATE_TRIGGER	= 1090202;

-- Post Escort Duty
STUMP_TRIGGER		= 1090203;
STUMP_EXIT_TRIGGER	= 1090204;
BTN_TRIGGER			= 1090046;

-- LNC Guild
WILLELDA		= 1000242;
BURCHARD		= 1000243;

-- Echo in the LNC Guild
TKEBBE			= 1000015;
FARRIMOND		= 1000017;
NUALA			= 1000681;
MANSEL			= 1000682;
CECILIA			= 1000683;
TURSTIN			= 1000733;
LANGLOISIERT	= 1000734;
HELBHANTH		= 1000735;
PASDEVILLET		= 1000738;
JIJIMAYA		= 1000741;

-- Quest Markers
MRKR_MIOUNNE	= 11000601;

function onStart(player, quest) 
	player:SendMessage(0x1D,"",">Started man0g1 in man0g1!");
    quest:StartSequence(SEQ_000);
    
    -- Immediately move to the Adventurer's Guild private area
	callClientFunction(player, "delegateEvent", player, quest, "processEvent100");
	GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 2, 15, 67.034, 4, -1205.6497, -1.074);
	player:SendGameMessage(quest, 353, 0x20);
	player:SendGameMessage(quest, 354, 0x20);	
	player:endEvent();
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();

    if (sequence == SEQ_000) then      
        quest:SetENpc(MIOUNNE, QFLAG_TALK);
        quest:SetENpc(VKOROLON);
        quest:SetENpc(WISPILY_WHISKERED_WOODWORKER);
        quest:SetENpc(AMIABLE_ADVENTURER);
        quest:SetENpc(MOROSE_MERCHANT);
        quest:SetENpc(NARROW_EYED_ADVENTURER);
        quest:SetENpc(BEAMING_ADVENTURER);
        quest:SetENpc(WELL_BUNDLED_ADVENTURER);
        quest:SetENpc(UNCONCERNED_PASSERBY);        
    elseif (sequence == SEQ_005) then 
        quest:SetENpc(MIOUNNE);
	elseif (sequence == SEQ_010) then 
		quest:SetENpc(MIOUNNE, QFLAG_TALK);
	elseif (sequence == SEQ_012) then 
		quest:SetENpc(MIOUNNE, QFLAG_TALK);
	elseif (sequence == SEQ_015) then 
		local subseqLTW = data:GetCounter(CNTR_SEQ15_LTW);
		local subseqCNJ = data:GetCounter(CNTR_SEQ15_CNJ);
		-- Always active in this seqence
		quest:SetENpc(MIOUNNE);
		quest:SetENpc(HEREWARD, (subseqLTW <= 1) and QFLAG_TALK or QFLAG_OFF);
		-- CNJ and In Echo
		quest:SetENpc(SOILEINE, (subseqCNJ == 0) and QFLAG_TALK or QFLAG_OFF);
		quest:SetENpc(CNJ_TRIG, (subseqCNJ == 1) and QFLAG_PUSH or QFLAG_OFF, false, (subseqCNJ == 1));
		quest:SetENpc(YDA);
		quest:SetENpc(PAPALYMO);
		quest:SetENpc(O_APP_PESI);
		quest:SetENpc(SWETHYNA, (subseqCNJ == 2) and QFLAG_TALK or QFLAG_OFF);
		quest:SetENpc(INGRAM);
		quest:SetENpc(HETZKIN);
		quest:SetENpc(GUGULA);
		quest:SetENpc(BIDDY);
		quest:SetENpc(CHALLINIE);
	elseif (sequence == SEQ_040) then 
        quest:SetENpc(OPYLTYL, QFLAG_TALK);
		quest:SetENpc(MIOUNNE);
	elseif (sequence == SEQ_050) then 
		quest:SetENpc(OPYLTYL, QFLAG_TALK);
        quest:SetENpc(AUNILLE, not data:GetFlag(FLAG_EMOTE_DONE1) and QFLAG_TALK or QFLAG_OFF, true, false, not data:GetFlag(FLAG_EMOTE_DONE1));
		quest:SetENpc(NICOLLAUX, not data:GetFlag(FLAG_EMOTE_DONE2) and QFLAG_TALK or QFLAG_OFF, true, false, not data:GetFlag(FLAG_EMOTE_DONE2));
		quest:SetENpc(SANSA, not data:GetFlag(FLAG_EMOTE_DONE3) and QFLAG_TALK or QFLAG_OFF, true, false, not data:GetFlag(FLAG_EMOTE_DONE3));
		quest:SetENpc(POWLE, not data:GetFlag(FLAG_EMOTE_DONE4) and QFLAG_TALK or QFLAG_OFF, true, false, not data:GetFlag(FLAG_EMOTE_DONE4));
		quest:SetENpc(RYD, not data:GetFlag(FLAG_EMOTE_DONE5) and QFLAG_TALK or QFLAG_OFF, true, false, not data:GetFlag(FLAG_EMOTE_DONE5));
		quest:SetENpc(ELYN, not data:GetFlag(FLAG_EMOTE_DONE6) and QFLAG_TALK or QFLAG_OFF, true, false, not data:GetFlag(FLAG_EMOTE_DONE6));
		quest:SetENpc(FUFUCHA);
	elseif (sequence == SEQ_055) then
		quest:SetENpc(OPYLTYL, QFLAG_TALK);
		quest:SetENpc(KIDS_TRIGGER, QFLAG_PUSH, false, true);
        quest:SetENpc(AUNILLE);
		quest:SetENpc(NICOLLAUX);
		quest:SetENpc(SANSA);
		quest:SetENpc(POWLE);
		quest:SetENpc(RYD);
		quest:SetENpc(ELYN);
		quest:SetENpc(FUFUCHA);
	elseif (sequence == SEQ_060) then
		quest:SetENpc(GATE_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_065) then
	elseif (sequence == SEQ_070) then
		quest:SetENpc(STUMP_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_071) then		
		quest:SetENpc(STUMP_EXIT_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_072) then
		quest:SetENpc(BTN_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_075) then
	elseif (sequence == SEQ_080) then
		quest:SetENpc(WILLELDA, QFLAG_TALK);
		quest:SetENpc(MIOUNNE);
	elseif (sequence == SEQ_085) then
		quest:SetENpc(BURCHARD, QFLAG_TALK);
		quest:SetENpc(WILLELDA);
	elseif (sequence == SEQ_090) then
		quest:SetENpc(BURCHARD, QFLAG_TALK);
		quest:SetENpc(TKEBBE);
		quest:SetENpc(FARRIMOND);
		quest:SetENpc(LANGLOISIERT);
		quest:SetENpc(NUALA);
		quest:SetENpc(MANSEL);
		quest:SetENpc(CECILIA);
		quest:SetENpc(TURSTIN);
		quest:SetENpc(HELBHANTH);
		quest:SetENpc(PASDEVILLET);
		quest:SetENpc(JIJIMAYA);
	elseif (sequence == SEQ_095) then
		quest:SetENpc(NUALA, QFLAG_TALK);
		quest:SetENpc(BURCHARD);
		quest:SetENpc(JIJIMAYA);
		quest:SetENpc(TKEBBE);
		quest:SetENpc(FARRIMOND);
		quest:SetENpc(MANSEL);
		quest:SetENpc(CECILIA);
	elseif (sequence == SEQ_100) then
		quest:SetENpc(NUALA);
		quest:SetENpc(BURCHARD);
		quest:SetENpc(WILLELDA);
	elseif (sequence == SEQ_105) then
		quest:SetENpc(MIOUNNE, QFLAG_REWARD);
		quest:SetENpc(NUALA);
		quest:SetENpc(BURCHARD);
		quest:SetENpc(WILLELDA);
    end
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    
    if (sequence == SEQ_000) then
        seq000_onTalk(player, quest, npc, classId);
    elseif (sequence == SEQ_005) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent110_2");
		end
	elseif (sequence == SEQ_010) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent114");
			quest:StartSequence(SEQ_012);
		end
	elseif (sequence == SEQ_012) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent115");
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_015);
		end
	elseif (sequence == SEQ_015) then
		if (seq015_onTalk(player, quest, npc, classId) == true) then
			quest:UpdateENPCs();
			return;
		end
	elseif (sequence == SEQ_040) then
		if (classId == OPYLTYL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140");
			quest:StartSequence(SEQ_050);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -223.792, 12, -1498.369, -1.74);
			return;
		elseif (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent137_2");
		end
	elseif (sequence == SEQ_050) then
		if (classId == OPYLTYL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent1000_3");
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -223.792, 12, -1498.369, -1.74);
			return;
		else
			seq050_onTalk(player, quest, npc, classId);
		end
	elseif (sequence == SEQ_055) then
		if (classId == FUFUCHA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent150_2");
		elseif (classId == OPYLTYL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent1000_3");
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -231.474, 12, -1500.86, 0.73);
		elseif (classId == AUNILLE or classId == NICOLLAUX or classId == SANSA or classId == POWLE or classId == RYD or classId == ELYN) then
			local randNum = math.random(1, 2);
			if (randNum == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent150_3");
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent150_4");
			end
		end
	elseif (sequence == SEQ_060) then
	elseif (sequence == SEQ_065) then
	elseif (sequence == SEQ_070) then
	elseif (sequence == SEQ_071) then
	elseif (sequence == SEQ_072) then
	elseif (sequence == SEQ_075) then
	elseif (sequence == SEQ_080) then
		if (classId == WILLELDA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent190");
			quest:StartSequence(SEQ_085);
		elseif (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent185_2");
		end
	elseif (sequence == SEQ_085) then
		if (classId == BURCHARD) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200");
			quest:StartSequence(SEQ_090);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, 176.13, 27.5, -1581.84, -1.0);
			return;
		elseif (classId == WILLELDA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent190_2");
		end
	elseif (sequence == SEQ_090) then	
		if (classId == BURCHARD) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210");
			quest:StartSequence(SEQ_095);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4);
			return;
		elseif (classId == NUALA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_2");
		elseif (classId == TKEBBE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_3");
		elseif (classId == FARRIMOND) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_4");
		elseif (classId == MANSEL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_5");
		elseif (classId == JIJIMAYA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_6");
		elseif (classId == LANGLOISIERT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_7");
		elseif (classId == CECILIA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_8");
		elseif (classId == TURSTIN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_9");
		elseif (classId == HELBHANTH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_10");
		elseif (classId == PASDEVILLET) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_11");
		end
	elseif (sequence == SEQ_095) then
		if (classId == NUALA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent220");
			player:EndEvent();
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_100);
			GetWorldManager():WarpToPublicArea(player);
			return;
		elseif (classId == BURCHARD) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_2");
		end
	elseif (sequence == SEQ_100) then
		if (classId == NUALA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent1000_5");
		elseif (classId == BURCHARD) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent220_3");
		elseif (classId == WILLELDA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent220_2");
		end
	elseif (sequence == SEQ_105) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:EndEvent();
			player:CompleteQuest(quest);
			return;
		elseif (classId == NUALA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent1000_5");
		elseif (classId == BURCHARD) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent220_3");
		elseif (classId == WILLELDA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent220_2");
		end
	end
	
	player:EndEvent();
	quest:UpdateENPCs();	
end

function seq000_onTalk(player, quest, npc, classId)
    if (classId == MIOUNNE) then
			player:SendMessage(0x1D,"",">F-S000-Talk Miounne");
		callClientFunction(player, "delegateEvent", player, quest, "processEvent110");
			player:SendMessage(0x1D,"",">PE110");
		quest:NewNpcLsMsg(1);
		quest:StartSequence(SEQ_005); -- Change from S003 to S005
        player:EndEvent();
		quest:UpdateENPCs();
		GetWorldManager():DoZoneChange(player, 155, nil, 0, 15, player.positionX, player.positionY, player.positionZ, player.rotation);
		--player:SendMessage(0x1D,"",">End Event after PE100_1");
		--player:SendMessage(0x1D,"",">S003 Start");
		--local director = GetWorldManager():GetArea(155):CreateDirector("AfterQuestWarpDirector", false);		
		--director:StartDirector(true);
        --player:AddDirector(director);
		--player:SetLoginDirector(director);	     
		--player:KickEvent(director, "noticeEvent", true);
		---quest:UpdateENPCs();
        --GetWorldManager():WarpToPublicArea(player);
        --GetWorldManager():DoZoneChange(player, 155, nil, 0, 15, player.positionX, player.positionY, player.positionZ, player.rotation);
		return;
    elseif (classId == BEAMING_ADVENTURER) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent100_6");
    elseif (classId == AMIABLE_ADVENTURER) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent100_3");
    elseif (classId == MOROSE_MERCHANT) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent100_2");
    elseif (classId == NARROW_EYED_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent100_7");
    elseif (classId == UNCONCERNED_PASSERBY) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent100_9");
    elseif (classId == VKOROLON) then
        callClientFunction(player, "delegateEvent", player, GetStaticActor("DftWil"), "defaultTalkWithVkorolon_001");
    elseif (classId == WELL_BUNDLED_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent100_4");        
    elseif (classId == WISPILY_WHISKERED_WOODWORKER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent100_8");
    end
	player:EndEvent();
end

function seq015_onTalk(player, quest, npc, classId)
	local data = quest:GetData();
	local subseqLTW = data:GetCounter(CNTR_SEQ15_LTW);
	local subseqCNJ = data:GetCounter(CNTR_SEQ15_CNJ);
	
	if (classId == MIOUNNE) then
		if (subseqCNJ == 3) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent135_2");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent115_2");
		end
	-- LTW Guild Events
	elseif (classId == HEREWARD) then
		if (subseqLTW == 0) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent120");
			data:IncCounter(CNTR_SEQ15_LTW);	
			--give 1000g					
		elseif (subseqLTW == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent120_2");
			data:IncCounter(CNTR_SEQ15_LTW);	
			if (subseqCNJ >= 3) then
				seq015_endSequence(player, quest);
			end
		else 
			callClientFunction(player, "delegateEvent", player, quest, "processEvent120_2");
		end
	-- CNJ Guild and Echo
	elseif (classId == SOILEINE) then
		if (subseqCNJ == 0) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent125");
			data:IncCounter(CNTR_SEQ15_CNJ);
		elseif (subseqCNJ == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent125_2");
		elseif (subseqCNJ == 2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent125_2");
		end
	elseif (classId == O_APP_PESI) then
		if (subseqCNJ == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent130");
			data:IncCounter(CNTR_SEQ15_CNJ);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent130_3");
		end
	elseif (classId == YDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent130_4");
	elseif (classId == PAPALYMO) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent130_5");
	elseif (classId == GUGULA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent130_6");
	elseif (classId == INGRAM) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent130_7");
	elseif (classId == CHALLINIE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent130_8");
	elseif (classId == HETZKIN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent130_2");	
	elseif (classId == BIDDY) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent130_2");
	elseif (classId == SWETHYNA) then
		if (subseqLTW == 0) then			
			callClientFunction(player, "delegateEvent", player, quest, "processEvent135");
			data:IncCounter(CNTR_SEQ15_CNJ);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent136");
			data:IncCounter(CNTR_SEQ15_CNJ);
			quest:NewNpcLsMsg(1);
			player:EndEvent();
			GetWorldManager():WarpToPublicArea(player);
			return true;
		end
	end
end

function seq015_endSequence(player, quest)
	callClientFunction(player, "delegateEvent", player, quest, "processEvent123");
end

function seq050_onTalk(player, quest, npc, classId)
	local data = quest:GetData();

	if (classId == AUNILLE) then
		if (not data:GetFlag(FLAG_EMOTE_DONE1)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_1");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_1");
		end
	elseif (classId == NICOLLAUX) then
		if (not data:GetFlag(FLAG_EMOTE_DONE2)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_2");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_2");
		end
	elseif (classId == SANSA) then
		if (not data:GetFlag(FLAG_EMOTE_DONE3)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_3");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_3");
		end
	elseif (classId == POWLE) then
		if (not data:GetFlag(FLAG_EMOTE_DONE4)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_4");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_4");
		end
	elseif (classId == RYD) then
		if (not data:GetFlag(FLAG_EMOTE_DONE5)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_5");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_5");
		end
	elseif (classId == ELYN) then
		if (not data:GetFlag(FLAG_EMOTE_DONE6)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_6");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_6");
		end
	elseif (classId == FUFUCHA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent140_10");
	end
end

function onPush(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();  
	local data = quest:GetData();
	local subseqCNJ = data:GetCounter(CNTR_SEQ15_CNJ);
	
    if (sequence == SEQ_000) then    
    elseif (sequence == SEQ_015) then
		if (classId == CNJ_TRIG and subseqCNJ == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent130");
			data:IncCounter(CNTR_SEQ15_CNJ);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -353.05, 6.25, -1697.39, 0.774);
			return;
		end
	elseif (sequence == SEQ_055) then
		if (classId == KIDS_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent160");
			player:EndEvent();
			quest:StartSequence(SEQ_060);
			GetWorldManager():WarpToPublicArea(player, -209.817, 18, -1477.372, 1.4);
			return;
		end
	elseif (sequence == SEQ_060) then
		if (classId == GATE_TRIGGER) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				-- DO ESCORT DUTY HERE
				-- startMan0g1Content(player, quest);
				-- For now just skip the sequence
				quest:StartSequence(SEQ_065);
				callClientFunction(player, "delegateEvent", player, quest, "processEvent180");
				player:EndEvent();
				quest:StartSequence(SEQ_070);
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -770.197, 23, -1086.209);
				return;
			end
			player:EndEvent();
		end	
	elseif (sequence == SEQ_070) then
		if (classId == STUMP_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent181");
			player:EndEvent();
			quest:StartSequence(SEQ_071);
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1);
			return;
		end		
	elseif (sequence == SEQ_071) then
		if (classId == STUMP_EXIT_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent182");
			player:EndEvent();
			quest:StartSequence(SEQ_072);
			GetWorldManager():WarpToPublicArea(player, -185, 6, -962, -3);
			return;
		end			
	elseif (sequence == SEQ_072) then
		if (classId == BTN_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent185");
			player:EndEvent();
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_075);
		end
    end
	quest:UpdateENPCs();
end

function onEmote(player, quest, npc, eventName)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();	

	-- Play the emote
	if (classId == AUNILLE) then		-- Beckon
		player:DoEmote(npc.Id, 8, 21071);
	elseif (classId == NICOLLAUX) then	-- Clap
		player:DoEmote(npc.Id, 7, 21061);
	elseif (classId == SANSA) then		-- Bow
		player:DoEmote(npc.Id, 5, 21041);
	elseif (classId == POWLE) then 		-- Cheer
		player:DoEmote(npc.Id, 6, 21051);
	elseif (classId == RYD) then		-- Surprised
		player:DoEmote(npc.Id, 1, 21001);
	elseif (classId == ELYN) then		-- Lookout
		player:DoEmote(npc.Id, 22, 21211);
	end
	wait(2.5);
	
	-- Handle the result
	if (sequence == SEQ_050) then
		if (classId == AUNILLE) then
			if (not data:GetFlag(FLAG_EMOTE_DONE1)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_1");
				data:SetFlag(FLAG_EMOTE_DONE1);
			end
		elseif (classId == NICOLLAUX) then
			if (not data:GetFlag(FLAG_EMOTE_DONE2)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_2");
				data:SetFlag(FLAG_EMOTE_DONE2);
			end
		elseif (classId == SANSA) then
			if (not data:GetFlag(FLAG_EMOTE_DONE3)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_3");
				data:SetFlag(FLAG_EMOTE_DONE3);
			end
		elseif (classId == POWLE) then
			if (not data:GetFlag(FLAG_EMOTE_DONE4)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_4");
				data:SetFlag(FLAG_EMOTE_DONE4);
			end
		elseif (classId == RYD) then
			if (not data:GetFlag(FLAG_EMOTE_DONE5)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_5");
				data:SetFlag(FLAG_EMOTE_DONE5);
			end
		elseif (classId == ELYN) then
			if (not data:GetFlag(FLAG_EMOTE_DONE6)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_6");
				data:SetFlag(FLAG_EMOTE_DONE6);
			end
		end
	end
	
	-- Check result and finish
	if (bit32.band(data:GetFlags(), 0x7E) == 0x7E) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent150");
		player:EndEvent();
		quest:StartSequence(SEQ_055);
		GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -231.474, 12, -1500.86, 0.73);
		return
	end
	
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNotice(player, quest, target)
    player:EndEvent();
    player:SendMessage(0x20, "", "Test");
    callClientFunction(player, "delegateEvent", player, quest, "processEventTu_001");  -- Linkshell Tutorial
    player:EndEvent();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_005) then
			msgPack = 1;		
		elseif (sequence == SEQ_015 and quest:GetData():GetCounter(CNTR_SEQ15_LTW) ~= 1 and quest:GetData():GetCounter(CNTR_SEQ15_CNJ) ~= 3) then
			msgPack = 2;
		elseif ((sequence == SEQ_015 and quest:GetData():GetCounter(CNTR_SEQ15_LTW) >= 1 and quest:GetData():GetCounter(CNTR_SEQ15_CNJ) >= 3) or sequence == SEQ_040) then
			msgPack = 3;
		elseif (sequence == SEQ_075 or sequence == SEQ_080) then
			msgPack = 4;
		elseif (sequence == SEQ_100 or sequence == SEQ_105) then
			msgPack = 5;
		end
		
		-- Quick way to handle all msgs nicely.
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1300018);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
		
		-- Handle anything else
		if (sequence == SEQ_005) then
			showTutorialSuccessWidget(player, 9080);
			wait(3);
			closeTutorialWidget(player);
			endTutorialMode(player);
		elseif (sequence == SEQ_015 and quest:GetData():GetCounter(CNTR_SEQ15_LTW) >= 1 and quest:GetData():GetCounter(CNTR_SEQ15_CNJ) >= 3) then
			quest:StartSequenceForNpcLs(SEQ_040);
		elseif (sequence == SEQ_075) then
			quest:StartSequenceForNpcLs(SEQ_080);
		elseif (sequence == SEQ_100) then
			quest:StartSequenceForNpcLs(SEQ_105);
		end
	end
	
	player:EndEvent();
end

function getJournalInformation(player, quest)
	local data = quest:GetData();
	return ENABLE_GL_TUTORIAL and 1 or 0, data:GetCounter(CNTR_SEQ15_LTW) * 5, data:GetCounter(CNTR_SEQ15_CNJ) * 5;
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    local possibleMarkers = {};

    if (sequence == SEQ_000) then
	
    elseif (sequence == SEQ_005) then 
	
	elseif (sequence == SEQ_010) then 
	
	elseif (sequence == SEQ_012) then 
	
	elseif (sequence == SEQ_015) then 
		local subseqLTW = data:GetCounter(CNTR_SEQ15_LTW);
		local subseqCNJ = data:GetCounter(CNTR_SEQ15_CNJ);
		
	elseif (sequence == SEQ_040) then 
        
	elseif (sequence == SEQ_050) then 
		
	elseif (sequence == SEQ_055) then
		return MRKR_KID_TRIGGER;
	elseif (sequence == SEQ_060) then
		return MRKR_GATE_TRIGGER;
	elseif (sequence == SEQ_065) then
	elseif (sequence == SEQ_070) then
	elseif (sequence == SEQ_071) then
	elseif (sequence == SEQ_072) then
	
	elseif (sequence == SEQ_075) then
	
	elseif (sequence == SEQ_080) then
	
	elseif (sequence == SEQ_085) then
	
	elseif (sequence == SEQ_090) then
	
	elseif (sequence == SEQ_095) then
	
	elseif (sequence == SEQ_100) then
	
	elseif (sequence == SEQ_105) then
	
    end

    return unpack(possibleMarkers)
end


