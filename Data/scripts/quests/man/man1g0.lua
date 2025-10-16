require ("global")
require ("quest")

--[[
-- player:SendMessage(0x1D,"",">");
Quest Script

Name: 	Whispers in the Wood
Code: 	Man1g0
Id: 	110007
Level:	8
Prereq: Souls Gone Wild (Man0g1 - 110006)

]]

--[[ Client Funcions
processEventMiounneStart	Quest start text from Miounne. Go to the CRP guild.
processEvent000_2	Miounne reminder text: "I wonder what it is the elementals are after... You might be able to find out for yourself, seeing as how you are able to converse with the moogles, and all."
processEvent010	Cutscene at the CRP guild, warps into echo.
processEvent010_2	Zezekuta: "A message from the moogle to young Fye..."
processEvent010_3	A'naldjaa: "The Acorn Orchard? Yes, it is the small playground outside, on the west side of the Atrium."
processEvent010_4	Frances: "Aye, the dead mask. Its powers have left it. A tragedy, that. It was meant for Fye's elder brother, Dunstan. "
processEvent010_5	 ???: "Looking for Fye, you say? She's out playing in the Orchard, I imagine, as all the little runts do. Just head west."
processEvent010_6	Ulmhylt: "There are very few among us capable of making the purification masks. I myself have never even attempted the feat."
processEvent010_7	Decima: "The moogles certainly can't repair everything"
processEvent010_8	Chalyo Tamlyo: "Fye's brother Dunstan was a mighty lancer, and one of the Wood Wailers."
processEvent020	Cutscene of Fye getting bullied by Khrimm. Warp into another echo.
processEvent020_2	Zezekuta reminder: "Your mask has been fashioned. That is truly good news. Now the conjurers may carry out the rites, and you will be purified before the eyes of the elementals."
processEvent020_3	Deserted Daughter: "Poor Fye. Khrimm can be such a bully. He really shouldn't pick on girls."
processEvent020_4	Troublesome Tomboy: "<whisper> Ya know what? Don't tell anyone, but both Khrimm's and Fye's families got turned into wildlings."
processEvent030	Cutscene with Fye
processEvent040	Cutscene in the CRP guild with Yda and Papalymo. Exit echo.
processEvent040_2	Miounne reminder: "Brother E-Sumi has returned to Gridania to conduct the rites at the festival."
processEvent050	Cutscene at the BTN guild to get Pearl Clover Fruit
processEvent050_2	Miounne reminder: "Off to find Pearl Clover Fruit, are you? I fancy Brother E-Sumi has taken quite a liking to you. He would not teach you the location of such rare fruits otherwise."
processEvent060	Cutscene with moogle, warp into instance
processEvent060_2	 ???: "Just a moment, kupo. I'll try and speak to the elementals of the trees."
processEvent070	Cutscene with Powle, Moogle, and you.
processEvent080	Cutscene at the BTN guild.
processEvent080_2	 ???: "The moogles love nothing if not their Pearl Clover Fruit. Even so, I'd not thought you like to find one so quickly. Gods, all these exceptional adventurers! How does Miounne do it?"
processEvent080_3	Miounne reminder: "The archers asked that you come to the Quiver's Hold as soon as possible. You'll find an agreeable Lalafell bloke by the name of Nonolato there."
processEvent090	Cutscene at the ARC guild.
processEvent090_2	Nonolato reminder: "The safety of Gridania is the duty of the archers of the Gods' Quiver, the lancers of the Wood Wailers, and the conjurers of Stillglade Fane."
processEvent090_3	 ???: "We make efforts to learn mooglespeak, but our control of the language is rudimentary at best. Without the conjurers, this endeavor would be completely hopeless."
processEvent090_4	 ???: "I know not of such things, but there are some that can use mooglespeak, whether through divine providence or study. And not all of them are forestborn."
processEvent090_5	 ???: "You know the mooglespeak? Then you must help us, please! Speak to Bowlord Lewin right away!"
processEvent100	Cutscene 2 at the ARC guild.
processEventComplete	Talk to Miounne to complete quest.
processEvent1000_2	 ???: "If the woodsin upon a soul is too great, the power of the purification mask may collapse under the burden. But I do not think you are in any such danger."
processEvent1000_5	Shows a "Enter the Instance?" dialog.
]]





--[[Journal entries sequential with processevent cutscenes
man1g000 - processEventMiounneStart
000@SHEETxtx/journalxtxFst34  - 34,"Gridanian culture holds a special place for those to whom the elementals of the forest entrust a task─oft calling them “the beckoned.” But young Khrimm refuses to believe this. Papalymo and Yda have gone to the Oak Atrium in hopes of finding Khrimm and speaking to him. You, too, must visit the Carpenters' Guild to see about the crafting of the mask you are to wear at the purification rites."
005@SHEETxtx/journalxtxFst35  - 35,"Zezekuta of the carpenters has showed you the mask you are to wear in the purification rite, explaining that the woodsin which clings to a soul is transferred to the mask by the power and magic of the dances. He mentioned that an older mask had broken, perhaps due to the woodsin being too great a burden. Your conversation is interrupted by the entrance of a young girl named Fye, who is searching for Khrimm. You still bear a message from the moogle to deliver to Fye. Go to the Acorn Orchard just outside and see that she hears it."
010@SHEETxtx/journalxtxFst36  - 36,"You find Khrimm and Fye speaking to one another in the Acorn Orchard, and overhear talk of Fye's elder brother, Dunstan, and his tragic fate of being turned into a wildling. Fye claims that she is making a new mask for her brother, refusing to give up hope of cleansing him of his woodsin. Khrimm, however, claims to no longer believe in the existence of the elementals, and the conversation ends with his leaving. Speak to Fye, and deliver the moogle's message. Should you lose track of her, visit A'naidjaa and have her point you in the right direction."
015@SHEETxtx/journalxtxFst37  - 37,"Fye is shocked to hear the moogle's claims that the mask is not broken, having thought it to be the sole reason her brother and Khrimm's parents were turned into wildlings. She asks you to speak to the moogles again if you can, and ask if there is any hope of freeing the soul of a wildling from the forest's clutches. Return to the Oak Atrium and see if there is anything Zezekuta can tell you of Fye, Khrimm, or their families."
020@SHEETxtx/journalxtxFst38  - 38,"Arriving at the Oak Atrium, you find Papalymo and Yda speaking with Zezekuta, and learn that Dunstan and Khrimm's parents both stirred the greenwrath of the elementals in the course of battling the Garleans. Zezekuta still holds your mask in anticipation of the purification rites, and assures you that your cleansing should pose no problems. Contact Miounne yet again by linkpearl, and see what she has to say."
025@SHEETxtx/journalxtxFst39  - 39,"Miounne informs you that Brother E[@1F]Sumi[@1F]Yan of the conjurers has returned to town to oversee the purification rites, and can be found at the Greatloam Growery. He asks that all those partaking in the rites come and see him."
030@SHEETxtx/journalxtxFst40  - 40,"At the Greatloam Growery, Brother E[@1F]Sumi[@1F]Yan seems concerned for Fye. To aid in her wish to find a way to save a wildling, he teaches you where in the forest you may find [ITEM] ─a known favorite of the moogles, and your best chance of attracting one near enough to speak to it."
035@SHEETxtx/journalxtxFst41  - 41,"You locate one of [ITEM] Brother E[@1F]Sumi[@1F]Yan spoke of, which quickly attracts the attention of a moogle. In return for the delectable, the moogle agrees to ask the elementals themselves if a wildling soul can be returned from the wood. Wander around nearby until the moogle is finished conversing with the elementals."
040@SHEETxtx/journalxtxFst42  - 42,"You follow the sound of an axe, and at its source find Khrimm chopping at a tree in his attempt to prove that the elementals do not exist. He claims to have seen Fye's brother and his parents in the forest, and that they were [@1A(1)]not[@1A(0)] wildlings. It is this that has caused him to cease to believe in the elementals. The moogle entrusts you with yet another message for Fye─this time from the elementals. They ask that she stop wandering the forest. Return to the Greatloam Growery and see the message delivered."
045@SHEETxtx/journalxtxFst43  - 43,"You report all to Fufucha, and have come to be regarded as one of those beckoned by the forest─a fact evidenced by the elementals' entrusting you with a message. Fufucha hurries to take word of this to the conjurers. See to it Miounne learns of your newfound prestige, as well."
050@SHEETxtx/journalxtxFst44  - 44,",Miounne informs you that archers from the Gods' Quiver have visited the Carline Canopy asking after you. Visit the Quiver's Hold and see what business they have with you."
055@SHEETxtx/journalxtxFst45  - 45,Nonolato of the Archers' Guild directs you to enter the halls of the Quiver's Hold and speak with the commanding officers.
060@SHEETxtx/journalxtxFst46  - 46,"You come upon Brother O[@1F]App[@1F]Pesi of the conjurers and Bowlord Lewin of the archers, and learn that it was indeed Fye's brother, Dunstan, who brought down the Hedge. Dunstan was once one of the lancers, but was later exiled from Gridania, and is now thought to be searching for his sister. Bowlord Lewin requests that you lend your strength in hunting down Dunstan and protecting the forest. Contact Miounne via linkpearl and see if she has any advice on the matter."
065@SHEETxtx/journalxtxFst186 -186,Miounne has asked that you come and see her at the Carline Canopy. Make your way there to see what she wants.,
processEventComplete
]]

--[[Named individuals/places in journal entries
--journalxtxFst34
Khrimm
Papalymo
Yda
	the Oak Atrium
	Carpenters' Guild

--journalxtxFst35
Zezekuta
Fye
	Acorn Orchard

--journalxtxFst36
Khrimm
Fye
	Acorn Orchard
Dunstan
A'naidjaa

--journalxtxFst37
Fye
Khrimm
	Oak Atrium
Zezekuta

--journalxtxFst38
	Oak Atrium
Papalymo
Yda
Zezekuta
Dunstan
Miounne (linkpearl)

--journalxtxFst39
Miounne
Esumi
	Greatloam Growery

--journalxtxFst40
	Greatloam Growery
Esumi
Fye

--journalxtxFst41
Esumi
moogle

--journalxtxFst42
Khrimm
Fye
moogle
	Greatloam Growery
	
--journalxtxFst43
Fufucha
Miounne

--journalxtxFst44
Miounne
	Archers' Guild
	Quiver's Hold

--journalxtxFst45
Nonolato
	Archers' Guild
	Quiver's Hold
commanding officers

--journalxtxFst46
OAppPesi
Bowlord Lewin
Miounne (linkpearl)

--journalxtxFst186
Miounne




]]


--[[Cutscene client names in order: Find npcs or push or linkshells attributed to each
man1g000 - processEventMiounneStart  - Miounne - Quest start text from Miounne. Go to the CRP guild.
man1g010 - processEvent010 -  - s    -  - Cutscene at the CRP guild, warps into echo. -  - Name ID: 1300018 - Model ID: 1000230 - Marker ID: 11000601 11000603 11000620 11000713 11008101 11040110
man1g020 - processEvent020 -  - s    -  - Cutscene of Fye getting bullied by Khrimm. Warp into another echo.
man1g030 - processEvent030 -  - s    -  - Cutscene with Fye
man1g040 - processEvent040 -  - s    -  - Cutscene in the CRP guild with Yda and Papalymo. Exit echo.
man1g050 - processEvent050 -  - s    -  - Cutscene at the BTN guild to get Pearl Clover Fruit
man1g060 - processEvent060 -  - s    -  - Cutscene with moogle, warp into instance
man1g070 - processEvent070 -  - s    -  - Cutscene with Powle, Moogle, and you.
man1g080 - processEvent080 -  - s    -  - Cutscene at the BTN guild.
man1g090 - processEvent090 -  - s    -  - Cutscene at the ARC guild.
man1g100 - processEvent100 -  - s    -  - Cutscene 2 at the ARC guild.
 processEventComplete	   -  - ENDS - MIOUNNE - Talk to Miounne to complete quest.
]]

--[[ Quest Markers -- Make them all appear on the map in seq 0 to find locations and place npc or push there
11000701,,1,11.86,-1265.189941,1900034,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000701,Visible
11000702,,1,-34.490002,-1271.98999,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000702,Visible
11000703,,1,-31.799999,-1245.540039,1100019,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000703,Visible
11000704,,1,-34.490002,-1271.98999,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000704,Visible
11000705,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000705,Visible
11000706,,1,-202.910004,-1477.51001,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000706,Visible
11000707,,1,-639.869995,-1086.219971,4000257,-1,common/mapMarker.le.spk,m00013,103,301,0,MapMarkerQuest,@5208/i11000707,Visible
11000708,,1,-634.799988,-1071.209961,4000257,-1,common/mapMarker.le.spk,m00013,103,301,0,MapMarkerQuest,@5208/i11000708,Visible
11000709,,1,-205.679993,-1454.719971,1600132,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000709,Visible
11000710,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000710,Visible
11000711,,1,232.880005,-1268.939941,1400007,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000711,Visible
11000712,,1,236.220001,-1274.569946,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000712,Visible
11000713,,1,55.939999,-1196.439941,1300018,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000713,Visible
11000714,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000715,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000716,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000717,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000718,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000719,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000720,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
]]


--Sequences      Journals' sequences              	lua marker  	   		   marker ID	map name	   location		   Event name			   Area				    Model ID    Name ID 	 Coordinates of NPC
SEQ_000	= 0;  -- 000@SHEETxtx/journalxtxFst34  --  MRKR_s000_ANAIDJAA		-- 11000701	-- A'naidjaa	-- CRP Gld 		-- processEvent010		-- Into Private 1	 -- 1000465 	-- 1900034	-- "206 11 Y -1265"
SEQ_005	= 5;  -- 005@SHEETxtx/journalxtxFst35  --  MRKR_s005_Push6CRP 		-- 11000702	-- ???			-- Outside CRP 	-- processEvent020		-- In Private 1	 	 -- 1090170 	-- 4000257 	-- "206 -34.5, 8, -1271, 0" ???
SEQ_010	= 10; -- 010@SHEETxtx/journalxtxFst36  --  MRKR_s010_FYE 			-- 11000703	-- Fye			-- Outside CRP 	-- processEvent030		-- Into Private 2?	 -- 1000014 	-- 1100019	-- "206 -31, 8, -1244.5, -2.5" Fye
SEQ_015	= 15; -- 015@SHEETxtx/journalxtxFst37  --  MRKR_s015_Push6CRP 		-- 11000704	-- ???			-- Outside CRP 	-- processEvent040		-- Back to public	 -- 1090171 	-- 4000257 	-- "206 -31.5, 8, -1274.5, 0" ???
SEQ_020	= 20; -- 020@SHEETxtx/journalxtxFst38  --  Miounne Linkpearl 		-- 			-- 				--  			-- 						-- 					 --  		-- 					-- 
SEQ_025	= 25; -- 025@SHEETxtx/journalxtxFst39  --  MRKR_s025_Push6BOT 		-- 11000706	-- ???			-- Botany 		-- processEvent050		-- Public			 -- 1090172 	-- 4000257	-- "206 -204, 18, -1477, 0" ???
SEQ_030	= 30; -- 030@SHEETxtx/journalxtxFst40  --  MRKR_s030_Push6MOOGLE	-- 11000707	-- ???			-- Stump 		-- processEvent060		-- Into Private		 -- 1090173 	-- 4000257	-- "150 -639, 23, -1086, 0" ??? 12.0
SEQ_035	= 35; -- 035@SHEETxtx/journalxtxFst41  --  MRKR_s035_Push6MOOGLE	-- 11000708	-- ???			-- Near stump 	-- processEvent070		-- Back to Public	 -- 1090174 	-- 4000257	-- "150 -631 22 -1067" ??? Spawn inside and walk out?
SEQ_040	= 40; -- 040@SHEETxtx/journalxtxFst42  --  MRKR_s040_OPYLTYL 		-- 11000709	-- Opyltyl		-- Botany		-- processEvent080		-- Public			 -- 1000236 	-- 1600132	-- "206 -205 Y -1454"
SEQ_045	= 45; -- 045@SHEETxtx/journalxtxFst43  --  Miounne Linkpearl		-- 			--  			-- 						-- 				--  				 -- 
SEQ_050	= 50; -- 050@SHEETxtx/journalxtxFst44  --  MRKR_s050_NONOLATO 		-- 11000711	-- Nonolato		-- Archers 		-- processEvent090		-- Public			 -- 1000463 	-- 1400007	-- "206 232 Y -1268"
SEQ_055	= 55; -- 055@SHEETxtx/journalxtxFst45  --  MRKR_s055_Push6ARC 		-- 11000712	-- ???			-- Archers 		-- processEvent100		-- Public			 -- 1090175 	-- 4000257	-- "206 238.5, 12, -1274, 0" ???
SEQ_060	= 60; -- 060@SHEETxtx/journalxtxFst46  --  Miounne Linkpearl		-- 			--  			-- 						-- 				--  				 -- 
SEQ_065	= 65; -- 065@SHEETxtx/journalxtxFst186 --  MRKR_s065_MIOUNNE		-- 11000713	-- Miounne		-- Adv Gld 		-- processEventComplete	-- Public			 -- 1000230 	-- 1300018	-- "155 55 Y -1196"

-- Actor class IDs:
MIOUNNE				= 1000230;-- SEQ start and SEQ_65
ANAIDJAA			= 1000465;-- SEQ_000
s005_Push6CRP		= 1090170;-- SEQ_005
CAPLAN				= 1000822;-- SEQ_005
FRANCES				= 1000466;-- SEQ_005
ZEZEKUTA			= 1000240;-- SEQ_005
DECIMA				= 1000622;-- SEQ_005
CHALYOTAMLYO		= 1000623;-- SEQ_005
ULMHYLT				= 1000823;-- SEQ_005
FYE					= 1000014;-- SEQ_010
DESERTEDDAUGHTER	= 1000827;-- SEQ_010
TROUBLESOMETOMBOY	= 1000828;-- SEQ_010
SQUEALINGSPRAT      = 1000826;-- SEQ_005
SUGARSCHOOLGIRL		= 1000824;-- SEQ_005
s015_Push6CRP		= 1090171;-- SEQ_015
s025_Push6BOT		= 1090172;-- SEQ_025
s030_Push6MOOGLE	= 1090173;-- SEQ_030
s035_Push6MOOGLE	= 1090174;-- SEQ_035
OPYLTYL				= 1000236;-- SEQ_040
NONOLATO			= 1000463;-- SEQ_050
s055_Push6ARC		= 1090175;-- SEQ_055

-- Markers - Sequences from onTalk for named, and onPush for ???
MRKR_s000_ANAIDJAA	= 11000701; -- A'naidhjaa - Carpenters' Guild - The Oak Atrium
MRKR_s005_Push6CRP	= 11000702; -- ??? - Outside Carpenters' Guild
MRKR_s010_FYE		= 11000703; -- Fye - Outside Carpenters' Guild
MRKR_s015_Push6CRP	= 11000704; -- ??? - Outside Carpenters' Guild

MRKR_s025_Push6BOT 		= 11000706; -- ??? - Outside Botanists' Guild
MRKR_s030_Push6MOOGLE	= 11000707; -- ??? - Leading to Lifemend Stump
MRKR_s035_Push6MOOGLE	= 11000708; -- ??? - A bit further from Lifemend Stump
MRKR_s040_OPYLTYL		= 11000709; -- Opyltyl - Botanists' Guild

MRKR_s050_NONOLATO 		= 11000711; -- Nonolato - Archers' Guild
MRKR_s055_Push6ARC 		= 11000712; -- ??? - Doorway next to Nonolato

MRKR_s065_MIOUNNE 		= 11000713; -- Miounne - Adventurers' Guild

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{96, 97, 98}, 	-- SEQ_020
	{170, 171, 172}, 	-- SEQ_045
	{231, 232}		-- SEQ_065
};

--[[ Client Funcions
processEventMiounneStart	Quest start text from Miounne. Go to the CRP guild.
processEvent000_2	Miounne reminder text: "I wonder what it is the elementals are after... You might be able to find out for yourself, seeing as how you are able to converse with the moogles, and all."
processEvent010	Cutscene at the CRP guild, warps into echo.
processEvent010_2	Zezekuta: "A message from the moogle to young Fye..."
processEvent010_3	A'naldjaa: "The Acorn Orchard? Yes, it is the small playground outside, on the west side of the Atrium."
processEvent010_4	Frances: "Aye, the dead mask. Its powers have left it. A tragedy, that. It was meant for Fye's elder brother, Dunstan. "
processEvent010_5	 ???: "Looking for Fye, you say? She's out playing in the Orchard, I imagine, as all the little runts do. Just head west."
processEvent010_6	Ulmhylt: "There are very few among us capable of making the purification masks. I myself have never even attempted the feat."
processEvent010_7	Decima: "The moogles certainly can't repair everything"
processEvent010_8	Chalyo Tamlyo: "Fye's brother Dunstan was a mighty lancer, and one of the Wood Wailers."
processEvent020	Cutscene of Fye getting bullied by Khrimm. Warp into another echo.
processEvent020_2	Zezekuta reminder: "Your mask has been fashioned. That is truly good news. Now the conjurers may carry out the rites, and you will be purified before the eyes of the elementals."
processEvent020_3	Deserted Daughter: "Poor Fye. Khrimm can be such a bully. He really shouldn't pick on girls."
processEvent020_4	Troublesome Tomboy: "<whisper> Ya know what? Don't tell anyone, but both Khrimm's and Fye's families got turned into wildlings."
processEvent030	Cutscene with Fye
processEvent040	Cutscene in the CRP guild with Yda and Papalymo. Exit echo.
processEvent040_2	Miounne reminder: "Brother E-Sumi has returned to Gridania to conduct the rites at the festival."
processEvent050	Cutscene at the BTN guild to get Pearl Clover Fruit
processEvent050_2	Miounne reminder: "Off to find Pearl Clover Fruit, are you? I fancy Brother E-Sumi has taken quite a liking to you. He would not teach you the location of such rare fruits otherwise."
processEvent060	Cutscene with moogle, warp into instance
processEvent060_2	 ???: "Just a moment, kupo. I'll try and speak to the elementals of the trees."
processEvent070	Cutscene with Powle, Moogle, and you.
processEvent080	Cutscene at the BTN guild.
processEvent080_2	 ???: "The moogles love nothing if not their Pearl Clover Fruit. Even so, I'd not thought you like to find one so quickly. Gods, all these exceptional adventurers! How does Miounne do it?"
processEvent080_3	Miounne reminder: "The archers asked that you come to the Quiver's Hold as soon as possible. You'll find an agreeable Lalafell bloke by the name of Nonolato there."
processEvent090	Cutscene at the ARC guild.
processEvent090_2	Nonolato reminder: "The safety of Gridania is the duty of the archers of the Gods' Quiver, the lancers of the Wood Wailers, and the conjurers of Stillglade Fane."
processEvent090_3	 ???: "We make efforts to learn mooglespeak, but our control of the language is rudimentary at best. Without the conjurers, this endeavor would be completely hopeless."
processEvent090_4	 ???: "I know not of such things, but there are some that can use mooglespeak, whether through divine providence or study. And not all of them are forestborn."
processEvent090_5	 ???: "You know the mooglespeak? Then you must help us, please! Speak to Bowlord Lewin right away!"
processEvent100	Cutscene 2 at the ARC guild.
processEventComplete	Talk to Miounne to complete quest.
processEvent1000_2	 ???: "If the woodsin upon a soul is too great, the power of the purification mask may collapse under the burden. But I do not think you are in any such danger."
processEvent1000_5	Shows a "Enter the Instance?" dialog.
]]

--[[Cutscene client names in order: Find npcs or push or linkshells attributed to each
man1g000 - processEventMiounneStart  -  - Miounne - Quest start text from Miounne. Go to the CRP guild.
man1g010 - processEvent010 -  - s000 -  - Cutscene at the CRP guild, warps into echo. -  - Name ID: 1300018 - Model ID: 1000230 - Marker ID: 11000601 11000603 11000620 11000713 11008101 11040110
man1g020 - processEvent020 -  - s020 -  - HEREWARD - Name ID: 1000324 - Model ID: 1000231 - Marker ID: 11000604
man1g030 - processEvent030 -  - s030 -  - CNJ_TRIG - Name ID: 4000257 - Model ID: 1090200 - Marker ID: 11000602 11000606 11000609 11000610 11000611 11000612 11000613 11000614 11000615
man1g040 - processEvent040 -  - s040 -  - no LTW - SWETHYNA - Name: 1100010 - Model: 1000680 - Marker: 11000607
man1g050 - processEvent050 -  - s050 -  - ys LTW - SWETHYNA - ^
man1g060 - processEvent060 -  - s060 -  - OPYLTYL - name: 1600132 - model: 1000236 - Marker: 11000608
man1g070 - processEvent070 -  - s070 -  - With you and Fufucha. Not originally used? Check youtube videos - After doing emotes, before kids ask you to help. Use onPush KIDS_TRIGGER - KIDS_TRIGGER - Name ID: 4000257 - Model ID: 1090201 - Marker ID: 11000602 11000606 11000609 11000610 11000611 11000612 11000613 11000614 11000615
man1g080 - processEvent080 -  - s080 -  - Kids tell you to meet them
man1g090 - processEvent090 -  - s090 -  - GATE_TRIGGER (outside town) - Name ID: 4000257 - Model ID: 1090202 - Marker: 11000611
man1g100 - processEvent100 -  - s100 -  - GATE_TRIGGER - Name ID: 4000257 - Model ID: 1090202 - Marker ID: 11000612
 processEventComplete	   -  - ENDS
]]

-- Quest Actors


--[[ Quest Markers -- Make them all appear on the map in seq 0 to find locations and place npc or push there
11000701,,1,11.86,-1265.189941,1900034,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000701,Visible
11000702,,1,-34.490002,-1271.98999,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000702,Visible
11000703,,1,-31.799999,-1245.540039,1100019,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000703,Visible
11000704,,1,-34.490002,-1271.98999,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000704,Visible
X ------11000705,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000705,Visible
11000706,,1,-202.910004,-1477.51001,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000706,Visible
11000707,,1,-639.869995,-1086.219971,4000257,-1,common/mapMarker.le.spk,m00013,103,301,0,MapMarkerQuest,@5208/i11000707,Visible
11000708,,1,-634.799988,-1071.209961,4000257,-1,common/mapMarker.le.spk,m00013,103,301,0,MapMarkerQuest,@5208/i11000708,Visible
11000709,,1,-205.679993,-1454.719971,1600132,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000709,Visible
11000710,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000710,Visible
11000711,,1,232.880005,-1268.939941,1400007,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000711,Visible
11000712,,1,236.220001,-1274.569946,4000257,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000712,Visible
11000713,,1,55.939999,-1196.439941,1300018,-1,common/mapMarker.le.spk,m00013,103,321,0,MapMarkerQuest,@5208/i11000713,Visible
11000714,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000715,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000716,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000717,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000718,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000719,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
11000720,,1,-431,187,1600179,-1,common/mapMarker.le.spk,m00013,101,121,0,MapMarker,@5208/i11000101,Visible
]]

--[[Journal entries sequential with processevent cutscenes
man1g000 - processEventMiounneStart
000@SHEETxtx/journalxtxFst34  - 34,"Gridanian culture holds a special place for those to whom the elementals of the forest entrust a task─oft calling them “the beckoned.” But young Khrimm refuses to believe this. Papalymo and Yda have gone to the Oak Atrium in hopes of finding Khrimm and speaking to him. You, too, must visit the Carpenters' Guild to see about the crafting of the mask you are to wear at the purification rites."
005@SHEETxtx/journalxtxFst35  - 35,"Zezekuta of the carpenters has showed you the mask you are to wear in the purification rite, explaining that the woodsin which clings to a soul is transferred to the mask by the power and magic of the dances. He mentioned that an older mask had broken, perhaps due to the woodsin being too great a burden. Your conversation is interrupted by the entrance of a young girl named Fye, who is searching for Khrimm. You still bear a message from the moogle to deliver to Fye. Go to the Acorn Orchard just outside and see that she hears it."
010@SHEETxtx/journalxtxFst36  - 36,"You find Khrimm and Fye speaking to one another in the Acorn Orchard, and overhear talk of Fye's elder brother, Dunstan, and his tragic fate of being turned into a wildling. Fye claims that she is making a new mask for her brother, refusing to give up hope of cleansing him of his woodsin. Khrimm, however, claims to no longer believe in the existence of the elementals, and the conversation ends with his leaving. Speak to Fye, and deliver the moogle's message. Should you lose track of her, visit A'naidjaa and have her point you in the right direction."
015@SHEETxtx/journalxtxFst37  - 37,"Fye is shocked to hear the moogle's claims that the mask is not broken, having thought it to be the sole reason her brother and Khrimm's parents were turned into wildlings. She asks you to speak to the moogles again if you can, and ask if there is any hope of freeing the soul of a wildling from the forest's clutches. Return to the Oak Atrium and see if there is anything Zezekuta can tell you of Fye, Khrimm, or their families."
020@SHEETxtx/journalxtxFst38  - 38,"Arriving at the Oak Atrium, you find Papalymo and Yda speaking with Zezekuta, and learn that Dunstan and Khrimm's parents both stirred the greenwrath of the elementals in the course of battling the Garleans. Zezekuta still holds your mask in anticipation of the purification rites, and assures you that your cleansing should pose no problems. Contact Miounne yet again by linkpearl, and see what she has to say."
025@SHEETxtx/journalxtxFst39  - 39,"Miounne informs you that Brother E[@1F]Sumi[@1F]Yan of the conjurers has returned to town to oversee the purification rites, and can be found at the Greatloam Growery. He asks that all those partaking in the rites come and see him."
030@SHEETxtx/journalxtxFst40  - 40,"At the Greatloam Growery, Brother E[@1F]Sumi[@1F]Yan seems concerned for Fye. To aid in her wish to find a way to save a wildling, he teaches you where in the forest you may find [ITEM] ─a known favorite of the moogles, and your best chance of attracting one near enough to speak to it."
035@SHEETxtx/journalxtxFst41  - 41,"You locate one of [ITEM] Brother E[@1F]Sumi[@1F]Yan spoke of, which quickly attracts the attention of a moogle. In return for the delectable, the moogle agrees to ask the elementals themselves if a wildling soul can be returned from the wood. Wander around nearby until the moogle is finished conversing with the elementals."
040@SHEETxtx/journalxtxFst42  - 42,"You follow the sound of an axe, and at its source find Khrimm chopping at a tree in his attempt to prove that the elementals do not exist. He claims to have seen Fye's brother and his parents in the forest, and that they were [@1A(1)]not[@1A(0)] wildlings. It is this that has caused him to cease to believe in the elementals. The moogle entrusts you with yet another message for Fye─this time from the elementals. They ask that she stop wandering the forest. Return to the Greatloam Growery and see the message delivered."
045@SHEETxtx/journalxtxFst43  - 43,"You report all to Fufucha, and have come to be regarded as one of those beckoned by the forest─a fact evidenced by the elementals' entrusting you with a message. Fufucha hurries to take word of this to the conjurers. See to it Miounne learns of your newfound prestige, as well."
050@SHEETxtx/journalxtxFst44  - 44,",Miounne informs you that archers from the Gods' Quiver have visited the Carline Canopy asking after you. Visit the Quiver's Hold and see what business they have with you."
055@SHEETxtx/journalxtxFst45  - 45,Nonolato of the Archers' Guild directs you to enter the halls of the Quiver's Hold and speak with the commanding officers.
060@SHEETxtx/journalxtxFst46  - 46,"You come upon Brother O[@1F]App[@1F]Pesi of the conjurers and Bowlord Lewin of the archers, and learn that it was indeed Fye's brother, Dunstan, who brought down the Hedge. Dunstan was once one of the lancers, but was later exiled from Gridania, and is now thought to be searching for his sister. Bowlord Lewin requests that you lend your strength in hunting down Dunstan and protecting the forest. Contact Miounne via linkpearl and see if she has any advice on the matter."
065@SHEETxtx/journalxtxFst186 -186,Miounne has asked that you come and see her at the Carline Canopy. Make your way there to see what she wants.,
processEventComplete
]]





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
		quest:SetENpc(ANAIDJAA, QFLAG_TALK);
	elseif (sequence == SEQ_005) then
		quest:SetENpc(s005_Push6CRP, QFLAG_PUSH, false, true);
		quest:SetENpc(FRANCES);
		quest:SetENpc(ANAIDJAA);
		quest:SetENpc(ZEZEKUTA);
		quest:SetENpc(CAPLAN);
		quest:SetENpc(CHALYOTAMLYO);
		quest:SetENpc(DECIMA);
		quest:SetENpc(ULMHYLT);
		quest:SetENpc(SQUEALINGSPRAT);
		quest:SetENpc(SUGARSCHOOLGIRL);
	elseif (sequence == SEQ_010) then
		quest:SetENpc(FYE, QFLAG_TALK);
		quest:SetENpc(DESERTEDDAUGHTER);
		quest:SetENpc(TROUBLESOMETOMBOY);
		quest:SetENpc(ANAIDJAA, QFLAG_TALK);
	elseif (sequence == SEQ_015) then
		quest:SetENpc(s015_Push6CRP, QFLAG_PUSH, false, true);
		quest:SetENpc(DESERTEDDAUGHTER);
		quest:SetENpc(TROUBLESOMETOMBOY);
		quest:SetENpc(ANAIDJAA, QFLAG_TALK);
	elseif (sequence == SEQ_020) then
	elseif (sequence == SEQ_025) then
		quest:SetENpc(s025_Push6BOT, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_030) then
		quest:SetENpc(s030_Push6MOOGLE, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_035) then
		quest:SetENpc(s030_Push6MOOGLE, QFLAG_PUSH, false, true);
		quest:SetENpc(s035_Push6MOOGLE, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_040) then
		quest:SetENpc(OPYLTYL, QFLAG_TALK);
	elseif (sequence == SEQ_045) then
	elseif (sequence == SEQ_050) then
		quest:SetENpc(NONOLATO, QFLAG_TALK);
	elseif (sequence == SEQ_055) then
		quest:SetENpc(s055_Push6ARC, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_060) then
	elseif (sequence == SEQ_065) then	
		quest:SetENpc(MIOUNNE, QFLAG_REWARD);
	end	
end
	
function onTalk(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();

	if (sequence == SEQ_ACCEPT) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventMiounneStart");
			player:EndEvent();
			player:AcceptQuest(quest, true);
			return;
		end
	elseif (sequence == SEQ_000) then -- put into private area 1
		--seq000_010_onTalk(player, quest, npc, classId);	--Creates sub-function	
		if (classId == ANAIDJAA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
			quest:StartSequence(SEQ_005);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6); -- place out of door
			return;
		end
	elseif (sequence == SEQ_005) then
		if (classId == FRANCES) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_4");
		elseif (classId == ANAIDJAA) then
			if (npc.CurrentArea.IsPrivate()) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent010_3");
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
				player:EndEvent();
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6); -- place out of door
				return;
			end
		elseif (classId == CAPLAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_5");
		elseif (classId == ZEZEKUTA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
		elseif (classId == CHALYOTAMLYO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_8");
		elseif (classId == DECIMA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_7");
		elseif (classId == ULMHYLT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_6");
		end
	elseif (sequence == SEQ_010) then -- put into private area 2
		if (classId == DESERTEDDAUGHTER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
		elseif (classId == TROUBLESOMETOMBOY) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_4");
		elseif (classId == FYE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			quest:StartSequence(SEQ_015);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 8); -- warp to 8
			return;
		elseif (classId == ANAIDJAA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
			quest:StartSequence(SEQ_005);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6); -- place out of door
			return;
		end
	elseif (sequence == SEQ_015) then
		if (classId == DESERTEDDAUGHTER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
		elseif (classId == TROUBLESOMETOMBOY) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_4");
		elseif (classId == ANAIDJAA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
			quest:StartSequence(SEQ_005);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6); -- place out of door
			return;
		end
	elseif (sequence == SEQ_040) then
		if (classId == OPYLTYL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
			player:EndEvent();
			quest:StartSequence(SEQ_045);
			quest:NewNpcLsMsg(1);
		end
	elseif (sequence == SEQ_050) then
		if (classId == NONOLATO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent090");
			player:EndEvent();
			quest:StartSequence(SEQ_055);
		end
	elseif (sequence == SEQ_065) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:EndEvent();
			player:CompleteQuest(quest);
			player:AddItem(1000001, 15000);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 15000);
			player:AddExp(30000, player:GetCurrentClassOrJobId(), 0);
			return;
		end
	end
	player:EndEvent();
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_005) then
		if (classId == s005_Push6CRP) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020");
			quest:StartSequence(SEQ_010);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7); --already in area
			return;
		end
	elseif (sequence == SEQ_010) then -- no cutscene--
	elseif (sequence == SEQ_015) then
		if (classId == s015_Push6CRP) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_020);
			player:EndEvent();
			GetWorldManager():WarpToPublicArea(player);
			return;
		end
	elseif (sequence == SEQ_020) then -- no cutscene--
	elseif (sequence == SEQ_025) then
		if (classId == s025_Push6BOT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			quest:StartSequence(SEQ_030);
			player:EndEvent();
		end
	elseif (sequence == SEQ_030) then
		if (classId == s030_Push6MOOGLE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			quest:StartSequence(SEQ_035);
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -650.565, 21.530, -1109.064, 0.398);
			return;
		end
	elseif (sequence == SEQ_035) then
		if (classId == s035_Push6MOOGLE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
			quest:StartSequence(SEQ_040);
			player:EndEvent();
			GetWorldManager():WarpToPublicArea(player);
			return;
		elseif (classId == s030_Push6MOOGLE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			player:EndEvent();
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -650.565, 21.530, -1109.064, 0.398);
			return;
		end
	elseif (sequence == SEQ_040) then -- no cutscene--
	elseif (sequence == SEQ_045) then -- no cutscene--
	elseif (sequence == SEQ_050) then -- no cutscene--
	elseif (sequence == SEQ_055) then
		if (classId == s055_Push6ARC) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent100");
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_060);
			player:EndEvent();
		end
	end
	player:EndEvent();
	quest:UpdateENPCs();
end
		

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_020 or sequence == SEQ_025) then
			msgPack = 1;
		elseif (sequence == SEQ_045 or sequence == SEQ_050) then
			msgPack = 2;
		elseif (sequence == SEQ_060 or sequence == SEQ_065) then
			msgPack = 3;
		end	
				
		-- Quick way to handle all msgs nicely.
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1300018);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
		
		-- Handle anything else
		if (sequence == SEQ_020) then
			quest:StartSequenceForNpcLs(SEQ_025);
		elseif (sequence == SEQ_045) then
			quest:StartSequenceForNpcLs(SEQ_050);
		elseif (sequence == SEQ_060) then
			quest:StartSequenceForNpcLs(SEQ_065);
		end
	end
	
	player:EndEvent();
end

function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
	local data = quest:GetData();
    local possibleMarkers = {};
    local data = quest:GetData();
	
	if (sequence == SEQ_000) then --place all markers
		table.insert(possibleMarkers, MRKR_s000_ANAIDJAA);
	elseif (sequence == SEQ_005) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_s005_Push6CRP);
		else
			table.insert(possibleMarkers, MRKR_s000_ANAIDJAA);
		end
	elseif (sequence == SEQ_010) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_s010_FYE);
		else
			table.insert(possibleMarkers, MRKR_s000_ANAIDJAA);
		end
	elseif (sequence == SEQ_015) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_s015_Push6CRP);
		else
			table.insert(possibleMarkers, MRKR_s000_ANAIDJAA);
		end
	elseif (sequence == SEQ_025) then
		table.insert(possibleMarkers, MRKR_s025_Push6BOT);
	elseif (sequence == SEQ_030) then
		table.insert(possibleMarkers, MRKR_s030_Push6MOOGLE);
	elseif (sequence == SEQ_035) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_s035_Push6MOOGLE);
		else
			table.insert(possibleMarkers, MRKR_s030_Push6MOOGLE);	
		end
	elseif (sequence == SEQ_040) then
		table.insert(possibleMarkers, MRKR_s040_OPYLTYL);
	elseif (sequence == SEQ_050) then
		table.insert(possibleMarkers, MRKR_s050_NONOLATO);
	elseif (sequence == SEQ_055) then
		table.insert(possibleMarkers, MRKR_s055_Push6ARC);
	elseif (sequence == SEQ_065) then
		table.insert(possibleMarkers, MRKR_s065_MIOUNNE);
	end
    return unpack(possibleMarkers)
end
