require ("global")
require ("quest")

--[[
player:SendMessage(0x1D,"",">");
Quest Script

Name: 	Together We Stand
Code: 	Man206
Id: 	110014
Prereq: Fade to White (Man200 - 110013)
--]]


--[[ProcessEvents
XX processEventUdowntownrectStart			Cutscene when you enter Minfilia's office.
XX processEvent000_2						Tataru's speech. "A party of frenzied sylphs has spirited past our sentries and trapped Lady Minfilia in the Hall of the First Step!"
XX processEvent000_3						Serandelion's speech. "A pack of strange green beasts just appeared out of nowhere! And now they're demanding audience with the Antecedent!"
XX processEvent000_4						Sahja Zhwan's speech. "Was that a sylph I saw fly by? Impossible... For what purpose would a sylph come all the way from Gridania?"
XX processEvent000_5						Nenekani's speech. "Sylphs in Ul'dah!? How did the devilish creatures ever get past the Brass Blades? Nenekani knows not!"
XX processEvent000_6						Godfrey's speech. "What folly is this, adventurer? Did you bring these heathens into our sanctuary?"
XX processEvent000_7						Frenana's speech. "I am seeing to the doors to ensure our “guests” cannot leave until we are certain of their intentions. "
XX processEvent000_8						Nonoru's speech. "Yes, it is true I am somewhat versed in the sylph's tongue, but I cannot leave my post."
XX processEvent000_9						Almxio's speech. "The woken ones must hearken! Terrible tidings this one brings!"
XX processEvent000_10						Zoxio's speech. "Audience! The woken ones must grant audience!"
XX processEvent000_11						Diluxio's speech. "There is little time! Little time!"
XX processEvent001							Quest Start Cutscene with Minfillia and the three Sylphs.
XX processEvent001_2						Minfillia's speech. "The sylphs crossed forest and desert to beg for our help. It would be wrong of us to turn a deaf ear to their pleas."
XX processEvent001_3						Serandelion's speech. "And just like that, the green beasts were gone...but at least they used the door this time."
XX processEvent001_4						Sahja Zhwan's speech. "Sylph sightings are not as uncommon as you may believe."
XX processEvent001_5						Godfrey's speech. "Imperials in the Black Shroud... This does not bode well for the realm. First Ala Mhigo, now Moonspore Grove."
XX processEvent001_6						Fenana's speech. "Dreadful little creatures. It is no wonder they are called “beasts."
XX processEvent001_7						Nonoru's speech. "One used to be able to find sylphs in all of Eorzea's city-states, and none would pay them any mind."
processEvent001_8						Soil-Scented Botanist's speech. "While it lies on the edge of the protective “Hedge” which surrounds and protects the Black Shroud, Moonspore Grove is situated closer to the imperial-occupied city-state of Ala Mhigo than it is to Gridania."
processEvent001_9						Long-Legged Lady's speech. "Many believe that the Garleans seek to exterminate the sylphs before the tribe can muster enough power to summon their primal..."
processEvent001_10						Troubled Trader's speech. "There has never been any indication that the sylphs intend to do anything so rash. "
processEvent001_11						Nonchalant Goldsmith's speech. "It is said this grove of the sylphs' lies deep within the Black Shroud, hidden from the eyes of man, and that only the most skillful trackers can locate it."
processEvent010_2						Tataru's speech. "Were you able to contact <SNPC>? Ah, so you have chosen to make your preparations separately before meeting in Gridania and continuing on to the Grove together?"
XX pE12									Cutscene with you arriving in Gridania with your path companion. Args: snpcName, snpcSkin, snpcPersonality, snpcCoordinate, initialTown,
processEvent012_2						Nonchalant Goldsmith's speech. (DUPLICATE?) "It is said this grove of the sylphs' lies deep within the Black Shroud, hidden from the eyes of man, and that only the most skillful trackers can locate it."
processEvent012_3						Stern-Faced SeaWolf's speech. "Ul'dah is still the only city-state that's closed its gates to the sylphs."
processEvent012_4						Burly-Voiced Brute's speech. "In a town teemin' with pirates, fishbacks, ratboys, and kobolds, I don't think anyone'd notice if a sylph walked right up the Procession o' Terns, took a seat in the Drownin' Wench, and ordered itself a mug o' salt ale."
processEvent012_5						Satzfloh's speech. "Sylphs and the Garleans, eh? Naught good'll come of that."
processEvent012_6						Percevains' speech. "There is some wisdom in ignoring the noble urge to confront those greater evils which loom over us."
processEvent012_7						Ulma Tayurn's speech. "I'll be lookin' t' tickle some information on th' Empire out of a couple o' their scouts, I will."
pE13									Cutscene with you and your companion meeting up with the Sylphs. Args: snpcName, snpcSkin, snpcPersonality, snpcCoordinate, initialTown,
processEvent016							HQ cutscene with Sylphs tricking the Garleans.
processEvent016_1						Zoxio's speech during the duty: "This one will hide woken ones!"
processEvent016_2						Possibly Almxio's speech during the duty: "This one will blind metal ones!"
processEvent016_3						Diluxio's speech during the duty: "This one will use magicks! Woken ones will save podlings!"
pE20									Cutscene ones you make it to Moongrove, picking up the podling.
processEvent020_2						Dokixia's speech. "Quick! Quick! Rescuing ones must take the podlings! Take the podlings to the one called Flaxio! But beware! The metal ones must not see! Be silent, be swift!"
pE30									Cutscene when you return to Flaxio with the podling.
processEvent030_2						Seranilien's speech. "Minfilia is indisposed. If you have something to report, speak with Lady Tataru."
processEvent030_3						Sahja Zwhan's speech. "Sneaking about the forest while iron-clad monsters stalk your every move?"
processEvent030_4						Godfrey's speech. "This ain't the first time the Empire has sought to invade the Moonspore Grove and uproot the sylphs."
processEvent030_5						Fenana's speech. "<Name>! Tell me, is it true more than half of the sylphs' children were lost?"
processEvent030_6						Nonoru's speech. "And thus will the sylphs' numbers slowly dwindle, till one day none remain."
processEvent030_7						??? "So you say it was the sylphs' magicks that allowed you to slip into the Grove unnoticed? Amazing..."
processEvent030_8						??? "The Garleans are intent on slaying every last sylph in the realm before the beast tribe can summon forth their eikon."
processEvent040							Tataru; quest end cutscene.
]]

--[[
MAP MARKERS
11001408, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001409, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001410, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001411, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001412, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001413, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001414, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001415, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001416, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001417, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001418, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001419, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible
11001420, 1, -431, 187, 1600179, -1,common/mapMarker.le.spk,m00013, 101, 121, 0, MapMarker, @5208/i11000101, Visible

]]--

--SEQUENCES			Description													JournalID								Journal Text
SEQ_000 = 0;
SEQ_005 = 5;		-- Meet with Minfilia at Waking Sands						[@SHEET(xtx/journalxtxWil,246,1)]			"A party of sylphs has snuck its way into the Waking Sands and is pleading for help, claiming that their home, Moonspore Grove, is being invaded by imperial soldiers from Garlemald. Lady Minfilia has asked that you head to the Black Shroud to investigate, just do not forget to contact your Path companion before you begin your journey."
SEQ_010 = 10;		-- Travel to Gridania and Meet Path Companion				[@SHEET(xtx/journalxtxWil,247,1)]			"You agree to meet your Path companion in Gridania before continuing on to Moonspore Grove. Travel to the Aetheryte Plaza in the forest city[@1F]state and wait for your colleague's arrival."
SEQ_015 = 15;		-- Instanced Fight with Elemental							[@SHEET(xtx/journalxtxWil,248,1)]			"Your Path companion has learned that the location of Moonspore Grove is somewhere to the northeast of Nine Ivies. Once you have made your preparations, travel to the area's camp and rendezvous with your partner so that you may search for the Grove together."	
SEQ_020 = 20;		-- Speak with A'naidjaa at CRP guild.						[@SHEET(xtx/journalxtxWil,204,1)]			"When you arrive in Camp Nine Ivies, you are greeted by several frenetic sylphs claiming that imperial soldiers have already found Moonspore Grove, and it is only a matter of time before they discover the sylph children, known as podlings, who remain hidden in the forest haven. Head north with your companion through the forest to Moonspore Grove while trying to avoid imperial sentinels wandering the area."
SEQ_025 = 25;		-- Contact Miounne on the Linkpearl							[@SHEET(xtx/journalxtxWil,205,1)]			"You have been entrusted with a podling, and now must spirit it out of the Grove back to Camp Nine Ivies, taking extra care to see that it remains undamaged. Avoid all contact with imperial soldiers if possible, running in the event you are sighted."
SEQ_030 = 30;		-- Cutscene at CNJ Guild with Yda and Papalymo				[@SHEET(xtx/journalxtxWil,206,1)]			"You succeed in delivering the podling cradle to the sylphs waiting in Camp Nine Ivies. According to the survivors, not all the podlings were saved from the Empire; this, however, shall not deter the sylphs from remaining in the one place they call home.[@CR] [@CR]　As it seems reinforcements have arrived, you may now return to the Waking Sands and report to Lady Minfilia your findings."		

-- Actor Class IDs:
TATARU					= 1001046;
MINFILIA				= 1000843;
MOMODI					= 1000841;
MARKET_ENTRANCE			= 1090265;
EVENT_DOOR_EXIT			= 1090160;
EVENT_DOOR_OFFICE_W		= 1090161;
EVENT_DOOR_OFFICE_E		= 1090162;
SAHJA_ZHWAN				= 1001373;
NENEKANI				= 1001374;
GODFREY					= 1001375;
FENANA					= 1001376;
NONORU					= 1001377;
SERANELIEN				= 1001378;
SATZFLOH				= 1001228;
PERCEVAINS				= 1001229;
UNA_TAYUUN				= 1001230;
ROUGH_SPOKEN_FELLOW		= 1001274;
RED_SHOED_RASCAL		= 1001275;
ABSTRACTED_GLADIATOR	= 1001276;
CHAPEAUED_CHAP			= 1001277;
BARRATROUS_BUCCANEER	= 1001278;
SOFTHEARTED_SEPTUAGEN	= 1001279;
INDIGO_EYED_ARCHER		= 1001280;
LOAM_SCENETED_LADY		= 1001281;
UNCOMFORTABLE_BRUTE		= 1001282;
ALMXIO					= 1001085;
ZOXIO					= 1001086;
DILUXIO					= 1001178;
GRIDANIA_SNPC_TRIGGER	= 1090177;

--MARKERS
MRKR_11001408			= 11001408;
MRKR_11001409			= 11001409; 
MRKR_11001410			= 11001410; 
MRKR_11001411			= 11001411; 
MRKR_11001412			= 11001412; 
MRKR_11001413			= 11001413;
MRKR_11001414			= 11001414; 
MRKR_11001415			= 11001415; 
MRKR_11001416			= 11001416; 
MRKR_11001417			= 11001417; 
MRKR_11001418			= 11001418;
MRKR_11001419			= 11001419;
MRKR_11001420			= 11001420;

--Quest Flags

--Linkshell Message Packs
NPCLS_MSGS = {
	{1},			 -- SEQ_000 Pray Return to The Waking Sands
	{330, 339},		 -- SEQ_005 SNPC Message (Personality 1)
	{331, 340},		 -- SEQ_005 SNPC Message (Personality 2)
	{332, 341},		 -- SEQ_005 SNPC Message (Personality 3)
	{333, 342},		 -- SEQ_005 SNPC Message (Personality 4)
	{334, 343},		 -- SEQ_005 SNPC Message (Personality 5)
	{335, 344},		 -- SEQ_005 SNPC Message (Personality 6)
	{336, 345},		 -- SEQ_005 SNPC Message (Personality 7)
	{337, 346},		 -- SEQ_005 SNPC Message (Personality 8)
	{338, 347}		 -- SEQ_005 SNPC Message (Personality 8)
};  

function onStart(player, quest)
	quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();

	if (sequence == SEQ_000) then
		quest:NewNpcLsMsg(6);
		quest:SetENpc(TATARU);
		quest:SetENpc(EVENT_DOOR_OFFICE_E, QFLAG_NONE, false, true);
		quest:SetENpc(EVENT_DOOR_OFFICE_W, QFLAG_PUSH, false, true);
		quest:SetENpc(ALMXIO);
		quest:SetENpc(ZOXIO);
		quest:SetENpc(DILUXIO);
		quest:SetENpc(MINFILIA, QFLAG_TALK);
	elseif (sequence == SEQ_005) then
		quest:NewNpcLsMsg(6);
		quest:SetENpc(TATARU);
		quest:SetENpc(MINFILIA);
		quest:SetENpc(EVENT_DOOR_OFFICE_E, QFLAG_NONE, false, true);
		quest:SetENpc(EVENT_DOOR_OFFICE_W, QFLAG_NONE, false, true);
		quest:SetENpc(SERANELIEN);
	elseif (sequence == SEQ_010) then
		quest:SetENpc(EVENT_DOOR_OFFICE_E, QFLAG_NONE, false, true);
		quest:SetENpc(EVENT_DOOR_OFFICE_W, QFLAG_NONE, false, true);
		quest:SetENpc(TATARU);
		quest:SetENpc(MINFILIA);
		quest:SetENpc(GRIDANIA_SNPC_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_015) then
	elseif (sequence == SEQ_020) then
	elseif (sequence == SEQ_025) then
	elseif (sequence == SEQ_030) then
	end

	-- All the other ENpcs in the Waking Sands
	quest:SetENpc(MARKET_ENTRANCE, QFLAG_NONE, false, true);
	quest:SetENpc(EVENT_DOOR_EXIT, QFLAG_NONE, false, true);
	quest:SetENpc(SATZFLOH);
	quest:SetENpc(PERCEVAINS);
	quest:SetENpc(UNA_TAYUUN);
	quest:SetENpc(ROUGH_SPOKEN_FELLOW);
	quest:SetENpc(RED_SHOED_RASCAL);
	quest:SetENpc(ABSTRACTED_GLADIATOR);
	quest:SetENpc(CHAPEAUED_CHAP);
	quest:SetENpc(BARRATROUS_BUCCANEER);
	quest:SetENpc(SOFTHEARTED_SEPTUAGEN);
	quest:SetENpc(INDIGO_EYED_ARCHER);
	quest:SetENpc(LOAM_SCENETED_LADY);
	quest:SetENpc(UNCOMFORTABLE_BRUTE);
	quest:SetENpc(SAHJA_ZHWAN);
	quest:SetENpc(NENEKANI);
	quest:SetENpc(GODFREY);
	quest:SetENpc(FENANA);
	quest:SetENpc(NONORU);
	quest:SetENpc(SERANELIEN);
	quest:SetENpc(TATARU);
	
end


function onTalk(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	local data = quest:GetData();

	if (sequence == SEQ_000) then
		if (classId == TATARU) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");	
		elseif (classId == SERANELIEN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_3");
		elseif (classId == SAHJA_ZHWAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_4");
		elseif (classId == NENEKANI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_5");
		elseif (classId == GODFREY) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
		elseif (classId == FENANA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_7");
		elseif (classId == NONORU) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_8");
		elseif (classId == ALMXIO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_9");
		elseif (classId == ZOXIO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_10");
		elseif (classId == DILUXIO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_11");
		elseif (classId == MINFILIA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001");
			quest:StartSequence(SEQ_005);
			GetWorldManager():DoZoneChange(player, 181, nil, 0, 15, -142.75, 1, -160, -1.6);
--			quest:NewNpcLsMsg(6);
			player:ChangeMusic(39)		
		end
	elseif (sequence == SEQ_005) then
		if (classId == MINFILIA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_2", player:GetSNpcNickname());
		elseif (classId == SERANELIEN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_3");
		elseif (classId == SAHJA_ZHWAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_4");
		elseif (classId == GODFREY) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_5");
		elseif (classId == FENANA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_6");
		elseif (classId == NONORU) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_7");
		end
		quest:UpdateENPCs();
	elseif (sequence == SEQ_010) then
		if (classId == TATARU) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2", player:GetSNpcNickname());
		elseif (classId == MINFILIA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_2", player:GetSNpcNickname());
		elseif (classId == SERANELIEN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_3");
		elseif (classId == SAHJA_ZHWAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_4");
		elseif (classId == GODFREY) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_5");
		elseif (classId == FENANA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_6");
		elseif (classId == NONORU) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent001_7");
		end
	elseif (sequence == SEQ_015) then
	elseif (sequence == SEQ_020) then		
	elseif (sequence == SEQ_025) then
	elseif (sequence == SEQ_030) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_01", 1);
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:EndEvent();
			player:CompleteQuest(quest);
			player:AddItem(1000001, 60000);
--			player:AddItem(2001005, 1);
--			player:SendGameMessage(GetWorldMaster(), 25117, 0x20, 2001005);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 30000);
			player:AddExp(50000, player.GetCurrentClassOrJob(), 0);
		end
	end
	
	if (sequence > SEQ_000) then
		wakingsands_default_dialogue(player, quest, npc);
	end

	player:EndEvent();
end

function wakingsands_default_dialogue(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	local quest = player:GetQuest("Man200");
	require ("quests/man/man200");
	
	if (sequence > SEQ_010) then
		if (classId == SERANELIEN) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_3");
		elseif (classId == SAHJA_ZHWAN) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_4");
		elseif (classId == GODFREY) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_6");
		elseif (classId == FENANA) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_7");
		elseif (classId == NONORU) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_8");
		end
	else
		if (classId == LOAM_SCENETED_LADY) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_8");
		elseif (classId == SOFTHEARTED_SEPTUAGEN) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_9");
		elseif (classId == INDIGO_EYED_ARCHER) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_10");
		elseif (classId == BARRATROUS_BUCCANEER) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_11");
		elseif (classId == UNCOMFORTABLE_BRUTE) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_12");
		elseif (classId == RED_SHOED_RASCAL) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_13");
		elseif (classId == ABSTRACTED_GLADIATOR) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_14");	
		elseif (classId == NENEKANI) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_5");
		elseif (classId == CHAPEAUED_CHAP) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_9");
		elseif (classId == ROUGH_SPOKEN_FELLOW) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_10");
		elseif (classId == SATZFLOH) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_18");
		elseif (classId == PERCEVAINS) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_19");
		elseif (classId == UNA_TAYUUN) then
			callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_20");
		end
	end
end

function onPush(player, quest, npc)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();

	if (classId == MARKET_ENTRANCE) then
		player:EndEvent();
		GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 11, 15, -205.25, 0, -160, 1.55);
			if (sequence == SEQ_000) then
				player:ChangeMusic(58);
			end
	elseif (classId == EVENT_DOOR_EXIT) then
		player:EndEvent();
		GetWorldManager():DoZoneChange(player, 175, nil, 0, 15, -216.52, 190, 30.5, 2.32);
	elseif (classId == EVENT_DOOR_OFFICE_W) then
		if (sequence == SEQ_000) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventUdowntownrectStart");
			GetWorldManager():WarpToPosition(player, -126.2, 1.2, -160, 1.6);
		else
			player:EndEvent();
			GetWorldManager():WarpToPosition(player, -126.2, 1.2, -160, 1.6);
		end
	elseif (classId == EVENT_DOOR_OFFICE_E) then
		player:EndEvent();
		GetWorldManager():WarpToPosition(player, -142.75, 1, -160, -1.6);
		return;
	
	if (sequence == SEQ_010) then
		if (classId == GRIDANIA_SNPC_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "pE12", player:GetSNpcNickname(), player:GetSNpcSkin(), player:GetSNpcPersonality(), player:GetSNpcCoordinate(), player:GetInitialTown());
			quest:StartSequence(SEQ_015);
		end
	end
	
	player:EndEvent();
	if (sequence != SEQ_000) then
		quest:UpdateENPCs();
	end
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 6) then
		if (sequence == SEQ_000) then
			msgPack = 1;
		elseif (sequence == SEQ_005) then
			if (player:GetSNpcPersonality() == 1) then
				msgPack = 2;
			elseif (player:GetSNpcPersonality() == 2) then
				msgPack = 3;
			elseif (player:GetSNpcPersonality() == 3) then
				msgPack = 4;
			elseif (player:GetSNpcPersonality() == 4) then
				msgPack = 5;
			elseif (player:GetSNpcPersonality() == 5) then
				msgPack = 6;
			elseif (player:GetSNpcPersonality() == 6) then
				msgPack = 7;
			elseif (player:GetSNpcPersonality() == 7) then
				msgPack = 8;
			elseif (player:GetSNpcPersonality() == 8) then
				msgPack = 9;
			elseif (player:GetSNpcPersonality() == 9) then
				msgPack = 10;
			end
		end
	end

	-- Quick way to handle all msgs nicely.
	if (sequence == SEQ_000) then
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1100449);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:RepeatNpcLsMsg();
		end		
	elseif (sequence == SEQ_005) then
		player:SendGameMessageCustomDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, player:GetSNpcNickname());
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
	end

		-- Handle Sequence Changes from Answering LS
	if (sequence == SEQ_005 and msgStep >= #NPCLS_MSGS[msgPack]) then
--		player:SendMessage(0x1D,"",">seq 05 to 10");
		quest:StartSequenceForNpcLs(SEQ_010);
	end
end


function getJournalInformation(player, quest)
 		return 1, 0, 0, 0, 0, player:GetSNpcNickname();
end


function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	local data = quest:GetData();
	local possibleMarkers = {};

	if (sequence == SEQ_000) then 
		table.insert(possibleMarkers, MRKR_NONOLATO);
	elseif (sequence == SEQ_003) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_SEQ003OAPPPESI);
		else
			table.insert(possibleMarkers, MRKR_NONOLATO);
		end
	elseif (sequence == SEQ_004) then
		if (player.CurrentArea.IsPublic()) then
			table.insert(possibleMarkers, MRKR_NONOLATO);
		end
	elseif (sequence == SEQ_005) then
		table.insert(possibleMarkers, MRKR_ANAIDJAA);
	elseif (sequence == SEQ_015) then
		table.insert(possibleMarkers, MRKR_SOILEINE);
	elseif (sequence == SEQ_020) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_PSHCNJGUILD);
		else
			table.insert(possibleMarkers, MRKR_SOILEINE);
		end
	elseif (sequence == SEQ_025) then	
		if (player.CurrentArea.IsPrivate()) then
			if (not data:GetFlag(FLAG_SEQ025_FYE)) then
				table.insert(possibleMarkers, MRKR_FYE);
			elseif (data:GetFlag(FLAG_SEQ025_FYE)) then
				table.insert(possibleMarkers, MRKR_CNJOAPPPESI);
			end
		else
			table.insert(possibleMarkers, MRKR_SOILEINE);
		end
	elseif (sequence == SEQ_035) then
		table.insert(possibleMarkers, MRKR_AMPHITHEATRE);
	elseif (sequence == SEQ_040) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_FYE2);
		else
			table.insert(possibleMarkers, MRKR_AMPHITHEATRE);
		end
	elseif (sequence == SEQ_045) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_PSHCUTSCENE);
		else
			table.insert(possibleMarkers, MRKR_AMPHITHEATRE);
		end
	end

	return unpack(possibleMarkers)
end