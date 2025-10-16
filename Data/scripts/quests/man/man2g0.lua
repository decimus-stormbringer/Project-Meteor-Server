require ("global")
require ("quest")

--[[
player:SendMessage(0x1D,"",">");
Quest Script

Name: 	Beckon of the Elementals
Code: 	Man2g0
Id: 	110008
Prereq: Whispers in the Wood (Man1g0 - 110007)
--]]


--[[ProcessEvents
processEventMiounneStart			Miounne: "You certainly seem to be coming into your own around here. Though you may not be aware of it, you're quite the talk of the town. But there will be time enough for praises later."
processEvent005_2					Miounne: "After countless rangings, Dunstan remains unfound. Despite their best efforts, none among the archers, lancers, or conjurers have the faintest idea where he is."
processEvent007						<Cutscene in Archer's Guild with Lewin and O-App-Pesi>
processEvent007_2					O-App-Pesi: "I feel a great disturbance in the forest...as if millions of voices suddenly cried out in terror. The elementals... We must leave at once! Set forth into the wood?" <yes>
processEvent007_2_2					O-App-Pesi: "I feel a great disturbance in the forest...as if millions of voices suddenly cried out in terror. The elementals... We must leave at once! Set forth into the wood?" <no>
processEvent007_3					Miounne: "You mean to go with them? Have you taken leave of your senses!?"
processEvent010						<cutscene>
processEvent010_2					"Mioune: How did you find things at Quiver's Hold? A ranging!? By the Twelve, you have a deal more courage than I imagined!"
processEvent020						<cutscene>
processEvent020_2					Miounne: "[@SPLIT([@STRING($EB(1))], ,1)], There is word of a commotion over at Stillglade Fane. Haven't been to see for myself, but I've heard talk of [@1A(1)]wildlings[@1A(0)]."
processEvent020_3					Zezekuta: "You wish to know more of Khrimm'm past? For that you must speak to the conjurers. I warn you, though─the good brothers and sisters of Stillglade Fane may not be eager to speak of such things as wildlings."
processEvent030						Soileine: "Welcome, [@SPLIT([@STRING($EB(1))], ,1)]. Please, feel free to join the others within. Brother O-App has been expecting you." <cutscene> <warp to instanced area>
processEvent030_2					Soileine: "A wildling within the city... I fear we have all been placed in great danger. Brother E[@1F]Sumi will know what to do. He always does."
processEvent030_3					Disquieted Lancer: "Dunstan was next in line to command the Wood Wailers until he was...taken from us."
processEvent030_4					Disconcerted Conjurer: "My head... It pounds. And my ears scream with ringing. The voices... The elementals are in great distress."
processEvent030_5					Wise-looking Conjurer: "I don't know what to make of all this. I've never seen the greenwrath so fierce."
processEvent030_6					Enigmatic Conjurer: "Truly, my heart goes out to the poor lad, but is it wise to bring one so tainted to the Fane?"
processEvent030_7					Silky-haired Conjurer: "What does Brother E[@1F]Sumi mean to do? If there were some way to assist him, we would, but...the truth is, the rest of us don't have the first idea how."
processEvent030_8					Enthusiastic Archer: "This Papalymo and this Yda... Where in the bloody hells have they come from? They wield powers unlike any we've ever seen."
processEvent030_9					Embittered Archer: "My gut tells me Bowlord Lewin may be hiding something from the Quiver. But that would mean Brother E[@1F]Sumi is, as well. Could it be?"
processEvent040						<cutscene>
processEvent040_2					Silky-haired Conjurer: "Calm down, child! You can't see him now. It's too dangerous."
processEvent040_3					Disconcerted Conjurer: "You cannot pass, Fye. Trust us, it is for your own good."
processEvent040_4					O-App-Pesi: "The grand rite is one of conjury's most sacred and powerful acts. It requires all of our order to come together as one."
processEvent040_5					O-App-Pesi: "I must do all that I am able to aid Brother E[@1F]Sumi. We cannot fail!"
processEvent040_6					O-App-Pesi: "Brother E[@1F]Sumi plans to hold counsel with the Seedseers. For now, we must send word to the conjurers still within the wood to return."
processEvent045						Fye: "Let me in! I have to see him! I have to see Khrimm!" "You'll help me, won't you, [@SPLIT([@STRING($EB(1))], ,1)]? Find Brother E-Sumi, or Brother O-App. Tell them I'm here!" "I have to see Khrimm. I have to talk to him. To tell him I...I'm sorry."
processEvent045_2					Fye: "Let me in! I have to see him! I have to see Khrimm!" "You'll help me, won't you, [@SPLIT([@STRING($EB(1))], ,1)]? Find Brother E-Sumi, or Brother O-App. Tell them I'm here!" "I have to see Khrimm. I have to talk to him. To tell him I...I'm sorry."
processEvent050						<cutscene>
processEvent050_2					Miounne: "The grand rite is about to begin. I daresay you must be looking forward to getting all that woodsin off your back. "Not that there are any guarantees when it comes to cleansing the stuff. Oh, but I'm sure you'll be alright. Now stop wasting time and run along to Mih Khetto's Amphitheatre!"
processEvent060						<cutscene>
processEvent060_2					Niall: "This grand rite shall be the most important in recent memory. We can afford no mistakes─all the woodsin must be purged. And if the children and the rest enjoy themselves in the process, so much the better."
processEvent060_3					Yda: "What strange and ridiculous dancing! We have nothing like it back in Sharlayan─thank the gods for that!"
processEvent060_4					Papalymo: "They put on joyous airs, to be sure, but there is a sick desperation in their dancing. They fear this greenwrath─that much is obvious."
processEvent060_5					Fufucha: "We like to think that even the elementals are soothed by the laughter of innocent children. But I fear that Khrimm's treachery in the wood may have placed the rest of our younglings at the greatest risk. I pray the conjurers are able to keep them safe."
processEvent060_6					Burchard: "You are no forestborn. What right have you to take part in this...er...rite? Brother O-App, you say? Hmph, I will look into this, I assure you. Twelve save you if you have told me false."
processEvent060_7					Ursbaen: "If Dunstan flees, Khrimm's life would be forfeit. No, he will not run. Not Dunstan. He was─ He [@1A(1)]is[@1A(0)] a man of honor."
processEvent060_8					N'golbb: "Once all are onstage and the rites begin, the forest takes on a very solemn air. And when all is done, that is replaced by an air of peace."
processEvent060_9					Farrimond: "So you are to be cleansed too, are you? Don't remember seeing you around before. An adventurer, I take it? Try not to make a mess of things."
processEvent060_10					T'kebbe: "Afraid you're going to stick out like an Ul'dahn whore in an Ishgardian church? Hah! Don't worry, it will be over before you know it."
processEvent060_11					Handeloup: "Not even the elementals can turn a deaf ear to the festival. They enjoy the music as much as any."
processEvent060_12					Grinnaux: "Who can say what will come of all this? The greenwrath is so thick about the city, even [@1A(1)]I[@1A(0)] can feel it─and I'm not even a bloody conjurer!"
processEvent060_13					Squealing Sprat: "Be quiet! I'm looking for moogles!"
processEvent060_14					Underprivilaged Orphan: "I bet the moogles would come if we had some [@SWITCH([@SHEET(itemData,11000129,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000129,2,1)][@EDGECOLOR($EC)][@COLOR($EC)]. Moogles [@1A(1)]love[@1A(0)] [@SWITCH([@SHEET(itemData,11000129,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000129,2,1)][@EDGECOLOR($EC)][@COLOR($EC)]!"
processEvent060_15					Sugar-strung Schoolgirl: "Dance! Dance! Dance!"
processEvent060_16					Deserted Daughter: "Mother? Mother? Mother!? Moootheeer!? I've lost my mother..."
processEvent060_17					Troublesome Tomboy: "I'm gonna dance as well as I possibly can. then the elementals will [@1A(1)]have[@1A(0)] to save Khrimm!"
processEvent060_18					Aging Elezen: "The rite will start once the conjurers gather. Since it is to be a grand rite, Brother E[@1F]Sumi and many others have returned from the wood to take part."
processEvent060_19					Wispily Whiskered Woodworker: "This festival has an interesting history. Originally, it had nothing to do with appeasing the elementals. It was simply a harvest festival─as unremarkable as that might sound."
processEvent060_20					Respectable Roegadyn: "I've thanks to give for the year's bounty, and prayers to give for next─if it isn't too late..."
processEvent060_21					Urbane Elezen: "The woodsin may fall from you, but take care [@1A(1)]you[@1A(0)] don't fall from the stage. Hahaha!"
processEvent060_22					Merry Old Matron: "Ohhh, I can't wait for things to get underway. Me own grandson's goin' to be up there dancin' his little heart out, the adorable lit'l bastard."
processEvent060_23					Well-groomed Woman: "They are saying that Khrimm has drawn the greenwrath. But could it truly be? I've not seen him out and about of late..."
processEvent060_24					Good-natured Goodwife: "The lad whose parents went wildling? Hmmm...can't help wondering if a bit of their woodsin didn't get passed on to the boy. I've heard stranger tales told."
processEvent060_25					Overanimated Hyur: "From the look of things, this rite is going to be quite large. I'm beginning to wonder if those rumors I heard about a wildling attending might be true after all..."
processEvent060_26					Fastidious Fellow: "When the elementals rage, there is naught we can do but pray for their forgiveness."
processEvent070						<cutscene>
processEvent070_2					Yda: "Hello to you, forest..."
processEvent070_3					Papalymo: "How in the bloody hells did we get [@1A(1)]here[@1A(0)]!?"
processEvent080						<multiple cutscenes>
processEvent080_01					"Travel to Ul'dah's Merchants Ward by way of the market area. There the hermit of the wood awaits you. After reaching level 18 with any class, travel to Ul'dah's Merchants Ward by way of the market area. There the hermit of the wood awaits you."
processEvent1000_1					Miounne: "What news from the west Hedge? Is aught amiss? What has come of Brother O[@1F]App? What in the bloody hells is going on!?"
processEvent1000_2					"You are searching for Brother O[@1F]App? Have you come to ask after Khrimm?"
processEventTrial001				O-App-Pesi: "I have need of you. Take this ward and cast its magic over all here. It will protect against the element to which it has been attuned." "The ward is ready! Bless all with its magic!" "Which element do you wish to ward against?" <Wind / Earth / Water>
processEventTrial002				O-App-Pesi: "I am attuning the ward! A moment, pray!"
]]

--[[
MAP MARKERS
11000801,,1,232.880005,-1268.939941,1400007,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000801,Visible
11000802,,1,228.5,-1246.819946,2000010,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000802,Visible
11000803,,1,11.86,-1265.189941,1900034,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000803,Visible
11000804,,1,-330.829987,-1682.790039,1300064,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000804,Visible
11000805,,1,-342.600006,-1686.51001,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000805,Visible
11000806,,1,-285,-1660.630005,1100019,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000806,Visible
11000807,,1,-352.209991,-1696.619995,2000010,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000807,Visible
11000808,,1,-70.849998,-1577.219971,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000808,Visible
11000809,,1,-93.790001,-1615.829956,1100019,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000809,Visible
11000810,,1,-1998.22998,-923.01001,4000257,-1,common/mapMarker.le.spk,m00013,103,301,0,MapMarkerQuest,@5208/i11000810,Visible

]]--

--SEQUENCES			Description													JournalID								Journal Text
SEQ_000 = 0;		-- Speak with Nonolato at ARC Guild							[@SHEET(xtx/journalxtxFst,47]			"According to Miounne at the Adventurers' Guild, Dunstan has yet to be found despite the guilds' best efforts. She suggests that you offer to take part in a ranging to contribute to the effort. Proceed to the Quiver's Hold and speak to Nonolato."
SEQ_003 = 3;		-- Cutscene at ARC guild. Escort O-App						[@SHEET(xtx/journalxtxFst,48]			"During your visit, the Quiver's Hold is thrown into chaos as news arrives of some happening in the forest. Archers surge forth from the Hold, and Brother O-App-Pesi of the conjurers himself heads in the direction of the disturbance, as well. Whatever trouble has taken place, the situation is no doubt a perilous one. Speak with Nonolato, make whatever preparations you must, and escort Brother O-App-Pesi to the scene."
SEQ_004 = 4;		-- Instanced Fight with Elemental							[@SHEET(xtx/journalxtxFst,49]			"You find the young boy Khrimm standing before a tree afire... Before long the arbor elemental within comes forth in a fury, and Brother E[@1F]Sumi[@1F]Yan is unable to quell its greenwrath. You are left with no recourse but to battle the elemental. Make use of Brother O[@1F]App[@1F]Pesi's powers over the elements, and fight alongside the members of the Gods' Quiver and Wood Wailers."
SEQ_005 = 5;		-- Speak with A'naidjaa at CRP guild.						[@SHEET(xtx/journalxtxFst,50]			"You defeated the enraged elemental, yet the fury of the forest will not be quelled so easily. Brother O-App-Pesi suggests that it may be in the best interest of all to have Fye and her brother Dunstan leave the forest altogether. He has asked that you seek her out. Travel back to the Oak Atrium to find her."
SEQ_010 = 10;		-- Contact Miounne on the Linkpearl							[@SHEET(xtx/journalxtxFst,51]			"Fye comes to the Oak Atrium to see Zezekuta after hearing that Khrimm has angered the elementals. Thinking Khrimm to have been in the forest searching for her brother in her place, she cannot help but feel responsible. Contact Miounne via linkpearl and see if you can learn anything more of Khrimm."
SEQ_015 = 15;		-- Cutscene at CNJ Guild with Yda and Papalymo				[@SHEET(xtx/journalxtxFst,182]			"Miounne has informed you that there is word of a commotion at Stillglade Fane. Fearing that Khrimm may become a wildling, it is likely that the conjurers have taken him in to tend to his woodsin. Make your way there and see what is happening."
SEQ_020 = 20;		-- Instanced area at CNJ Guild with E-Sumi-Yan				[@SHEET(xtx/journalxtxFst,52]			"As you are asking Brother O-App-Pesi about Khrimm's condition, Papalymo and Yda return from the wood together with the wildling Dunstan, throwing Stillglade Fane into a maelstrom of confusion and terror. Go and have a closer look at this dreaded wildling."
SEQ_025 = 25;		-- Instanced area at CNJ Guild with Fye						[@SHEET(xtx/journalxtxFst,53]			"Brother E[@1F]Sumi[@1F]Yan has ordered a grand rite of purification, but fears that saving young Khrimm may require Dunstan to give his life. There are many preparations to be made for the festival. Leave Stillglade Fane so as not to get in the way. Speak to Soileine should you lose your way outside the guild."
SEQ_030 = 30;		-- Contact Miounne on Linkpearl								[@SHEET(xtx/journalxtxFst,54]			"At the entrance to Stillglade Fane you find Fye, who has come after hearing about the commotion. She wants nothing more than to see Khrimm, but the conjurers will not permit her entry. She has asked you to seek out one of the Brothers to allow her within."
SEQ_035 = 35;		-- Travel to Mih Khetto Amphitheatre						[@SHEET(xtx/journalxtxFst,55]			"You have asked Brother O-App-Pesi's permission for Fye to see Khrimm, but he has refused out of fear of Khrimm's woodsin. He instead introduces you to Dunstan, and requests that you tell Fye that her brother has returned to Gridania. Perhaps the two of them will be able to meet at the grand rite of purification. Head to Mih Khetto's Amphitheatre to make ready for the festival."
SEQ_040 = 40;		-- Instanced area in Mih Khetto Amphitheatre				[@SHEET(xtx/journalxtxFst,56]			"The grand rite is underway, and before long a group of moogles arrives, much to the delight of the children. They come bearing a message for you from the elementals. It seems that your role in being beckoned to the wood is to be a messenger of the Matron herself, the goddess Nophica. But what could that mean...? For now, seek out Fye and tell her that her brother is attending the festival."
SEQ_045 = 45;		-- Cutscene at Amphitheatre. Warp to instanced area			[@SHEET(xtx/journalxtxFst,57]			"You have told Fye of her brother's presence at the festival. The purification dances are almost underway, and the wildlings Khrimm and Dunstan have taken to the stage. However, when Brother E[@1F]Sumi[@1F]Yan begins to chant the ritual verses, Dunstan collapses. As you move to help him, the Echo reverberates and you suddenly find yourself in the middle of the forest..."
SEQ_050 = 50;		-- Echo cutscene											[@SHEET(xtx/journalxtxFst,58]			"Together with Papalymo and Yda, whom the Echo has brought with you, you walk until coming upon a familiar place. Before a large tree stands Khrimm, speaking to his parents and Dunstan─the same people believed to have been turned into wildlings by the greenwrath. Angered by the conversation, Khrimm sets fire to the nearby tree..."
SEQ_055 = 55;		-- Cutscene back at Amphitheatre							[@SHEET(xtx/journalxtxFst,59]			"Finding yourself back at the festival in Gridania, you see Khrimm awakening following the success of the purification rite. But just then, dark clouds roll across the skies, and in their midst a great rift opens from which fiery meteors begin to fall in all directions. Amid the awe and terror of the people, Papalymo remarks that the winds of change have swept over Eorzea. Suddenly, you feel light-headed..."
SEQ_060 = 60;		-- Turn in quest with Miounne								[@SHEET(xtx/journalxtxFst,60]			"The calling of your name wakens you as if from a dream. Opening your eyes, you find yourself in the Roost in Gridania. Miounne of the Adventurers' Guild tells you that upon collapsing at the festival, you were brought to the inn by the mysterious hermit of the wood you saw earlier. He has asked that you come pay him a visit at the Waking Sands in the Merchants Ward of Ul'dah when you are able. It seems the time has come for you to journey forth from Gridania."

-- Actor Class IDs:
MIOUNNE						= 1000230;
OAPPPESI					= 1000033;
OAPPPESI_SEQ004				= 1000235;
NONOLATO					= 1000463;
ANAIDJAA					= 1000465;
YDA							= 1000009;
PAPALYMO					= 1000010;
ZEZEKUTA					= 1000240;
SOILEINE					= 1000234;
SOILEINE_INSTANCE			= 1700030;
DISQUIETEDLANCER			= 1000744;
DISCONCERTEDCONJURER		= 1000747;
ENTHUSIASTICARCHER			= 1000745;
EMBITTEREDARCHER			= 1000746;
SILKYHAIREDCONJURER			= 1000748;
WISELOOKINGNONJURER			= 1000743;
ENIGMATICCONJURER			= 1000749;
HERMENOST					= 1000751;
DUNSTAN						= 1000013;
DALMAS						= 1000750;
NHABAMAIMHOV				= 1000752;
ESUMIYAN					= 1000011;
FYE							= 1000014;
NIALL						= 1000754;
FUFUCHA						= 1000237;
BURCHARD					= 1000243;
URSBAEN						= 1001873;
NGOLBB						= 1000016;
FARRIMOND					= 1000017;
TKEBBE						= 1000876;
HANDELOUP					= 1000023;
GRINNAUX					= 1000024;
SQUEALINGSPRAT				= 1000826;
UNDERPRIVILEGEDORPHAN		= 1000825;
SUGARSTRUNGSCHOOLGIRL		= 1000824;
DESERTEDDAUGHTER			= 1000827;
TROUBLESOMETOMBOY			= 1000828;
AGINGELEZEN					= 1000756;
WISPILYWOODWORKER			= 1000562;
RESPECTABLEROEGADYN			= 1000755;
URBANEELEZEN				= 1000757;
MERRYOLDMATRON				= 1001488;
WELLGROOMEDWOMAN			= 1001489;
GOODNATUREDGOODWIFE			= 1001486;
OVERANIMATEDHYUR			= 1001485;
FASTIDIOUSFELLOW			= 1001487;
PSHCJGUILD					= 1090178;
PSHAMPHITHEATRE				= 1090179;
PSHSEQ045					= 1090180;
ELDID						= 1001469;
CECILY						= 1000326;
VKOROLON					= 1000458;

--MARKERS
MRKR_NONOLATO			= 11000801; -- SEQ_000
MRKR_SEQ003OAPPPESI		= 11000802; -- SEQ_003
MRKR_ANAIDJAA			= 11000803; -- SEQ_005
MRKR_SOILEINE			= 11000804; -- SEQ_015
MRKR_PSHCNJGUILD		= 11000805; 
MRKR_FYE				= 11000806;
MRKR_CNJOAPPPESI		= 11000807; 
MRKR_AMPHITHEATRE		= 11000808; -- SEQ_035
MRKR_FYE2				= 11000809; -- SEQ_040
MRKR_PSHCUTSCENE		= 11000810; -- SEQ_050

--Quest Flags
FLAG_SEQ025_FYE		= 0;

--Linkshell Message Packs
NPCLS_MSGS = {
	{65, 66, 67},			 -- SEQ_010
	{112, 113, 114, 115}	 -- SEQ_030
};  

function onStart(player, quest)	
	quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();
	if (sequence == SEQ_ACCEPT) then
		quest:SetENpc(MIOUNNE, QFLAG_TALK);
	elseif (sequence == SEQ_000) then
		quest:SetENpc(NONOLATO, QFLAG_TALK);
	elseif (sequence == SEQ_003) then
		quest:SetENpc(NONOLATO, QFLAG_TALK);
		quest:SetENpc(OAPPPESI, QFLAG_TALK);
		quest:SetENpc(ELDID);
	elseif (sequence == SEQ_004) then
		quest:SetENpc(ELDID);
		quest:SetENpc(NONOLATO, QFLAG_TALK);
		quest:SetENpc(OAPPPESI, QFLAG_TALK);
		quest:SetENpc(OAPPPESI_SEQ004, QFLAG_TALK);
	elseif (sequence == SEQ_005) then
		quest:SetENpc(ANAIDJAA, QFLAG_TALK);
		quest:SetENpc(MIOUNNE);
	elseif (sequence == SEQ_015) then
--		data:ClearFlag(FLAG_SEQ025_FYE);
		quest:SetENpc(SOILEINE, QFLAG_TALK);
		quest:SetENpc(MIOUNNE);
	elseif (sequence == SEQ_020) then
		data:ClearFlag(FLAG_SEQ025_FYE);
		quest:SetENpc(SOILEINE, QFLAG_TALK);
		quest:SetENpc(DISQUIETEDLANCER);
		quest:SetENpc(ENIGMATICCONJURER);
		quest:SetENpc(ENTHUSIASTICARCHER);
		quest:SetENpc(EMBITTEREDARCHER);
		quest:SetENpc(SILKYHAIREDCONJURER);
		quest:SetENpc(WISELOOKINGNONJURER);
		quest:SetENpc(DISCONCERTEDCONJURER);
		quest:SetENpc(SOILEINE_INSTANCE);
		quest:SetENpc(PSHCJGUILD, QFLAG_PUSH, false, true);
		quest:SetENpc(CECILY);
	elseif (sequence == SEQ_025) then
		
		local data = quest:GetData();
		local fyeTalk = (not data:GetFlag(FLAG_SEQ025_FYE) and QFLAG_TALK or QFLAG_NONE);
		local oapppesiTalk = (data:GetFlag(FLAG_SEQ025_FYE) and QFLAG_TALK or QFLAG_NONE);
		
		quest:SetENpc(SOILEINE, QFLAG_TALK);
		quest:SetENpc(SILKYHAIREDCONJURER);
		quest:SetENpc(DISCONCERTEDCONJURER);
		quest:SetENpc(FYE, fyeTalk);
		quest:SetENpc(ENIGMATICCONJURER);
		quest:SetENpc(SOILEINE_INSTANCE);
		quest:SetENpc(OAPPPESI, oapppesiTalk);
		quest:SetENpc(CECILY);
	elseif (sequence == SEQ_035) then
		quest:SetENpc(PSHAMPHITHEATRE, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_040) then
		quest:SetENpc(FYE, QFLAG_TALK);
		quest:SetENpc(NIALL);
		quest:SetENpc(YDA);
		quest:SetENpc(PAPALYMO);
		quest:SetENpc(FUFUCHA);
		quest:SetENpc(BURCHARD);
		quest:SetENpc(URSBAEN);
		quest:SetENpc(NGOLBB);
		quest:SetENpc(FARRIMOND);
		quest:SetENpc(TKEBBE);
		quest:SetENpc(HANDELOUP);
		quest:SetENpc(GRINNAUX);
		quest:SetENpc(SQUEALINGSPRAT);
		quest:SetENpc(UNDERPRIVILEGEDORPHAN);
		quest:SetENpc(SUGARSTRUNGSCHOOLGIRL);
		quest:SetENpc(DESERTEDDAUGHTER);
		quest:SetENpc(TROUBLESOMETOMBOY);
		quest:SetENpc(AGINGELEZEN);
		quest:SetENpc(WISPILYWOODWORKER);
		quest:SetENpc(RESPECTABLEROEGADYN);
		quest:SetENpc(URBANEELEZEN);
		quest:SetENpc(MERRYOLDMATRON);
		quest:SetENpc(WELLGROOMEDWOMAN);
		quest:SetENpc(GOODNATUREDGOODWIFE);
		quest:SetENpc(OVERANIMATEDHYUR);
		quest:SetENpc(FASTIDIOUSFELLOW);
		quest:SetENpc(PSHAMPHITHEATRE, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_045) then
		quest:SetENpc(YDA);
		quest:SetENpc(PAPALYMO); 
		quest:SetENpc(PSHSEQ045, QFLAG_PUSH, false, true);
		quest:SetENpc(PSHAMPHITHEATRE, QFLAG_PUSH, false, true);
		quest:SetENpc(VKOROLON);
	elseif (sequence == SEQ_050) then
		quest:SetENpc(PSHAMPHITHEATRE, QFLAG_PUSH, false, true);
		quest:SetENpc(VKOROLON);
	elseif (sequence == SEQ_055) then
		quest:SetENpc(PSHAMPHITHEATRE, QFLAG_PUSH, false, true);
		quest:SetENpc(VKOROLON);
	elseif (sequence == SEQ_060) then
		quest:SetENpc(MIOUNNE, QFLAG_REWARD);
	end
end


function onTalk(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	local data = quest:GetData();

	if (sequence == SEQ_ACCEPT) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventMiounneStart");
			player:EndEvent();
			player:AcceptQuest(quest, true);
			return;
		end
	elseif (sequence == SEQ_000) then
		if (classId == NONOLATO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent007");	
			quest:StartSequence(SEQ_003);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9, 228.307, 12.010, -1257.005, 0);
			return;
		end 
	elseif (sequence == SEQ_003) then
		if (classId == OAPPPESI) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "processEvent007_2");
			if (result == 1) then
				GetWorldManager():DoZoneChange(player, 153, "PrivateAreaMasterPast", 1, 15, -2011.420, - 11.679, -916.309, -2.815);
				quest:StartSequence(SEQ_004);
				return;
			else
				player:EndEvent();
			end
		elseif (classId == NONOLATO) then		-- Return to instance if player warps out or crashes. 
			callClientFunction(player, "delegateEvent", player, quest, "processEvent007");	
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9, 228.307, 12.010, -1257.005, 0);
		end
	elseif (sequence == SEQ_004) then
		if (classId == OAPPPESI_SEQ004) then
			player:SendMessage(0x1D,"",">Combat Sequence Still Work in Progress");
			wait(3);
			player:SendMessage(0x1D,"",">Quest Will Automatically Progress in 5 seconds");
			wait(5);
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
			GetWorldManager():DoZoneChange(player, 206, nil, 0, 15, 220.416, 10.750, -1248.641, -0.061);
			quest:StartSequence(SEQ_005);
		elseif (classId == NONOLATO) then		-- Return to instance if player warps out or crashes. 
			callClientFunction(player, "delegateEvent", player, quest, "processEvent007");	
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9, 228.307, 12.010, -1257.005, 0);
		elseif (classId == OAPPPESI) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "processEvent007_2");
			if (result == 1) then
				GetWorldManager():DoZoneChange(player, 153, "PrivateAreaMasterPast", 1, 15, -2011.420, - 11.679, -916.309, -2.815);
				return;
			else
				player:EndEvent();
			end
		end
	elseif (sequence == SEQ_005) then
		if (classId == ANAIDJAA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020");
			player:EndEvent();
			quest:StartSequence(SEQ_010);
			quest:NewNpcLsMsg(1);	
		elseif (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
			player:EndEvent();
		end
	elseif (sequence == SEQ_015) then
		if (classId == SOILEINE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			quest:StartSequence(SEQ_020);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 10, -239.329, 19.495, -1646.319, 3.316);
			return;
		elseif (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
			player:EndEvent();
		end
	elseif (sequence == SEQ_020) then
		if (classId == DISQUIETEDLANCER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_3");
		elseif (classId == ENTHUSIASTICARCHER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_8");
		elseif (classId == EMBITTEREDARCHER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_9");
		elseif (classId == DISCONCERTEDCONJURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_4");
		elseif (classId == SILKYHAIREDCONJURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_7");
		elseif (classId == WISELOOKINGNONJURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_5");
		elseif (classId == SOILEINE_INSTANCE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
		elseif (classId == ENIGMATICCONJURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_6");
		elseif (classId == SOILEINE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 10, -239.329, 19.495, -1646.319, 3.316);
			return;
		end
	elseif (sequence == SEQ_025) then
		if (classId == SILKYHAIREDCONJURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_2");
		elseif (classId == DISCONCERTEDCONJURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_3");
		elseif (classId == ENIGMATICCONJURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_6");
		elseif (classId == SOILEINE_INSTANCE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
		elseif (classId == FYE) then
			if (not data:GetFlag(FLAG_SEQ025_FYE)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent045");
				data:SetFlag(FLAG_SEQ025_FYE);
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent045_2");
			end  
		elseif (classId == OAPPPESI) then
			if (not data:GetFlag(FLAG_SEQ025_FYE)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent040_4");				
			elseif (data:GetFlag(FLAG_SEQ025_FYE)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
				quest:StartSequence(SEQ_030);
				quest:NewNpcLsMsg(1);
				GetWorldManager():WarpToPublicArea(player);
			end
		elseif (classId == SOILEINE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			player:EndEvent();
			quest:StartSequence(SEQ_020);
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 10, -239.329, 19.495, -1646.319, 3.316);
			return;
		end
	elseif (sequence == SEQ_035) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
		end
	elseif (sequence == SEQ_040) then
		if (classId == FYE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
			quest:StartSequence(SEQ_045);
			player:EndEvent();
			GetWorldManager():DoZoneChange(player, 153, 'PrivateAreaMasterPast', 2, 15, -1939.459, 0.147, -891.202, -1.867);
		elseif (classId == NIALL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_2");
		elseif (classId == YDA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_3");
		elseif (classId == PAPALYMO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_4");
		elseif (classId == FUFUCHA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_5");
		elseif (classId == BURCHARD) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_6");
		elseif (classId == URSBAEN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_7");
		elseif (classId == NGOLBB) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_8");
		elseif (classId == FARRIMOND) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_9");
		elseif (classId == TKEBBE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_10");
		elseif (classId == HANDELOUP) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_11");
		elseif (classId == GRINNAUX) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_12");
		elseif (classId == SQUEALINGSPRAT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_13");
		elseif (classId == UNDERPRIVILEGEDORPHAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_14");
		elseif (classId == SUGARSTRUNGSCHOOLGIRL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_15");
		elseif (classId == DESERTEDDAUGHTER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_16");
		elseif (classId == TROUBLESOMETOMBOY) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_17");
		elseif (classId == AGINGELEZEN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_18");
		elseif (classId == WISPILYWOODWORKER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_19");
		elseif (classId == RESPECTABLEROEGADYN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_20");
		elseif (classId == URBANEELEZEN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_21");
		elseif (classId == MERRYOLDMATRON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_22");
		elseif (classId == WELLGROOMEDWOMAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_23");
		elseif (classId == GOODNATUREDGOODWIFE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_24");
		elseif (classId == OVERANIMATEDHYUR) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_25");
		elseif (classId == FASTIDIOUSFELLOW) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_26");
		end			
	elseif (sequence == SEQ_045) then
		if (classId == YDA) then 
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_2");
		elseif (classId == PAPALYMO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_3");
		end
	elseif (sequence == SEQ_060) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_01", 1);
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:EndEvent();
			player:CompleteQuest(quest);
			player:AddItem(1000001, 30000);
--			player:AddItem(2001005, 1);
--			player:SendGameMessage(GetWorldMaster(), 25117, 0x20, 2001005);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 30000);
			player:AddExp(50000, player:GetCurrentClassOrJobId(), 0);
		end
	end	
	player:EndEvent();
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();

	if (sequence == SEQ_020) then
		if (classId == PSHCJGUILD) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			quest:StartSequence(SEQ_025);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 11, -322.202, 8, -1666.206, 0.775);
		end
	elseif (sequence == SEQ_035) then
		if (classId == PSHAMPHITHEATRE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			quest:StartSequence(SEQ_040);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
		end
	elseif (sequence == SEQ_040) then	
		if (classId == PSHAMPHITHEATRE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			quest:StartSequence(SEQ_040);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
		end
	elseif (sequence == SEQ_045) then
		if (classId == PSHSEQ045) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
			quest:StartSequence(SEQ_060);			
			GetWorldManager():DoZoneChange(player, 155, "", 0, 15, 59.413, 4, -1219.275, 0.880);
			player:EndEvent();
		elseif (classId == PSHAMPHITHEATRE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			quest:StartSequence(SEQ_040);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
		end
	elseif (sequence == SEQ_050) then
		if (classId == PSHAMPHITHEATRE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			quest:StartSequence(SEQ_040);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
		end
	elseif (sequence == SEQ_055) then
		if (classId == PSHAMPHITHEATRE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			quest:StartSequence(SEQ_040);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
		end
	end
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		if (sequence == SEQ_010 or sequence == SEQ_015) then
			msgPack = 1;
		elseif (sequence == SEQ_030 or sequence == SEQ_035) then
			msgPack = 2;
		end
	end

	-- Quick way to handle all msgs nicely.
	player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1300018);
	if (msgStep >= #NPCLS_MSGS[msgPack]) then
		quest:EndOfNpcLsMsgs();
	else
		quest:ReadNpcLsMsg();
	end

		-- Handle anything else
	if (sequence == SEQ_010) then
		--player:SendMessage(0x1D,"",">seq 10 to 15");
		quest:StartSequenceForNpcLs(SEQ_015);
	elseif (sequence == SEQ_030) then
		--player:SendMessage(0x1D,"",">seq 30 to 35");
		quest:StartSequenceForNpcLs(SEQ_035);
	end
end

-- Experiment with creating instanced ContentArea and Director for SEQ004
--[[function doSEQ004CombatInstance(player, quest, npc)
	quest:GetData():ClearData();
	--if (classId == OAPPPESI) then
		--quest:StartSequence(SEQ_004);
		callClientFunction(player, "delegateEvent", player, quest, "processEvent_007_2");	
			player:EndEvent();
			contentArea = player.CurrentArea:CreateContentArea(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man2g01", "SimpleContentMan2g01", "Quest/QuestDirectorMan2g001");
				
			if (contentArea == nil) then
				return;
			end

			director = contentArea:GetContentDirector();
			player:AddDirector(director);
			director:StartDirector(false);
				
			player:KickEvent(director, "noticeEvent", true);
			player:SetLoginDirector(director);

			GetWorldManager():DoZoneChangeContent(player, contentArea, -2020, - 11.986, -926, 3);
			return;
	end
end    ]]-- 

function getJournalInformation(player, quest)
	return 40, 40, 40;
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