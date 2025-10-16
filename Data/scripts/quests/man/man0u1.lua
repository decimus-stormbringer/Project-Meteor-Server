require ("global")
require ("quest")

--[[

Quest Script

Name:   Court in the Sands 
Code:   Man0u1
Id:     110010
Prereq: Flowers for All (Man0u0 - 110009)
Notes:


Vid refs - 
https://www.youtube.com/watch?v=WNRLrwZ3BJY&t=284s
https://www.youtube.com/watch?v=eZgcq-FMpfw&t=504s

Coliseum fight - https://www.youtube.com/watch?v=Jcv9I2Bk46w

A LOT - https://www.youtube.com/watch?v=gySHO1Be9OM

Slerp Lederp's refs:

WotgAshiee's playthrough:
https://www.youtube.com/watch?v=sXI6FpJKOm4&list=PLB94C3DE039B18BE3&index=4
https://ffxiv.gamerescape.com/wiki/Loremonger:Court_in_the_Sands

ProcessEvents

processEventMomodiStart				Initial cutscene upon quest starting.
processEvent000_1					"Instances are special areas that are entered upon fulfilling certain requirements, such as progressing in a quest. There will always be a message telling you when you have entered an instance, and your minimap will show its boundaries."
									"Most instances can be left by crossing those boundaries; however, there are some, such as this one, in which certain objectives must be met before you are allowed to exit."
processEvent000_2					Undaunted Adventurer: "Gil, gil, gil. That's what it's all about here in Ul'dah. Everything's got a price―even life."
processEvent000_3					Greedy Merchant: "Were there any casualties at the parade? There's a pretty gil to be made out of funerals, you know."
processEvent000_4					Spry Salesman: "There's plenty of rich folk around here. If you try and wring a few gil out of one of them, just make sure you ain't the poor sod that ends up with a mark on his back."
processEvent000_5					Lionhearted Adventurer: "You've got to be one of three things to survive here―bloody clever, bloody strong, or bloody lucky! If you ain't, Ul'dah'll be the end of you, sure as your poxy-arsed ma was your beginning."
processEvent000_6					Upbeat Adventurer: "Did you hear!? Greinfarr the Great beat that rampaging beast at the parade to a bloody pulp!The Garlean presence in Eorzea is no cause for concern."
processEvent000_7					Seemingly Calm Adventurer: "The Garlean presence in Eorzea is no cause for concern."
processEvent000_8					Over-Competitive Adventurer: "ord is, an extremely valuable mineral vein was found deep within the Nanawa Mines. They say that's why they ain't allowin' none to enter."
processEvent000_9					Opotopa Pottopa: "Ala Mhigo has fallen into the hands of the Garlean Empire, and the number of Ala Mhigan refugees here in Ul'dah grows daily."
processEvent000_10					???: "No doubt that beast would have been ushered onto the bloodsands of the Coliseum with the greatest fanfare. A true shame that it had to be put down."
processEvent010						MOMODI - Expects a zone transition out of the PrivateArea afterwards
processEvent010_2					Momodi reminder: "Best attune yourself to the aetheryte at Camp Black Brush before aught else."
processEvent013						Momodi Linkshell speech when you touch the aetheryte.
processEvent013_2					Momodi Linkshell speech reminder?
processEvent015						Returning to Momodi speech. "The prodigal son returns! So, how went the treasure huntin'? Happen upon any more precious little flowers?"
processEvent017						Talking to Momodi again. "Ah, yes! I've remembered! Don't expect to find a flower like that last one every time you go traipsin' about. For most folk, a treasure such as that is a once-in-a-lifetime find."
processEvent017_2					Momodi reminder speech: "<sigh> Gods... Very well, let's try this again. I'll talk nice and slow this time. How's that?"
processEvent017_3					Momodi reminder speech: "Did you bother to head to the Coliseum with the pass I gave you? If you fancy learnin' to use a sword, there's no place finer in all Eorzea."
processEvent017_4					Momodi reminder speech: "Did you find Eshtaime's Lapidaries? Those greedy whoresons are always happy to get their mitts on a rare flower."
processEvent020	
processEvent025						WorldMaster Message about Linkshells.
processEvent020_2					:"Our commitment to produce the finest in fineries has even attracted the patronage of the royal family."
processEvent030	
processEvent030_2					???: "Do you wish to fight in the Coliseum? Hmph, another bloody <item>, is it? You damned adventurers and your special favor."
processEvent030_3					???: "I heard in addition to being a fearless warrior, Greinfarr is also the Coliseum owner's son. They say he oft goes on long trips alone─some sort of ascetic training ritual."
processEvent030_4					???: "Gods, have you any inkling how much gil went into organizing that parade? And the Coliseum's main attraction was killed."
processEvent030_5					???: "This will no doubt increase Greinfarr's popularity among the masses. Any pupils of his certainly have a bright future"
processEvent030_6					???: "They're short-handed for the next match...but I'm not at full strength. Still, I'd be less than a man if I didn't fight, seeing what Master Greinfarr did for us."
processEvent030_7					???: "That lackwit of a thaumaturge made a right bloody mess of things. The entire faith of Nald'thal should be held accountable for all costs, if you ask me."
processEvent030_8					???: "I can't believe the tourney of beasts was canceled. You have no idea..."
processEvent030_9					???: "The whole parade incident was Corguevais's fault, that accursed thaumaturge."
processEvent030_10					???: "I never studied logic at the Phrontistery, but it seems to me that if Greinfarr put down the beast at the parade..."
processEvent030_11					???: "The tourney...I... I meant to fight to show my dearly beloved the fierceness of my love for him─to fell the foul beast by the light of the sun, and then offer him my maidenhood by the light of the moons."
processEvent030_12					WorldMaster message.....
processEvent032_2					???: "The best of their warriors remain behind to carry on that useless fight."
processEvent032_3					???: "Master Greinfarr is close friends with Niellefresne, the son of the owner of Eshtaime's Lapidaries."
processEvent032_4					???: "You there, have you seen the owner? I heard that he headed out with the master of the Miners' Guild."
processEvent035	
processEvent040	
processEvent045	
processEvent040_2					Momodi reminder speech: "I hear that Amajina & Sons Mineral Concern is takin' on hands for some extra work. Got any interest in diggin'?"
processEvent050	
processEvent050_2					???: "<sigh> Gods, not another scuffle. Are all the bloody miners in their cups again?"
processEvent050_3					???: "What the seven hells d'you want? Ain't you never heard there ain't nothin' more dangerous than comin' 'twixt a miner and his drink? Leave me be afore I bury my pickaxe up your adventurin' arse."
processEvent050_4					???: "Aye, that's it. Take his bloody hands off! That'll make him think twice before goin' in our mines again."
processEvent050_5					???: "Bunch of bleedin' mummers, the lot of 'em. There's naught to be gained from gettin' hot and bothered here."
processEvent050_6					???: "Why must these things always happen just before I'm to take the stage?"
processEvent050_7					???: "You hear if that Corguevais got hisself exiled yet? If not, then he's still sworn to the Order. Best not lay a hand on one of them lot, lest you fancy the rest of 'em layin' their hands on you."
processEvent050_8					???: "I know it base of me, but I do love to see men come to blows. There's something so primal about it, don't you think? Who needs the Coliseum when these brutes bring the fights to me? Hehehe!"
processEvent050_9					???: "Eaaasy there, killer. Rein it in a bit."
processEvent050_10					Nittma Guttma: "Well, I haven't had this much excitement in...in... Oh...oh dear... Perhaps I should lie down."
processEvent050_11					Corguevais: "Please...mercy... I-I meant no harm..."
processEvent050_12					???: "Come to try and lift one of my bottles, have you? Aye, every miner in Thanalan knows Tyago Moui drinks the best wines. Well, lay a hand on aught of mine and you won't get it back, understand?"
processEvent050_13					???: "What were you doing down in the Nanawa Mines? Those are Amajina shafts! Speak! Or by the gods we'll have your bloody tongue out!"
processEvent050_14					???: "And what of the parade? That was your doing as well, was it not? My own sister was injured in the chaos─a broken hip. The healers are saying she's like never to walk again!"
processEvent051_1					emote sequence: Furious
processEvent051_2					emote sequence: Beckon
processEvent051_3					emote sequence: laugh
processEvent051_4					emote sequence: deny
processEvent051_5					emote sequence: upset
processEvent051_6					emote sequence: soothe
processEvent051_7					(arg1)	Failed emote sequence
processEvent051_8					Emote reminder?
processEvent055_1					Manic Miner: "Who the hells are you? Get lost, sprat."
processEvent055_2					Manic Miner: "What are you laughin' at, you bleedin' whoreson!?"
processEvent055_3					Manic Miner: "I ain't got time for the likes of you."
processEvent056_1					Maddened Miner: "This ain't no concern o' yours. Piss off!"
processEvent056_2					Maddened Miner: "You got it all wrong. This old sod's the one in the wrong─not us."
processEvent056_3					Maddened Miner: "Piss off, ye bloody mummer!"
processEvent060	 :
processEvent060_2					Muscular Miner: "Fights ain't nothing new around here. But when them two are around, you'd better not start nothing."
processEvent060_3					Tyago Moui: "Those two are such impressive young men, aren't they?"
processEvent060_4					Maudlin Miner: "You don't know how rough we miners have got it."
processEvent060_5					Displeased Dancer: "That Elezen whose skin F'lhaminn just saved... I've seen him somewhere before."
processEvent060_6					Monitoring Miner: "Word is they found that Elezen right after the collapse in the shafts."
processEvent060_7					???: "Ain't no mistakin', they're their father's sons. Won't never see either of 'em back down from a scrap."
processEvent070	
processEvent075	
processEvent080	
processEvent080_2					Self-regarding Roe: "Why would such a child be out wandering all alone? Where are her parents?"
processEvent080_3					Frightened Lalafell: "That girl was carrying a map showing the path from Ul'dah to here."
processEvent080_4					Unsavory Cur: "Do you think she was looking for her parents? There's nothing but poor folk around here."
processEvent080_5					Malnourished Midlander: "I wonder if she was abandoned by passing travelers... It's a chilling thought, but having an extra mouth to feed can be a great burden in these parts."
processEvent080_6					Bright-eyed Brinemonger: "Mayhaps the girl comes from a wealthy house. Could be a handsome reward waiting for whoever sees her back to it in one piece."
processEvent080_7					Troubled Trader: "Count yourself lucky you weren't chanced upon by one of the waste's many beasts."
processEvent080_8					Helpless Hyur: "Corguevais has a good heart. He will see to it that the girl is looked after."
processEvent080_9					Untidy Outlander: "Nothing about that young child suggests to me that she is from Ala Mhigo."
processEvent080_10					Malodorous Mister: "If her belly be empty, I could spare a bit of me bread, such as it is. She ain't gettin' none of me water, though."
processEvent080_11					Corguevais: "Come, child. What is it? Are you not well? Oh, hello there, good adventurer. Tell me, do you know aught of this child?"
processEvent080_12					F'lhaminn: "Come, sweetling, there is no need for tears. We will take care of you now. Dry your eyes and tell us what has happened."
processEvent090	
processEvent200	
processEvent200_2					???: "Rumors are all over town, they are. Seems you took a cozy little trip with our very own songstress, F'lhaminn."
processEvent205	
processEvent205_2					???: "Did you hear about the cave-in at the mines? The Phrontistery is full to the rafters with the injured."
processEvent207	
processEvent210	
processEvent210_2					???: "Accidents in the mine shafts are certainly not the rarest of things. Still, this latest collapse left a good deal more injured than we usually see."
processEvent210_3					Worrisome Assistant: "I've never seen wounds like this before. And Master Faustigeant has ordered that any accounts given by patients be considered delusions and not recorded."
processEvent210_4					???: "No...no! Do not make me open my eyes! No!!!"
processEvent210_5					Well-washed Leech: "Master Faustigeant has ordered you to survey the sickrooms? Very well."
processEvent210_6					Qualmish Miner: "I s-saw it. Beyond the b-barrier. Such a t-terrifying sight..."
processEvent210_7					Muscular Miner: "Not many miners were seriously injured, but a lot of them─and I mean a lot ─ seem to have suffered mental breakdowns."
processEvent210_8					???: "Who cares what caused it? Fact is, it happened. Not like the Concern stands to lose much anyway, seeing as how we were never even using that tunnel to begin with."
processEvent220	 :
processEvent230	 :
processEventComplete				Quest completion text from Mimodi
processEvent1000_1					???: "I can't for the life of me work out why everybody's still talking about that damned parade."
processEvent1000_2					Same as above
processEvent1000_3					???: "Have you come to see F'lhaminn? I hate to be the bearer of bad news, but she rarely sings anymore."
processEvent1000_5					Worldmaster: "Enter this instance?"
processEventTu_001					NPC Linkshell tutorial

--[[ 

Phase:
        
45  (Miner's Guild)
        Linette   processEvent050 (initial CS)
        Change phase to 50 after interaction
        
50  (Miner's Guild Instance #1)
        Name                    DisplayName             ActorClass                          Event
        Linette                 1100016                 1000861                             processEvent050_2
        Corguevais              1200025                 1000043/1001054                     processEvent050_11
        Nittma Guttma           1400127                 1001286                             processEvent050_10
        Nortmoen                1600127                 1600042
        F'lhaminn               1900054                 1000038/1000842/1001514/2290008     processEvent051_1
        Tyago Moui              1900130                 1001203                             processEvent050_12
        Shilgen                 2200216                 1000637
        Muscular Miner          4000202                 1000690/1700013                     processEvent050_7
        Close-fisted Woman      4000366                 1000981                             processEvent050_8
        Astonished Adventurer   4000377                 1000895                             processEvent050_9
        Manic Miner             4000444                 1001283                             processEvent050_13
        Maddened Miner          4000445                 1001284                             processEvent050_14
        Maudlin Miner           4000446                 1001287                             processEvent050_3
        Mocking Miner           4000447                 1001288                             processEvent050_4
        Monitoring Miner        4000448                 1001289                             processEvent050_5
        Displeased Dancer       4000449                 1001290                             processEvent050_6
        
        Emotes 103, 108, 121, 125, 140, 135  in that order @ F'lhaminn, then change phase to 51
51
        Emotes 108 @ Maddened Miner
        Emotes 135, 103, 121 @ Manic Miner   
        Check both for clear state after each interaction and change phase to 55
        
55  (Miner's Guild Instance #2)

--]]

--[[

Needs Implementing:

SEQ_000  PrivateArea 4, Quicksand needs doors shut.
SEQ_005  Aetheryte Widget "You've arrived at Camp Black Brush."
SEQ_005  Aetheryte gives player first Guildleve: Moles for the Mauling.
SEQ_015, Coliseum Fight
SEQ_065, Flhammin Escort Mission
SEQ_070  Blockers for PrivateArea 4, where player leaves radius teleports player back to privatezone.

processEvent1000_1 - Ococo? Cutting Ococo from script labels him as ENPC with no DFTTalk or Quest Set.
processEvent1000_3 - NPC: "Have you come to see F'lhaminn? I hate to be the bearer of bad news, but she rarely sings anymore."
processEvent1000_5 - Worldmaster: "Enter this instance?" Used for Coliseum?
processEventTu_001 - Linkshell tutorial, possibly cut or added in later patches?

--]]

-- Sequence Numbers
SEQ_000 = 0; -- Ul'dah Adventurer's Guild
SEQ_005 = 5; -- Run to Camp Black Brush & Attune
SEQ_010 = 10; -- Return to the Guild.
SEQ_012 = 12; -- Speak to Momodi
SEQ_015 = 15; -- Visiting guilds (GSM, GLD)
SEQ_045 = 45; -- Visit Amajina & Sons (Miners Guild)
SEQ_050 = 50; -- Emotes from Flhaminn
SEQ_057 = 57; -- Put an end to enraged Miners with Emotes
SEQ_058 = 58; -- Calm Thaumaturge down. Accused of stealing. Talk to Flhammin again.
SEQ_060 = 60; -- Head to the Gates of Nald
SEQ_065 = 65; -- Protect Flhaminn from beastmen\Escort Mission
SEQ_070 = 70; -- Arrived at Black Brush with Flhaminn and find out the camp was under attack.
SEQ_075 = 75; -- Thancred arrives at Black Brush, Ascillia is entrusted to him.
SEQ_080 = 80; -- Return to Miners Guild with Flhaminn after task is complete.
SEQ_085 = 85; -- Contact Momodi via Linkpearl.
SEQ_090 = 90; -- Talk to Nogeloix in the Alchemist Guild.
SEQ_095 = 95; -- Pass through doors in Alchemist Guild.
SEQ_100 = 100; -- Make rounds to the sickrooms.
SEQ_105 = 105; -- Contact Momodi via Linkpearl
SEQ_110 = 110; -- Meet Momodi back at the Quicksand.

--SEQ_000
MOMODI                      = 1000841;
UNDAUNTED_ADVENTURER		= 1000936;
GREEDY_MERCHANT				= 1000937;
LIONHEARTED_ADVENTURER		= 1000938;
SPRY_SALESMAN				= 1000939;
UPBEAT_ADVENTURER			= 1000940;
SEEMINGLY_CALM_ADVENTURER   = 1000941;
THANCRED					= 1000948; -- 1000010
OTOPA_POTTOPA               = 1000864;
OVERCOMPETITIVE_ADVENTURER	= 1000807;
PRIVATEAREA_PAST_EXIT		= 1290002;

--SEQ_005
OCOCO						= 1000666;
-- ProcessEvent1000_1? Needs further investigation to confirm.

--SEQ_015
ELECOTTE					= 1000950;

--Gladiator's Guild
FRUHYBOLG					= 1000964;
ABYLGO_HAMYLGO				= 1000965;
QMHALAWI					= 1000969;
PAPAWA						= 1000962;
LULUTSU						= 1000863;
SWERDAHRM					= 1000967;
UNDEFEATED_GLADIATOR		= 1001020;
POORLY_OUTFITTED_GLADIATOR	= 1000995;
AGGRIEVED_GLADIATOR			= 1000997;
DISHEARTENED_GLADIATOR		= 1000999;
GLD_TRIG					= 1090283;
COL_TRIG					= 1090141;
GLD2_TRIG					= 1090077;

ESCORT_TRIG					= 1090004; --Placing this in Ul'dah rather than Thanalan fixes a bug SE never fixed.
SEQ70_TRIG					= 1090077; --Added temporarily to end "escort seq."
MIN_TRIGG					= 1090044;
ALCH_TRIGG					= 1090119;
SEQ100_TRIGG				= 1090121;
SEQ105_TRIGG				= 1090120;

--SEQ_045
LINETTE						= 1000861;

--SEQ_50/57 Private Area
FLHAMINN					= 1000038;
FLHAMINN_EMOTE			    = 1000842;
LINETTE						= 1000861;
SHILGEN						= 1000637;
NORTMOEN					= 1600042;
TYAGO_MOUI					= 1001203;
NITTMA_GUTTMA				= 1001286;
CORGUEVAIS					= 1001054;
ASTONISHED_ADVENTURER		= 1000895;
MONITORING_MINER			= 1001289;
MOCKING_MINER				= 1001288;
MUSCULAR_MINER				= 1000690;
MAUDLIN_MINER				= 1001287;
MADDENED_MINER				= 1001284;
MANIC_MINER					= 1001283;	
DISPLEASED_DANCER			= 1001290;
CLOSE_FISTED_WOMAN			= 1000981;

--SEQ_070 Private Area
ASCILLIA					= 1000042;
REGARDING_ROEGADYN			= 1000811;
UNSAVORY_CUR				= 1000814;
UNTIDY_OUTLANDER			= 1000808;
HELPLESS_HYUR				= 1000817;
TROUBLED_TRADER				= 1000812;
FRIGHTENED_LALAFELL			= 1000810;
MALNOURISHED_MIDLANDER		= 1000809;
BRIGHT_EYED_BRINEMONGER		= 1000816;
MALODOROUS_MISTER			= 1000815;

--SEQ_090/Private Area
NOGELOIX 					= 1000597;
SLOW_WITTED_MINER			= 1000689;
QUALMISH_MINER				= 1000699;
WORRISOME_ASSISTANT			= 1001207;
WELLWASHED_LEECH			= 1001210;

--Added to Fix ActorID Errors
MINERVA						= 1000783;
GOGOFU						= 1000046;
ISABELLA					= 1000639;
HAHAYO						= 1000047;

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{320},
	{324, 325},
	{92, 93, 94, 95, 96, 97},
	{184, 185, 186},
	{306, 307, 308}
};

--Counters
CNTR_SEQ15_GSM			= 0;
CNTR_SEQ15_GLD			= 1;
CNTR_SEQ50_EMOTE		= 2; -- Also used for Manic and Maddened Miner.

--Flags
FLAG_MANIC_EMOTE		= 0;
FLAG_MADDENED_EMOTE		= 1;

-- Quest Markers
MRKR_MOMODI             	= 11001001; --SEQ 0
MRKR_BLACKBRUSH  			= 11001002; --SEQ 5
MRKR_SEQ10_MOMODI			= 11001003; --SEQ 10
MRKR_SEQ12_MOMODI			= 11001004;	--SEQ 12
MRKR_GOLDSMITH				= 11001005; --SEQ 15
MRKR_GLADIATOR				= 11001006; --SEQ 15
MRKR_GLADIATOR2				= 11001007; --SEQ 15
MRKR_GLADIATOR3				= 11001008; --SEQ 15
MRKR_LINETTE				= 11001009;	--SEQ 45
MRKR_FLHAMMIN				= 11001010; --SEQ 50
MRKR_MANIC_MINER			= 11001011; --SEQ 57
MRKR_MADDENED_MINER			= 11001012; --SEQ 57
MRKR_FLHAMMIN2				= 11001013; --SEQ 58
MRKR_NALD_GATE				= 11001014; --SEQ 60
MRKR_ASCILLIA				= 11001015; --SEQ 65
MRKR_ASCILLIA2				= 11001016; --SEQ 70
MRKR_MINERS					= 11001017; --SEQ 75
MRKR_NOGELOIX				= 11001018; --SEQ 90
MRKR_DOOR2					= 11001019; --SEQ 95
MRKR_DOOR3					= 11001020; --SEQ 100
MRKR_MOMODI_END				= 11001021; --SEQ 105, 110

-- Quest Items
ITEM_VELODYNA_COSMOS = 0; -- Seq_000 : 2nd journal arg.    >=5 doesn't have.
ITEM_COLISEUM_PASS   = 0; -- Seq_015 : 3rd journal arg.    >=5 doesn't have

-- Quest Flags
FLAG_SEQ000			= 0;

function onStart(player, quest) 
    quest:StartSequence(SEQ_000);
    
    -- Immediately move to the Adventurer's Guild private area
	callClientFunction(player, "delegateEvent", player, quest, "processEventMomodiStart");
    GetWorldManager():DoZoneChange(player, 175, "PrivateAreaMasterPast", 4, 15, -75.242, 195.009, 74.572, -0.046);	
    player:SendGameMessage(quest, 329, 0x20);
	player:SendGameMessage(quest, 330, 0x20);
	player:endEvent();
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();

    if (sequence == SEQ_000) then
        quest:SetENpc(MOMODI, QFLAG_TALK);
        quest:SetENpc(OTOPA_POTTOPA);
		quest:SetENpc(UPBEAT_ADVENTURER);
		quest:SetENpc(UNDAUNTED_ADVENTURER);
		quest:SetENpc(SEEMINGLY_CALM_ADVENTURER);
		quest:SetENpc(LIONHEARTED_ADVENTURER);
		quest:SetENpc(OVERCOMPETITIVE_ADVENTURER);
		quest:SetENpc(GREEDY_MERCHANT);
		quest:SetENpc(SPRY_SALESMAN);
		quest:SetENpc(THANCRED);
    elseif (sequence == SEQ_005) then
        quest:SetENpc(MOMODI);
		quest:SetENpc(OCOCO, QFLAG_TALK);
	elseif (sequence == SEQ_010) then
		quest:SetENpc(MOMODI, QFLAG_TALK);
	elseif (sequence == SEQ_012) then
		local subseqGSM = data:SetCounter(CNTR_SEQ15_GSM, 0);
		local subseqGLD = data:SetCounter(CNTR_SEQ15_GLD, 0);
		quest:SetENpc(MOMODI, QFLAG_TALK);
	elseif (sequence == SEQ_015) then
		local subseqGSM = data:GetCounter(CNTR_SEQ15_GSM);
		local subseqGLD = data:GetCounter(CNTR_SEQ15_GLD);
		quest:SetENpc(MOMODI);
		quest:SetENpc(LULUTSU);
		quest:SetENpc(PAPAWA);
		quest:SetENpc(ABYLGO_HAMYLGO);
		quest:SetENpc(FRUHYBOLG);
		quest:SetENpc(QMHALAWI);
		quest:SetENpc(UNDEFEATED_GLADIATOR);
		quest:SetENpc(POORLY_OUTFITTED_GLADIATOR);
		quest:SetENpc(AGGRIEVED_GLADIATOR);
		quest:SetENpc(DISHEARTENED_GLADIATOR);
		quest:SetENpc(SWERDAHRM);
		quest:SetENpc(ELECOTTE, (subseqGSM <= 1) and QFLAG_TALK or QFLAG_OFF);
		quest:SetENpc(GLD_TRIG, (subseqGLD >= 0 and subseqGLD <= 2) and QFLAG_PUSH or QFLAG_OFF, false, (subseqGLD >= 0 and subseqGLD <= 2));
		quest:SetENpc(COL_TRIG, QFLAG_PUSH, false, true);
		quest:SetENpc(GLD2_TRIG, QFLAG_PUSH, false, true);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT);
		quest:SetENpc(GOGOFU);
	elseif (sequence == SEQ_045) then 
		data:SetCounter(CNTR_SEQ50_EMOTE, 0);
		data:ClearFlag(FLAG_MADDENED_EMOTE);
		data:ClearFlag(FLAG_MANIC_EMOTE);
        quest:SetENpc(LINETTE, QFLAG_TALK);
		quest:SetENpc(ISABELLA);
	elseif (sequence == SEQ_050) then
		data:ClearFlag(FLAG_MADDENED_EMOTE);
		data:ClearFlag(FLAG_MANIC_EMOTE);
		quest:SetENpc(MANIC_MINER);
		quest:SetENpc(MADDENED_MINER);
		quest:SetENpc(LINETTE);
		quest:SetENpc(TYAGO_MOUI);
		quest:SetENpc(NITTMA_GUTTMA);
		quest:SetENpc(CORGUEVAIS);
		quest:SetENpc(ASTONISHED_ADVENTURER);
		quest:SetENpc(MONITORING_MINER);
		quest:SetENpc(MOCKING_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(MAUDLIN_MINER);
		quest:SetENpc(DISPLEASED_DANCER);
		quest:SetENpc(CLOSE_FISTED_WOMAN);
		quest:SetENpc(FLHAMINN_EMOTE, QFLAG_TALK, true, false, true);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT);
	elseif (sequence == SEQ_057) then
		local emoteMaddenedMiner = (not data:GetFlag(FLAG_MADDENED_EMOTE) and QFLAG_TALK or QFLAG_OFF);
		local emoteManicMiner = (not data:GetFlag(FLAG_MANIC_EMOTE) and QFLAG_TALK or QFLAG_OFF);
		quest:SetENpc(FLHAMINN_EMOTE)
		quest:SetENpc(MANIC_MINER, emoteManicMiner, true, false, true);
		quest:SetENpc(MADDENED_MINER, emoteMaddenedMiner, true, false, true);
		quest:SetENpc(LINETTE);
		quest:SetENpc(TYAGO_MOUI);
		quest:SetENpc(NITTMA_GUTTMA);
		quest:SetENpc(CORGUEVAIS);
		quest:SetENpc(ASTONISHED_ADVENTURER);
		quest:SetENpc(MONITORING_MINER);
		quest:SetENpc(MOCKING_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(MAUDLIN_MINER);
		quest:SetENpc(DISPLEASED_DANCER);
		quest:SetENpc(CLOSE_FISTED_WOMAN);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT);
	elseif (sequence == SEQ_058) then
		quest:SetENpc(FLHAMINN, QFLAG_TALK);
		quest:SetENpc(LINETTE);
		quest:SetENpc(TYAGO_MOUI);
		quest:SetENpc(NITTMA_GUTTMA);
		quest:SetENpc(CORGUEVAIS);
		quest:SetENpc(MONITORING_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(MAUDLIN_MINER);
		quest:SetENpc(DISPLEASED_DANCER);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT);
	elseif (sequence == SEQ_060) then
		quest:SetENpc(ESCORT_TRIG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_065) then
		quest:SetENpc(SEQ70_TRIG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_070) then
		quest:SetENpc(ASCILLIA, QFLAG_TALK);
		quest:SetENpc(ESCORT_TRIG, QFLAG_PUSH, false, true);
		quest:SetENpc(FLHAMINN);
		quest:SetENpc(CORGUEVAIS);
		quest:SetENpc(HELPLESS_HYUR);
		quest:SetENpc(UNTIDY_OUTLANDER);
		quest:SetENpc(REGARDING_ROEGADYN);
		quest:SetENpc(UNSAVORY_CUR);
		quest:SetENpc(MALODOROUS_MISTER);
		quest:SetENpc(BRIGHT_EYED_BRINEMONGER);
		quest:SetENpc(MALNOURISHED_MIDLANDER);
		quest:SetENpc(FRIGHTENED_LALAFELL);
		quest:SetENpc(TROUBLED_TRADER);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT, QFLAG_NONE, false, true);
	elseif (sequence == SEQ_080) then
		quest:SetENpc(MIN_TRIGG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_090) then
		quest:SetENpc(NOGELOIX, QFLAG_TALK);
	elseif (sequence == SEQ_095) then
		quest:SetENpc(ALCH_TRIGG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_100) then
		quest:SetENpc(NOGELOIX, QFLAG_TALK);
		quest:SetENpc(SEQ100_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(SLOW_WITTED_MINER);
		quest:SetENpc(QUALMISH_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(WORRISOME_ASSISTANT);
		quest:SetENpc(WELLWASHED_LEECH);
	elseif (sequence == SEQ_105) then
		quest:SetENpc(SEQ100_TRIGG, QFLAG_OFF);
		quest:SetENpc(SEQ105_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(SLOW_WITTED_MINER);
		quest:SetENpc(QUALMISH_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(WORRISOME_ASSISTANT);
		quest:SetENpc(WELLWASHED_LEECH);
	elseif (sequence == SEQ_110) then
		quest:SetENpc(MOMODI, QFLAG_REWARD);
		quest:SetENpc(HAHAYO);
		quest:SetENpc(SEQ105_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(SLOW_WITTED_MINER);
		quest:SetENpc(QUALMISH_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(WORRISOME_ASSISTANT);
		quest:SetENpc(WELLWASHED_LEECH);
    end	
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
	local data = quest:GetData();
    
	if (sequence == SEQ_000) then
        seq000_onTalk(player, quest, npc, classId);	
    elseif (sequence == SEQ_005) then
	seq005_onTalk(player, quest, npc, classId);
		-- SEQ_005 has a Widget that displays "You have arrived at Camp BlackBrush."
	elseif (sequence == SEQ_010) then
	-- LsMsg, msg 323 after Aetheryte interaction.
		if (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015");
			player:EndEvent();
			quest:StartSequence(SEQ_012);
		end
		
	elseif (sequence == SEQ_012) then
		if (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent017");
			quest:NewNpcLsMsg(1);
			player:SendGameMessage(GetWorldMaster(), 25117, 0x20, 11000126); --Player recieves Coliseum Pass			
			player:EndEvent();
			quest:StartSequence(SEQ_015);
		end
		
	elseif (sequence == SEQ_015) then
		if (seq015_onTalk(player, quest, npc, classId) == true) then
			quest:UpdateENPCs();
			return;
		end
		
	elseif (sequence == SEQ_045) then
		if (classId == LINETTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
			quest:StartSequence(SEQ_050);
		end
		
	elseif (sequence == SEQ_050) then
		if (classId == LINETTE) then
			if (npc.CurrentArea.IsPrivate()) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
				data:ClearFlag(FLAG_MANIC_EMOTE);
				data:ClearFlag(FLAG_MADDENED_EMOTE);
				data:SetCounter(CNTR_SEQ50_EMOTE, 0);
			end
		elseif (classId == MAUDLIN_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_3");
		elseif (classId == MOCKING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_4");
		elseif (classId == MONITORING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_5");
		elseif (classId == DISPLEASED_DANCER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_6");
		elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_7");
		elseif (classId == CLOSE_FISTED_WOMAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_8");
		elseif (classId == ASTONISHED_ADVENTURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_9");
		elseif (classId == NITTMA_GUTTMA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_10");
		elseif (classId == CORGUEVAIS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_11");
		elseif (classId == TYAGO_MOUI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_12")
		elseif (classId == MANIC_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_13");
		elseif (classId == MADDENED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_14");
		elseif (classId == FLHAMINN_EMOTE) then
			local emoteTestStep = quest:GetData():GetCounter(CNTR_SEQ50_EMOTE);
			if (emoteTestStep == 0 or emoteTestStep == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_1"); --Furious
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				if (emoteTestStep == 0) then
					quest:GetData():IncCounter(CNTR_SEQ50_EMOTE);
				end
		elseif (emoteTestStep == 2) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_2"); -- Beckon
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
		elseif (emoteTestStep == 3) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_3"); -- Laugh
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
		elseif (emoteTestStep == 4) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_4"); -- Deny
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
		elseif (emoteTestStep == 5) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_5"); -- Upset
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
		elseif (emoteTestStep == 6) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_6"); -- Soothe
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
			end
		end
	player:EndEvent();
	
	elseif (sequence == SEQ_057) then
		if(classId == FLHAMINN_EMOTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent051_8"); -- For Reminder
		elseif (classId == MANIC_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_13");
			player:EndEvent();
		elseif (emoteTestStep == 7) then
			local emoteTestStep = quest:GetData():GetCounter(CNTR_SEQ50_EMOTE);
		elseif (classId == MADDENED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_14");
			player:EndEvent();
		elseif (emoteTestStep == 8) then
			local emoteTestStep = quest:GetData():GetCounter(CNTR_SEQ50_EMOTE);
		elseif (classId == LINETTE) then
			if (npc.CurrentArea.IsPrivate()) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
				data:SetCounter(CNTR_SEQ50_EMOTE, 0);
				data:ClearFlag(FLAG_MADDENED_EMOTE);
				data:ClearFlag(FLAG_MANIC_EMOTE);
				quest:StartSequence(SEQ_050);
			end
		elseif (classId == MAUDLIN_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_3");
		elseif (classId == MOCKING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_4");
		elseif (classId == MONITORING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_5");
		elseif (classId == DISPLEASED_DANCER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_6");
		elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_7");
		elseif (classId == CLOSE_FISTED_WOMAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_8");
		elseif (classId == ASTONISHED_ADVENTURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_9");
		elseif (classId == NITTMA_GUTTMA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_10");
		elseif (classId == CORGUEVAIS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_11");
		elseif (classId == TYAGO_MOUI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_12");
		end
	player:EndEvent();
	
	elseif (sequence == SEQ_058) then
		if (classId == FLHAMINN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
			GetWorldManager():WarpToPublicArea(player);
			player:EndEvent();
			quest:StartSequence(SEQ_060);
		elseif (classId == MAUDLIN_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_4");
		elseif (classId == MONITORING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_6");
		elseif (classId == DISPLEASED_DANCER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_5");
		elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_2");
		elseif (classId == NITTMA_GUTTMA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_10");
		elseif (classId == CORGUEVAIS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_11");
		elseif (classId == TYAGO_MOUI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_3");
		elseif (classId == LINETTE) then
			if (npc.CurrentArea.IsPrivate()) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent060_7");
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
				data:SetCounter(CNTR_SEQ50_EMOTE, 0);
				data:ClearFlag(FLAG_MADDENED_EMOTE);
				data:ClearFlag(FLAG_MANIC_EMOTE);
				quest:StartSequence(SEQ_050);
			end
		end
	player:EndEvent();
	elseif (sequence == SEQ_070) then
		if (classId == ASCILLIA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent090");
			--GetWorldManager():WarpToPublicArea(player);
			GetWorldManager():DoZoneChange(player, 170, nil, 0, 15, -32.6, 182.5, -77, -0.2);
			quest:StartSequence(SEQ_080);
		elseif (classId == REGARDING_ROEGADYN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_2");
		elseif (classId == FRIGHTENED_LALAFELL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_3");
		elseif (classId == UNSAVORY_CUR) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_4");
		elseif (classId == MALNOURISHED_MIDLANDER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_5");
		elseif (classId == BRIGHT_EYED_BRINEMONGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_6");
		elseif (classId == TROUBLED_TRADER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_7");
		elseif (classId == HELPLESS_HYUR) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_8");
		elseif (classId == UNTIDY_OUTLANDER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_9");
		elseif (classId == MALODOROUS_MISTER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_10");
		elseif (classId == CORGUEVAIS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_11");
		elseif (classId == FLHAMINN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_12");
		end
	player:EndEvent();
	
	elseif (sequence == SEQ_090) then
		if(classId == NOGELOIX) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210");
			player:EndEvent();
			quest:StartSequence(SEQ_095);
		end
		
	elseif (sequence == SEQ_100) then
		if (classId == WORRISOME_ASSISTANT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_3");
		elseif (classId == WELLWASHED_LEECH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_5");
		elseif (classId == QUALMISH_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_6");
		elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_7");
		elseif (classId == SLOW_WITTED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_8");
		elseif(classId == NOGELOIX) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210");
			player:EndEvent();
			quest:StartSequence(SEQ_095);
		end
		player:EndEvent();
	
	elseif (sequence == SEQ_105) then
		if (classId == WORRISOME_ASSISTANT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_3");
		elseif (classId == WELLWASHED_LEECH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_5");
		elseif (classId == QUALMISH_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_6");
		elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_7");
		elseif (classId == SLOW_WITTED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_8");
		elseif(classId == NOGELOIX) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210");
			player:EndEvent();
			quest:StartSequence(SEQ_095);
		end
	player:EndEvent()
	
	elseif (sequence == SEQ_110) then
		if(classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:EndEvent();
			player:CompleteQuest(quest);
			player:AddItem(1000001, 6000);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 6000);
			player:AddExp(10000, player:GetCurrentClassOrJobId(), 0);
			return;
		elseif (classId == WORRISOME_ASSISTANT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_3");
		elseif (classId == WELLWASHED_LEECH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_5");
		elseif (classId == QUALMISH_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_6");
		elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_7");
		elseif (classId == SLOW_WITTED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_8");
		end
		player:EndEvent();
	end
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
	local subseqGLD = data:GetCounter(CNTR_SEQ15_GLD);
	local subseqGSM = data:GetCounter(CNTR_SEQ15_GSM);
	
	if (sequence == SEQ_015) then
		if(classId == GLD_TRIG) then
			if (subseqGLD == 0) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
				data:IncCounter(CNTR_SEQ15_GLD); --GLD +1
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -192.241, 194.5, 195.317, -0.008);
				player:EndEvent();
			elseif (subseqGLD == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
				player:EndEvent();
				data:SetCounter(CNTR_SEQ15_GLD, 1);
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -192.241, 194.5, 195.317, -0.008);
			elseif (subseqGLD == 2) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
				player:EndEvent();
				data:SetCounter(CNTR_SEQ15_GLD, 1);
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -192.241, 194.5, 195.317, -0.008);
			end
		elseif (classId == COL_TRIG) then
			if (subseqGLD == 1) then
			-- Where coliseum fight needs to be implemented. Skipping to next cutscene.
				callClientFunction(player, "delegateEvent", player, quest, "processEvent035");
				data:IncCounter(CNTR_SEQ15_GLD); --GLD +1
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -177.893, 189.953, 218.754, 3.135); --Needs verification if player is warped in a new private instance or back in previous instance.
				player:EndEvent();
				return;
			end
		elseif(classId == GLD2_TRIG) then
			if (subseqGSM == 0) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
				data:IncCounter(CNTR_SEQ15_GLD);
				player:EndEvent();
				GetWorldManager():WarpToPublicArea(player);
			elseif (subseqGSM == 2) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent045");
				data:IncCounter(CNTR_SEQ15_GLD); --GLD +1
				quest:NewNpcLsMsg(1);
				quest:StartSequence(SEQ_045);
				player:EndEvent();
				GetWorldManager():WarpToPublicArea(player);
				return;
			end
		end	
	elseif (sequence == SEQ_060) then
		if(classId == ESCORT_TRIG) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent075");
				GetWorldManager():DoZoneChange(player, 170, nil, 0, 15, 126.125, 184.657, -362.836, -2.987);
				player:ChangeMusic(37);
				player:EndEvent();
				quest:StartSequence(SEQ_065);
			elseif (result == 2) then
				player:EndEvent();
			end
		end
	elseif (sequence == SEQ_065) then
		if (classId == SEQ70_TRIG) then
		
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, 51.855, 200.027, -482.399, -2.953);
			player:EndEvent();
			quest:StartSequence(SEQ_070);
		end
	elseif (sequence == SEQ_070) then
		if(classId == ESCORT_TRIG) then
		local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent075");
				GetWorldManager():DoZoneChange(player, 170, nil, 0, 15, 126.125, 184.657, -362.836, -2.987);
				player:ChangeMusic(37);
				player:EndEvent();
				quest:StartSequence(SEQ_065);
			elseif (result == 2) then
				player:EndEvent();
			end
		end
	elseif (sequence == SEQ_080) then
		if(classId == MIN_TRIGG) then
		
			callClientFunction(player, "delegateEvent", player, quest, "processEvent205");
			GetWorldManager():WarpToPublicArea(player);
			player:AddItem(1000001, 3000);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 3000)
			quest:NewNpcLsMsg(1);
			player:EndEvent();
			quest:StartSequence(SEQ_090);
		end
		
	elseif (sequence == SEQ_095) then
		if(classId == ALCH_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent220");
			GetWorldManager():DoZoneChange(player, 180, nil, 0, 15, -204.9441, 0, -159.944, 1.591); --Not a PrivateArea.
			player:EndEvent();
			quest:StartSequence(SEQ_100);
		end
	
	elseif (sequence == SEQ_100) then
		if(classId == SEQ100_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent230");
			quest:NewNpcLsMsg(1);
			player:EndEvent();
			quest:StartSequence(SEQ_105);
		end
		
	elseif (sequence == SEQ_105) then
		if(classId == SEQ105_TRIGG) then
			GetWorldManager():DoZoneChange(player, 209, nil, 0, 15, -215.248, 229.5, 297.833, 2.895);
			player:EndEvent();
		end
	elseif (sequence == SEQ_110) then
		if(classId == SEQ105_TRIGG) then
			GetWorldManager():DoZoneChange(player, 209, nil, 0, 15, -215.248, 229.5, 297.833, 2.895);
			player:EndEvent();
		end
    end
	quest:UpdateENPCs();
end

function onEmote(player, quest, npc, eventName)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();	
	local emoteTestStep = data:GetCounter(CNTR_SEQ50_EMOTE);

	-- Play the emote
	if (eventName == "emoteDefault1") then 		-- Furious
		player:DoEmote(npc.Id, 3, 21021);
	elseif (eventName == "emoteDefault2") then	-- Beckon
		player:DoEmote(npc.Id, 8, 21071);
	elseif (eventName == "emoteDefault3") then	-- Laugh
		player:DoEmote(npc.Id, 21, 21201);
	elseif (eventName == "emoteDefault4") then	-- Deny
		player:DoEmote(npc.Id, 25, 21241);
	elseif (eventName == "emoteDefault5") then	-- Upset
		player:DoEmote(npc.Id, 40, 21391);
	elseif (eventName == "emoteDefault6") then	-- Soothe
		player:DoEmote(npc.Id, 35, 21341);
	end
	wait(2.5);
	
	-- Handle the result
	if (sequence == SEQ_050) then
		if (classId == FLHAMINN_EMOTE) then
		-- Flhaminn Emote Sequence
			-- Furious
			if (emoteTestStep == 1) then
				if (eventName == "emoteDefault1") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_2");
					data:IncCounter(CNTR_SEQ50_EMOTE);
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				elseif (eventName == "emoteDefault2" or "emoteDefault3" or "emoteDefault4" or "emoteDefault5" or "emoteDefault6") then --Failed to do correct Emote.
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7")
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_1")
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Beckon
			elseif (emoteTestStep == 2) then
				if (eventName == "emoteDefault2") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_3");
					data:IncCounter(CNTR_SEQ50_EMOTE);
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				elseif (eventName == "emoteDefault1" or "emoteDefault3" or "emoteDefault4" or "emoteDefault5" or "emoteDefault6") then --Failed to do correct Emote.
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");				
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_2");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Laugh
			elseif (emoteTestStep == 3) then
				if (eventName == "emoteDefault3") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_4");
					data:IncCounter(CNTR_SEQ50_EMOTE);
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				elseif (eventName == "emoteDefault1" or "emoteDefault2" or "emoteDefault4" or "emoteDefault5" or "emoteDefault6") then	--Failed to do correct Emote.	
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_3");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Deny
			elseif (emoteTestStep == 4) then
				if (eventName == "emoteDefault4") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_5");
					data:IncCounter(CNTR_SEQ50_EMOTE);
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				elseif (eventName == "emoteDefault1" or "emoteDefault2" or "emoteDefault3" or "emoteDefault5" or "emoteDefault6") then --Failed to do correct Emote.
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_4")
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Upset
			elseif (emoteTestStep == 5) then
				if (eventName == "emoteDefault5") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_6");
					data:IncCounter(CNTR_SEQ50_EMOTE);
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				elseif (eventName == "emoteDefault1" or "emoteDefault2" or "emoteDefault3" or "emoteDefault4" or "emoteDefault6") then	--Failed to do correct Emote.	
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_5");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Soothe
			elseif (emoteTestStep == 6) then
				if (eventName == "emoteDefault6") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_8");
					quest:StartSequence(SEQ_057);
					data:IncCounter(CNTR_SEQ50_EMOTE);
				elseif (eventName == "emoteDefault1" or "emoteDefault2" or "emoteDefault3" or "emoteDefault4" or "emoteDefault5") then 	--Failed to do correct Emote.
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_6");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
			elseif (classId == FLHAMINN_EMOTE) then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_8");
				end	
			end
		end
	elseif (sequence == SEQ_057) then			--Manic Miner and Maddened Miner Sequence
		if (classId == MANIC_MINER) then
			if (not data:GetFlag(FLAG_MANIC_EMOTE)) then
				if (eventName == "emoteDefault1") then		-- Manic Miner: Furious
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_1");
					data:SetFlag(FLAG_MANIC_EMOTE);
					if (data:GetFlag(FLAG_MADDENED_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault2") then		-- Manic Miner: Beckon
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_3");
					data:SetFlag(FLAG_MANIC_EMOTE);
					if (data:GetFlag(FLAG_MADDENED_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault3") then		-- Manic Miner: Laugh
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_2");
					data:SetFlag(FLAG_MANIC_EMOTE);
					if (data:GetFlag(FLAG_MADDENED_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault4") then		-- Manic Miner: Deny
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_3");
					data:SetFlag(FLAG_MANIC_EMOTE);
					if (data:GetFlag(FLAG_MADDENED_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault5") then		-- Manic Miner: Upset
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_1");
					data:SetFlag(FLAG_MANIC_EMOTE);
					if (data:GetFlag(FLAG_MADDENED_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault6") then		-- Manic Miner: Soothe
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_3");
					data:SetFlag(FLAG_MANIC_EMOTE);
					if (data:GetFlag(FLAG_MADDENED_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				end
			end
		elseif (classId == MADDENED_MINER) then
			if (not data:GetFlag(FLAG_MADDENED_EMOTE)) then
				if (eventName == "emoteDefault1") then		-- Maddened Miner: Furious
					callClientFunction(player, "delegateEvent", player, quest, "processEvent056_1");
					data:SetFlag(FLAG_MADDENED_EMOTE);
					if (data:GetFlag(FLAG_MANIC_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault2") then		-- Maddened Miner: Beckon
					callClientFunction(player, "delegateEvent", player, quest, "processEvent056_2");
					data:SetFlag(FLAG_MADDENED_EMOTE);
					if (data:GetFlag(FLAG_MANIC_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault3") then		-- Maddened Miner: Laugh
					callClientFunction(player, "delegateEvent", player, quest, "processEvent056_3");
					data:SetFlag(FLAG_MADDENED_EMOTE);
					if (data:GetFlag(FLAG_MANIC_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault4") then		-- Maddened Miner: Deny
					callClientFunction(player, "delegateEvent", player, quest, "processEvent056_2");
					data:SetFlag(FLAG_MADDENED_EMOTE);
					if (data:GetFlag(FLAG_MANIC_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault5") then		-- Maddened Miner: Upset
					callClientFunction(player, "delegateEvent", player, quest, "processEvent056_1");
					data:SetFlag(FLAG_MADDENED_EMOTE);
					if (data:GetFlag(FLAG_MANIC_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				elseif (eventName == "emoteDefault6") then		-- Maddened Miner: Soothe
					callClientFunction(player, "delegateEvent", player, quest, "processEvent056_3");
					data:SetFlag(FLAG_MADDENED_EMOTE);
					if (data:GetFlag(FLAG_MANIC_EMOTE)) then
						callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
						GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
						quest:StartSequence(SEQ_058);
					end
				end
				player:EndEvent();
			end
		end
	end
		
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNotice(player, quest, target)
	local sequence = quest:getSequence();
	
    callClientFunction(player, "delegateEvent", player, quest, "processEvent000_1"); -- Describes what an Instance is
    player:EndEvent();
	quest:UpdateENPCs();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_005) then
			msgPack = 1;	
		elseif (sequence == SEQ_015) then
			msgPack = 2;
		elseif (sequence == SEQ_045) then
			msgPack = 3;
		elseif (sequence == SEQ_090) then
			msgPack = 4;
		elseif (sequence == SEQ_105 or sequence == SEQ_110) then
			msgPack = 5;
		end
		
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1500014);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
		
		-- Handle anything else
		if (sequence == SEQ_015 and quest:GetData():GetCounter(CNTR_SEQ15_GSM) >= 1 and quest:GetData():GetCounter(CNTR_SEQ15_GLD) >= 3) then
			quest:StartSequenceForNpcLs(SEQ_045);
		elseif (sequence == SEQ_105) then
			quest:StartSequenceForNpcLs(SEQ_110)
		end
	end
	
	player:EndEvent();
end

function seq000_onTalk(player, quest, npc, classId)
	
    if (classId == MOMODI) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
		quest:NewNpcLsMsg(1);
		player:EndEvent();
		quest:StartSequence(SEQ_005);
		quest:UpdateENPCs();
        GetWorldManager():DoZoneChange(player, 175, nil, 0, 15, player.positionX, player.positionY, player.positionZ, player.rotation);
        return;
    elseif (classId == UNDAUNTED_ADVENTURER) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent000_2");
    elseif (classId == GREEDY_MERCHANT) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent000_3");
    elseif (classId == SPRY_SALESMAN) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent000_4");
    elseif (classId == LIONHEARTED_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_5");
    elseif (classId == UPBEAT_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
    elseif (classId == SEEMINGLY_CALM_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_7");
    elseif (classId == OVERCOMPETITIVE_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_8");        
    elseif (classId == OTOPA_POTTOPA) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_9");
    elseif (classId == THANCRED) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_10");        
    end
	
    player:EndEvent();
end

function seq005_onTalk(player, quest, npc, classId) 
	if (classId == MOMODI) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
	elseif (classId == OCOCO) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent1000_1");
    end
	
	player:EndEvent();
end

function seq015_onTalk(player, quest, npc, classId)
	local data = quest:GetData();
	local subseqGSM = data:GetCounter(CNTR_SEQ15_GSM);
	local subseqGLD = data:GetCounter(CNTR_SEQ15_GLD);
	
	if (classId == MOMODI) then
		if (subseqGLD == 3) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent017_4");
	elseif (subseqGSM >= 2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent017_3");
			player:EndEvent();
	elseif (subseqGLD == 0) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent017_2");
	elseif (subseqGSM == 0) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent017_2");
		player:EndEvent();
	end
		--GSM Guild Event
	elseif (classId == ELECOTTE) then
		if (subseqGSM == 0) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020");
			player:AddItem(1000001, 2000);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 2000);
			data:IncCounter(CNTR_SEQ15_GSM); --GSM +1					
		elseif (subseqGSM == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
			data:IncCounter(CNTR_SEQ15_GSM); --GSM +1
			if (subseqGLD >= 3) then
				seq015_endSequence(player, quest);
			end
		else 
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
			player:EndEvent();
			return;
		end
	elseif (classId == LULUTSU) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
	elseif (classId == ABYLGO_HAMYLGO) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_3");
	elseif (classId == PAPAWA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_4");
	elseif (classId == FRUHYBOLG) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_5");
	elseif (classId == SWERDAHRM) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_6");
	elseif (classId == QMHALAWI) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_7");
	elseif (classId == AGGRIEVED_GLADIATOR) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_8");
    elseif (classId == UNDEFEATED_GLADIATOR) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_9");
	elseif (classId == POORLY_OUTFITTED_GLADIATOR) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_10");
	elseif (classId == DISHEARTENED_GLADIATOR) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_11"); --confirm motion packs, looks like cycling more than one
	end
		
	player:EndEvent();
end

function seq015_endSequence(player, quest)
	callClientFunction(player, "delegateEvent", player, quest, "processEvent025");
	quest:NewNpcLsMsg(1);
	quest:StartSequence(SEQ_045);
end

function getJournalInformation(player, quest)
	return 0, ITEM_VELODYNA_COSMOS, ITEM_COLISEUM_PASS;
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
	local data = quest:GetData();
	local possibleMarkers = {};
	local subseqGLD = data:GetCounter(CNTR_SEQ15_GLD);
	local subseqGSM = data:GetCounter(CNTR_SEQ15_GSM);

    if (sequence == SEQ_000) then
        table.insert(possibleMarkers, MRKR_MOMODI);
	elseif (sequence == SEQ_005) then
		table.insert(possibleMarkers, MRKR_BLACKBRUSH);
    elseif (sequence == SEQ_010) then
        table.insert(possibleMarkers, MRKR_SEQ10_MOMODI);
	elseif (sequence == SEQ_012) then
		table.insert(possibleMarkers, MRKR_SEQ12_MOMODI);
	elseif (sequence == SEQ_015) then
		if (subseqGSM <= 1) then
			table.insert(possibleMarkers, MRKR_GOLDSMITH);
		end
		if (subseqGLD == 0) then
			table.insert(possibleMarkers, MRKR_GLADIATOR);
		elseif (subseqGLD == 1) then
			if (player.CurrentArea.IsPrivate()) then
				table.insert(possibleMarkers, MRKR_GLADIATOR2);
			else
				table.insert(possibleMarkers, MRKR_GLADIATOR);
			end
		elseif (subseqGLD == 2) then
			if (player.CurrentArea.IsPrivate()) then
				table.insert(possibleMarkers, MRKR_GLADIATOR3);
			else
				table.insert(possibleMarkers, MRKR_GLADIATOR);
			end
		end
	elseif (sequence == SEQ_045) then
		table.insert(possibleMarkers, MRKR_LINETTE);
	elseif (sequence == SEQ_050) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_FLHAMMIN);
		else
			table.insert(possibleMarkers, MRKR_LINETTE);
		end
	elseif (sequence == SEQ_057) then
		if (player.CurrentArea.IsPrivate()) then
			if (not data:GetFlag(FLAG_MANIC_EMOTE)) then
				table.insert(possibleMarkers, MRKR_MANIC_MINER);
			end
			if (not data:GetFlag(FLAG_MADDENED_EMOTE)) then
				table.insert(possibleMarkers, MRKR_MADDENED_MINER);
			end
		else
			table.insert(possibleMarkers, MRKR_LINETTE);
		end
	elseif (sequence == SEQ_058) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_FLHAMMIN2);
		else
			table.insert(possibleMarkers, MRKR_LINETTE);
		end
	elseif (sequence == SEQ_060) then
		table.insert(possibleMarkers, MRKR_NALD_GATE);
	elseif (sequence == SEQ_065) then
		table.insert(possibleMarkers, MRKR_BLACKBRUSH);
	elseif (sequence == SEQ_070) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_ASCILLIA2);
		else
			table.insert(possibleMarkers, MRKR_NALD_GATE);
		end
	elseif (sequence == SEQ_080) then
		table.insert(possibleMarkers, MRKR_MINERS)
	elseif (sequence == SEQ_090) then
		table.insert(possibleMarkers, MRKR_NOGELOIX)
	elseif (sequence == SEQ_095) then
		table.insert(possibleMarkers, MRKR_DOOR2)
	elseif (sequence == SEQ_100) then
		if (player.CurrentArea.IsPublic() and player.CurrentArea.ZoneId != 180) then
			table.insert(possibleMarkers,MRKR_NOGELOIX);
		end
	elseif (sequence == SEQ_105) then
		if (player.CurrentArea.IsPublic() and player.CurrentArea.ZoneId != 180) then
			table.insert(possibleMarkers,MRKR_NOGELOIX);
		end
	elseif (sequence == SEQ_110) then
		table.insert(possibleMarkers, MRKR_MOMODI_END)
    end
    return unpack(possibleMarkers)

end