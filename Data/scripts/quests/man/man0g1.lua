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
processEvent140_1	Aunillie: "Watch how I do it. You have to beckon the elementals near. Like this."
processEvent141_1	Aunillie "I wonder if the elementals dance as we do..."
processEvent142_1	Aunillie, success: "Hahaha, that's it!"
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
processEvent182_2		Miounne reminder: "Wandered about the Twelveswood with the younglings? Gods save us! It's small wonder you adventurers have a reputation for being dangerous."
processEvent185			Cutscene with Fufucha, giving payments and such.
processEvent185_2		Miounne reminder to go to the LNC guild: "The Wailers and the Quiver have been scouring the wood since the Hedge came down".
processEvent190			Talking to Willelda in the LNC guild.
processEvent190_2		Reminder message from Willelda: "You may proceed. Commander Burchard and Commander Nuala await you within.".
processEvent200			Cutscene, warp into echo in the LNC guild.
processEvent200_2		Nuala: "Tend the wounded! Staunch the bleeding!"
processEvent200_3		T'kebbe: "I couldn't get a good look. Elemental, or perhaps a man... I-I cannot say for certain."
processEvent200_4		Farrimond: "The shadows... They came to life..."
processEvent200_5		Mansel: "You, help us! Quickly! We have wounded!"
processEvent200_6		Jijimaya: "The elementals rage as I've never heard. And I feel great fear among the people, as well—genuine terror. What could have done this?"
processEvent200_7		Langloisiert: "St-Stop...please... The pain is too great..."
processEvent200_8		Cecillia: "<wheeze> I can't...breathe..."
processEvent200_9		Turstin: "What the hells was that?"
processEvent200_10		Hellbhanth: "Bugger it! I lost my bloody polearm. I really liked that polearm."
processEvent200_11		Pasdevillet: "To bring down the Hedge is to bring down the greenwrath upon oneself. Such a life is forfeit."
processEvent210			Cutscene implicating Dunstan and two wailers asking you to join them for a briefing.
processEvent210_2		Burchard: "I can make no sense of it. Dunstan... By the Twelve, but why?"
processEvent220			Cutscene explaining wildlings.
processEvent220_2		Willelda, reminder: "We have seen our share of adventurers in Gridania over the years—some sure-footed on the path of righteousness, and others not so."
processEvent220_3		Burchard: "Adventurers share a certain bond, I know, but should any of your brethren act suspiciously, you must report them to the Wailers."
processEventComplete	Final chat with Miounne to end the quest.
processEvent1000_2		Beaming Adventurer?: "Why the moogles would want to help a complete stranger like you is beyond me. Got me wondering if you might not be one of these forest-beckoned souls the conjurers are always on about."
processEvent1000_3		Opyltyl: Msg to warp back into the BTN instance. "Ah you must be the poor soul Fufucha has running all over creation."
processEvent1000_5		Nuala?: "Understand that we do not wish to see you made the scapegoat in all of this. We seek only to find the perpetrator as swiftly as possible."
processTtrBlkNml001		Blocker npc during the first echo sequence.
processEventTu_001		Starts the linkshell tutorial.


--Cutscene client names in order:
man0g100 - processEvent100 - done
man0g110 - processEvent110 - done - s000 - works - Miounne - Name ID: 1300018 - Model ID: 1000230 - Marker ID: 11000601 11000603 11000620 11000713 11008101 11040110
man0g120 - processEvent120 - done - s015 - works - HEREWARD - Name ID: 1000324 - Model ID: 1000231 - Marker ID: 11000604
man0g130 - processEvent130 - done - s015 - works - CNJ_TRIG - Name ID: 4000257 - Model ID: 1090200 - Marker ID: 11000602 11000606 11000609 11000610 11000611 11000612 11000613 11000614 11000615
man0g135 - processEvent135 - done - s015 - works - no LTW - SWETHYNA - Name: 1100010 - Model: 1000680 - Marker: 11000607
man0g135 - processEvent136 - done - s015 - works - ys LTW - SWETHYNA - ^
man0g140 - processEvent140 - done - s040 - works - OPYLTYL - name: 1600132 - model: 1000236 - Marker: 11000608
man0g150 - processEvent150 - done - n/a  - works - With you and Fufucha. Not originally used? Check youtube videos - After doing emotes, before kids ask you to help. Use onPush KIDS_TRIGGER - KIDS_TRIGGER - Name ID: 4000257 - Model ID: 1090201 - Marker ID: 11000602 11000606 11000609 11000610 11000611 11000612 11000613 11000614 11000615
man0g160 - processEvent160 - done - s055 - works - Kids tell you to meet them
man0g170 - processEvent170 - done - s060 - works - GATE_TRIGGER (outside town) - Name ID: 4000257 - Model ID: 1090202 - Marker: 11000611
man0g180 - processEvent180 - done - s065 - works - GATE_TRIGGER - Name ID: 4000257 - Model ID: 1090202 - Marker ID: 11000612
man0g181 - processEvent181 - done - s070 - works - STUMP_TRIGGER - Name ID: 4000257 - Model ID: 1090203 - Marker ID: 11000613
man0g182 - processEvent182 - done - s071 - works - STUMP_EXIT_TRIGGER - Name ID: 4000257 - Model ID: 1090204 - Marker ID: 11000614
man0g185 - processEvent185 - done - s072 - works - BTN_TRIGGER - Name ID: 4000257 - Model ID: 1090046 - Marker ID: 11000615
man0g190 - processEvent190 - done - s080 - works - WILLELDA - name: 1100014 - model: 1000242 - marker: 11000616
man0g200 - processEvent200 - done - s085 - works - BURCHARD - name: 1000013 - model: 1000243 - marker: 11000617 11000618
man0g210 - processEvent210 - done - s090 - works - BURCHARD ^
man0g220 - processEvent220 - done - s095 - works - NUALA - name: 1100210 - model: 1000681 - marker: 11000619
	  processEventComplete - done - s105 - works - MIOUNNE - Miounne - Name ID: 1300018 - Model ID: 1000230 - Marker ID: 11000601 11000603 11000620 11000713 11008101 11040110

--unused markers:




--]]

-- Sequence Numbers
SEQ_000 = 0;	-- (Private Area) Roost Echo Scene.
SEQ_005 = 5;	-- Go attune at Camp Bentbranch
SEQ_010 = 10;	-- Attuned, go back to Miuonne. Info: <param1> If 1, Miounne gave you a tutorial guildleve else 0.
SEQ_012 = 12;	-- Talk to Miuonne again.
SEQ_015 = 15;	-- Find the LTW and CNJ Guilds. Info: Params 2 and 3 set to 5 and 15 will show the msg that you visited both guilds and to notify Miounne on the LS.
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
BLOCKER		                    = 1090372;

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
OPYLTYL					= 1000236;
FUFUCHA					= 1000237;
POWLE					= 1000238;
SANSA					= 1000239;
NICOLLAUX				= 1000409;
AUNILLIE				= 1000410;
ELYN					= 1000411;
RYD						= 1000412;
KIDS_TRIGGER			= 1090201;  -- needs existence
ESCORT_START_TRIGGER	= 1090202;  -- needs existence -- Also seq 60
ESCORT_END_TRIGGER		= 1090203;

-- Post Escort Duty -- place npcs
STUMP_TRIGGER		= 1090204;
STUMP_EXIT_TRIGGER	= 1090205;
BTN_TRIGGER			= 1090046;

-- LNC Guild
WILLELDA			= 1000242;
BURCHARD			= 1000243;
BURCHARD_INSTANCE	= 1002061;

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
--s000
MRKR_S000_MIOUNNE				= 11000601;
--s005			
MRKR_BENTBRANCH					= 11000602;
--S010
MRKR_S010_MIOUNNE				= 11000603;
--s015
MRKR_S015_HEREWARD				= 11000604;
MRKR_S015_SOILEINE				= 11000605;
MRKR_S015_CNJGUILD				= 11000606;
MRKR_S015_SWETHYNA				= 11000607;
--s040
MRKR_S040_OPYLTYL				= 11000608;
--s050
MRKR_S050_KIDS					= 11000609;
--s055
MRKR_S055_KIDS_TRIGGER			= 11000610;
--s060
MRKR_S060_ESCORT_START			= 11000611;
--s065
MRKR_S065_ESCORT_END			= 11000612;
--s070
MRKR_S070_STUMP_TRIGGER			= 11000613;
--s071
MRKR_S071_STUMP_EXIT_TRIGGER	= 11000614;
--s072
MRKR_S072_BTN_TRIGGER			= 11000615;
--s080
MRKR_S080_WILLELDA				= 11000616;
--s085
MRKR_S085_BURCHARD				= 11000617;
--s090	
MRKR_S090_BURCHARD				= 11000618;
--s095
MRKR_S095_NUALA					= 11000619;
--s105
MRKR_S105_MIOUNNE				= 11000620;



function onStart(player, quest) 
    quest:StartSequence(SEQ_000);
    
    -- Immediately move to the Adventurer's Guild private area
	callClientFunction(player, "delegateEvent", player, quest, "processEvent100");
	GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 2, 15, 67.034, 4, -1205.6497, -1.074);
	player:SendGameMessage(quest, 353, 0x20);
	player:SendGameMessage(quest, 354, 0x20);	
	player:endEvent();
end

function onFinish(player, quest)
	local data = quest:GetData();
	local subseqLTW = data:GetCounter(CNTR_SEQ15_LTW);
	local subseqCNJ = data:GetCounter(CNTR_SEQ15_CNJ);

	-- Reset counters for testing purposes.
	data:SetCounter(CNTR_SEQ15_LTW, 0);
	data:SetCounter(CNTR_SEQ15_CNJ, 0);
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
		quest:SetENpc(BLOCKER, QFLAG_NONE, false, true);
    elseif (sequence == SEQ_005) then 
        quest:SetENpc(MIOUNNE);
	elseif (sequence == SEQ_010) then 
		quest:SetENpc(MIOUNNE, QFLAG_TALK);
	elseif (sequence == SEQ_012) then 
		local subseqCNJ = data:SetCounter(CNTR_SEQ15_CNJ, 0);
		local subseqLTW = data:SetCounter(CNTR_SEQ15_LTW, 0);
		quest:SetENpc(MIOUNNE, QFLAG_TALK);
	elseif (sequence == SEQ_015) then 
		local subseqLTW = data:GetCounter(CNTR_SEQ15_LTW);
		local subseqCNJ = data:GetCounter(CNTR_SEQ15_CNJ);
		-- Always active in this seqence
		quest:SetENpc(MIOUNNE);
		quest:SetENpc(HEREWARD, (subseqLTW <= 1) and QFLAG_TALK or QFLAG_OFF);
		-- CNJ and In Echo
		quest:SetENpc(SOILEINE, (subseqCNJ == 0) and QFLAG_TALK or QFLAG_OFF);
		quest:SetENpc(CNJ_TRIG, (subseqCNJ == 1 or subseqCNJ == 2) and QFLAG_PUSH or QFLAG_OFF, false, (subseqCNJ == 1 or subseqCNJ == 2));
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
		data:ClearFlag(FLAG_EMOTE_DONE1);
		data:ClearFlag(FLAG_EMOTE_DONE2);
		data:ClearFlag(FLAG_EMOTE_DONE3);
		data:ClearFlag(FLAG_EMOTE_DONE4);
		data:ClearFlag(FLAG_EMOTE_DONE5);
		data:ClearFlag(FLAG_EMOTE_DONE6);
	elseif (sequence == SEQ_050) then 
		local emoteAunillie = (not data:GetFlag(FLAG_EMOTE_DONE1) and QFLAG_TALK or QFLAG_OFF);
		local emoteNicollaux = (not data:GetFlag(FLAG_EMOTE_DONE2) and QFLAG_TALK or QFLAG_OFF);
		local emoteSansa = (not data:GetFlag(FLAG_EMOTE_DONE3) and QFLAG_TALK or QFLAG_OFF);
		local emotePowle = (not data:GetFlag(FLAG_EMOTE_DONE4) and QFLAG_TALK or QFLAG_OFF);
		local emoteRyd = (not data:GetFlag(FLAG_EMOTE_DONE5) and QFLAG_TALK or QFLAG_OFF);
		local emoteElyn = (not data:GetFlag(FLAG_EMOTE_DONE6) and QFLAG_TALK or QFLAG_OFF);
		
		quest:SetENpc(OPYLTYL, QFLAG_TALK);
		quest:SetENpc(KIDS_TRIGGER, QFLAG_PUSH, false, true);
        quest:SetENpc(AUNILLIE, emoteAunillie, true, false, true);
		quest:SetENpc(NICOLLAUX, emoteNicollaux, true, false, true);
		quest:SetENpc(SANSA, emoteSansa, true, false, true);
		quest:SetENpc(POWLE, emotePowle, true, false, true);
		quest:SetENpc(RYD, emoteRyd, true, false, true);
		quest:SetENpc(ELYN, emoteElyn, true, false, true);
		quest:SetENpc(FUFUCHA);
	elseif (sequence == SEQ_055) then
		quest:SetENpc(OPYLTYL, QFLAG_TALK);
		quest:SetENpc(KIDS_TRIGGER, QFLAG_PUSH, false, true);
        quest:SetENpc(AUNILLIE);
		quest:SetENpc(NICOLLAUX);
		quest:SetENpc(SANSA);
		quest:SetENpc(POWLE);
		quest:SetENpc(RYD);
		quest:SetENpc(ELYN);
		quest:SetENpc(FUFUCHA);
	elseif (sequence == SEQ_060) then
		quest:SetENpc(ESCORT_START_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_065) then
		quest:SetENpc(ESCORT_END_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_070) then
		quest:SetENpc(STUMP_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(ESCORT_START_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_071) then	
		quest:SetENpc(ESCORT_START_TRIGGER, QFLAG_PUSH, false, true);
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
		quest:SetENpc(BURCHARD_INSTANCE, QFLAG_TALK);
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
		quest:SetENpc(WILLELDA, QFLAG_TALK);
	elseif (sequence == SEQ_095) then
		quest:SetENpc(NUALA, QFLAG_TALK);
		quest:SetENpc(BURCHARD_INSTANCE);
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
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -223.792, 12, -1498.369, -1.74); -- S050 private area needs emote programming
			-- skip privatearea 1, go straight to 2.			
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
		elseif (classId == AUNILLIE or classId == NICOLLAUX or classId == SANSA or classId == POWLE or classId == RYD or classId == ELYN) then
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
		if (classId == BURCHARD_INSTANCE) then
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
		elseif (classId == WILLELDA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent190");
			quest:StartSequence(SEQ_085);
		end
	elseif (sequence == SEQ_095) then
		if (classId == NUALA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent220");
			player:EndEvent();
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_100);
			if (player.CurrentArea.IsPrivate()) then
				GetWorldManager():WarpToPublicArea(player);
				return;
			else
				GetWorldManager():DoPlayerMoveInZone(player, 193.921, 27.9, -1580.823, 0.525, 0x11);
				return;
			end
		elseif (classId == BURCHARD_INSTANCE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_2");
		elseif (classId == TKEBBE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_3");
		elseif (classId == MANSEL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_5");
		elseif (classId == CECILIA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_8");
		elseif (classId == FARRIMOND) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_4");	
		elseif (classId == JIJIMAYA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent200_6");
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
			player:AddItem(1000001, 6000);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 6000);
			player:AddExp(10000, player:GetCurrentClassOrJobId(), 0);

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
		callClientFunction(player, "delegateEvent", player, quest, "processEvent110");
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
		--callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml001");
		
    elseif (classId == VKOROLON) then
        --callClientFunction(player, "delegateEvent", player, GetStaticActor("DftWil"), "defaultTalkWithVkorolon_001");
		
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
			player:AddItem(1000001, 2000);  -- Add 2000 gil
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 2000);					
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
			data:IncCounter(CNTR_SEQ15_CNJ); -- CNJ to 1
		elseif (subseqCNJ == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent125_2");
		elseif (subseqCNJ == 2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent125_2");
		end
	elseif (classId == O_APP_PESI) then
		if (subseqCNJ == 1) then
			--callClientFunction(player, "delegateEvent", player, quest, "processEvent130"); -- Same event as entering room?
			callClientFunction(player, "delegateEvent", player, quest, "processEvent130_3");
			data:IncCounter(CNTR_SEQ15_CNJ); --CNJ to 2
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
	elseif (classId == SWETHYNA) then -- Needs to not let it make you leave until you talked to o app pesi I think. Maybe not. He has flavor text?
		if (subseqLTW == 0) then			
			callClientFunction(player, "delegateEvent", player, quest, "processEvent135"); -- if you haven't gone to LTW yet
			data:IncCounter(CNTR_SEQ15_CNJ); --CNJ to 2
			--adding v
			player:EndEvent();
			quest:UpdateENPCs();
			GetWorldManager():WarpToPublicArea(player);
			return;
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent136"); --leaving guild like in man0l1 event060
			data:IncCounter(CNTR_SEQ15_CNJ); -- CNJ to 3
			quest:NewNpcLsMsg(1);
			player:EndEvent();
			GetWorldManager():WarpToPublicArea(player);
			return;
			--return true; --not in man0l1?
		end
	end
end

function seq015_endSequence(player, quest)
	callClientFunction(player, "delegateEvent", player, quest, "processEvent123");
	quest:NewNpcLsMsg(1);          --new
	quest:StartSequence(SEQ_040);  --new
end

function seq050_onTalk(player, quest, npc, classId)
	local data = quest:GetData();

	if (classId == AUNILLIE) then
		if (not data:GetFlag(FLAG_EMOTE_DONE1)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_1");
			player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 2);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_1");
		end
	elseif (classId == NICOLLAUX) then
		if (not data:GetFlag(FLAG_EMOTE_DONE2)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_2");
			player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 2);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_2");
		end
	elseif (classId == SANSA) then
		if (not data:GetFlag(FLAG_EMOTE_DONE3)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_3");
			player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 2);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_3");
		end
	elseif (classId == POWLE) then
		if (not data:GetFlag(FLAG_EMOTE_DONE4)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_4");
			player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 2);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_4");
		end
	elseif (classId == RYD) then
		if (not data:GetFlag(FLAG_EMOTE_DONE5)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_5");
			player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 2);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent141_5");
		end
	elseif (classId == ELYN) then
		if (not data:GetFlag(FLAG_EMOTE_DONE6)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent140_6");
			player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 2);
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
	local subseqLTW = data:GetCounter(CNTR_SEQ15_LTW);
	
    if (sequence == SEQ_000) then
		if (classId == BLOCKER) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml001");
			GetWorldManager():DoPlayerMoveInZone(player, 74.396, 4.034, -1207.892, -1.569, 0x11);
		end
    elseif (sequence == SEQ_015) then
		if (classId == CNJ_TRIG) then
		
			callClientFunction(player, "delegateEvent", player, quest, "processEvent130");
			if (subseqCNJ == 1) then
				data:IncCounter(CNTR_SEQ15_CNJ); -- CNJ +1
			end
			--quest:UpdateENPCs(); -- Added
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -353.05, 6.25, -1697.39, 0.774);  --Place NPCs in this
			--GetWorldManager():DoZoneChange(player, 206, nil, 0, 15, -334, 8, -1678, 0.791); -- Using Limsa Info
			--return;
			player:EndEvent();
		end
	elseif (sequence == SEQ_055) then
		if (classId == KIDS_TRIGGER) then -- KIDS_TRIGGER2
			callClientFunction(player, "delegateEvent", player, quest, "processEvent160");
			player:EndEvent();
			quest:StartSequence(SEQ_060);
			GetWorldManager():WarpToPublicArea(player, -209.817, 18, -1477.372, 1.4);
			return;
		end
	elseif (sequence == SEQ_060) then
		if (classId == ESCORT_START_TRIGGER) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent170");
				player:EndEvent();
				GetWorldManager():DoZoneChange(player, 150, nil, 0, 15, -644.407, 22.869, -1093.677, -2.416); -- into private zone for escort. Get a bit further for next cutscene
				-- DO ESCORT DUTY HERE
				-- startMan0g1Content(player, quest);
				-- For now just skip the sequence
				quest:StartSequence(SEQ_065);
				player:EndEvent();
				return;
			elseif (result == 2) then
				player:EndEvent();
			end
		end
	elseif (sequence == SEQ_065) then
		if (classId == ESCORT_END_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent180");
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -769.740, 22.945, -1086.493, -1.039);
			quest:StartSequence(SEQ_070);
			return;
		end
	elseif (sequence == SEQ_070) then	
		if (classId == STUMP_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent181");
			player:EndEvent();
			quest:StartSequence(SEQ_071);
		elseif (classId == ESCORT_START_TRIGGER) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent170");
				player:EndEvent();
				GetWorldManager():DoZoneChange(player, 150, nil, 0, 15, -644.407, 22.869, -1093.677, -2.416); -- into private zone for escort. Get a bit further for next cutscene
				-- DO ESCORT DUTY HERE
				-- startMan0g1Content(player, quest);
				-- For now just skip the sequence
				quest:StartSequence(SEQ_065);
				player:EndEvent();
				return;
			elseif (result == 2) then
				player:EndEvent();
			end
		end	
	elseif (sequence == SEQ_071) then
		if (classId == STUMP_EXIT_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent182");
			player:EndEvent();
			quest:StartSequence(SEQ_072);
			GetWorldManager():DoZoneChange(player, 206, nil, 0, 15, -192, 5.45, -1069.162, -3.136);
			return;
		elseif (classId == ESCORT_START_TRIGGER) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent170");
				player:EndEvent();
				GetWorldManager():DoZoneChange(player, 150, nil, 0, 15, -644.407, 22.869, -1093.677, -2.416); -- into private zone for escort. Get a bit further for next cutscene
				-- DO ESCORT DUTY HERE
				-- startMan0g1Content(player, quest);
				-- For now just skip the sequence
				quest:StartSequence(SEQ_065);
				player:EndEvent();
				return;
			elseif (result == 2) then
				player:EndEvent();
			end		
		end
	elseif (sequence == SEQ_072) then
		if (classId == BTN_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent185");
			player:EndEvent();
			player:AddItem(1000001, 3000);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 3000);
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_075);
		end
    end
	quest:UpdateENPCs();
end

function onEmote(player, quest, npc, eventName) -- Needs programming from etc3g0
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();	

	-- Play the emote
	if (classId == AUNILLIE) then		-- Beckon
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
		if (classId == AUNILLIE) then  -- Beckon
			if (not data:GetFlag(FLAG_EMOTE_DONE1)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_1");
				data:SetFlag(FLAG_EMOTE_DONE1);
			end
		elseif (classId == NICOLLAUX) then -- Clap
			if (not data:GetFlag(FLAG_EMOTE_DONE2)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_2");
				data:SetFlag(FLAG_EMOTE_DONE2);
			end
		elseif (classId == SANSA) then -- Bow
			if (not data:GetFlag(FLAG_EMOTE_DONE3)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_3");
				data:SetFlag(FLAG_EMOTE_DONE3);
			end
		elseif (classId == POWLE) then -- Cheer
			if (not data:GetFlag(FLAG_EMOTE_DONE4)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_4");
				data:SetFlag(FLAG_EMOTE_DONE4);
			end
		elseif (classId == RYD) then -- Surprised
			if (not data:GetFlag(FLAG_EMOTE_DONE5)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_5");
				data:SetFlag(FLAG_EMOTE_DONE5);
			end
		elseif (classId == ELYN) then -- Lookout
			if (not data:GetFlag(FLAG_EMOTE_DONE6)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent142_6");
				data:SetFlag(FLAG_EMOTE_DONE6);
			end
		end
	end
	
	-- Check result and finish
	if (bit32.band(data:GetFlags(), 0x7E) == 0x7E) then -- Needs programming
		callClientFunction(player, "delegateEvent", player, quest, "processEvent150"); -- For now just skip seq 50 into seq 55
		player:EndEvent();
		quest:StartSequence(SEQ_055); 
		GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -231.474, 12, -1500.86, 0.73); -- Different private area with kids whispering
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
	local data = quest:GetData();
    local possibleMarkers = {};
    local data = quest:GetData();
	local subseqCNJ = data:GetCounter(CNTR_SEQ15_CNJ);
	local subseqLTW = data:GetCounter(CNTR_SEQ15_LTW);

    if (sequence == SEQ_000) then
		table.insert(possibleMarkers, MRKR_S000_MIOUNNE);
    elseif (sequence == SEQ_005) then 
		table.insert(possibleMarkers, MRKR_BENTBRANCH);
	elseif (sequence == SEQ_010) then 
		table.insert(possibleMarkers, MRKR_S000_MIOUNNE);
	elseif (sequence == SEQ_012) then 
		table.insert(possibleMarkers, MRKR_S010_MIOUNNE);
	elseif (sequence == SEQ_015) then
		if (subseqLTW <= 1) then
			table.insert(possibleMarkers, MRKR_S015_HEREWARD);
		end
		if (subseqCNJ == 0) then
			table.insert(possibleMarkers, MRKR_S015_SOILEINE);
		elseif (subseqCNJ == 1 or subseqCNJ == 2) then
			if (player.CurrentArea.IsPublic()) then
				table.insert(possibleMarkers, MRKR_S015_CNJGUILD);
			else
				table.insert(possibleMarkers, MRKR_S015_SWETHYNA);
			end
		end
	elseif (sequence == SEQ_040) then 
        table.insert(possibleMarkers, MRKR_S040_OPYLTYL);
	elseif (sequence == SEQ_050) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_S050_KIDS);
		else
			table.insert(possibleMarkers, MRKR_S040_OPYLTYL);
		end
	elseif (sequence == SEQ_055) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_S050_KIDS);
		else
			table.insert(possibleMarkers, MRKR_S040_OPYLTYL);
		end
	elseif (sequence == SEQ_060) then
		table.insert(possibleMarkers, MRKR_S060_ESCORT_START);
	elseif (sequence == SEQ_065) then
		table.insert(possibleMarkers, MRKR_S065_ESCORT_END);
	elseif (sequence == SEQ_070) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_S070_STUMP_TRIGGER);
		else
			table.insert(possibleMarkers, MRKR_S060_ESCORT_START);
		end
	elseif (sequence == SEQ_071) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_S071_STUMP_EXIT_TRIGGER);
		else
			table.insert(possibleMarkers, MRKR_S060_ESCORT_START);
		end
	elseif (sequence == SEQ_072) then
		table.insert(possibleMarkers, MRKR_S072_BTN_TRIGGER);
	elseif (sequence == SEQ_075) then
	
	elseif (sequence == SEQ_080) then
		table.insert(possibleMarkers, MRKR_S080_WILLELDA);
	elseif (sequence == SEQ_085) then
		table.insert(possibleMarkers, MRKR_S085_BURCHARD);
	elseif (sequence == SEQ_090) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_S090_BURCHARD);
		else
			table.insert(possibleMarkers, MRKR_S080_WILLELDA);
		end
	elseif (sequence == SEQ_095) then
		table.insert(possibleMarkers, MRKR_S095_NUALA);
	elseif (sequence == SEQ_100) then
	
	elseif (sequence == SEQ_105) then
		table.insert(possibleMarkers, MRKR_S105_MIOUNNE);
    end

    return unpack(possibleMarkers)
end
