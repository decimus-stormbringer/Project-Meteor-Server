require ("global")
--[[

Quest Script

Name: 	Small Talk
Code: 	DftRoc
Id: 	110544

Contains all default lines for talkable npcs in the Roc Region (aka Coerthas).
* NOTE: This quest is active for all players at all times.
]]

--[[

Motion Ids & Notes

Mildthryth		Needs Motion Pack
Deryk			0
Tarok Magurok	Needs Motion Pack
N'Canago		0
Claudien	`	0
Sidonia			Needs Motion Pack
Liflin Gulin	Needs Motion Pack		>>NeedsQuestMarker<<
Alberic			Needs Motion Pack		>>NeedsQuestMarker<< quest, Eye of the Dragon, Error 4000(4) OnPush
Hourlinet		0
OrteFauchel		0
Skaetlorh		Needs Motion Pack
Fawkes			Needs Motion Pack
Paul			Needs Motion Pack
Panha Jaab		Needs Motion Pack
Frine			Needs Motion Pack
Momoroto		Needs Motion Pack
Jijiri			Needs Motion Pack
Seghuie			0
Folcard			0
Firmien			Needs Motion Pack
Ndha Jakkya		Needs Motion Pack
Shulolo			Needs Motion Pack
Poponagu		Needs Motion Pack
Mhustym			0
Lycelle			0
Kleytai			0
Zwelfhyll		0
Synnove			0
Armantel		0
Iliette			0
Gaetelle		0
Rickeman		0
Hubairtien		1016
Quenburga		0
Ermiance		1031
Rawawa			0
Loloma			0
Arscelin		1149					>>NeedsQuestMarker<< quest, A Hypocritical Oath (110707, Etc2i1)
Patrick			0						>>NeedsQuestMarker<< quest, Counting Sheep		(110706, Etc2i0)
Bubudoga		2031
Janlenoux		1016
Amianne			1016
Fyrloug			0
Odeve			Needs Motion Pack
Emerissel		Needs Motion Pack
Elde			1002
Widigast		Needs Motion Pack
Wowotazi		1017
Ladislas		1016
Hersande		0
Dyrsweitz		Needs Motion Pack
Tristechambel	0						Error 4000(4) OnPush
Puroro			1016
Diego Athral	0						Levequest, Golden Opportunity, Error 4000(4) OnPush
]]

-- [ActorClassId] = "client_function_name"
local defaultTalkRoc = {
    [1500078] = "defaultTalkWithMildthryth_001",		--Mildthryth				CampMaster				(Camp Dragonhead)
	[1500104] = "defaultTalkWithDeryk_001",				--Deryk						CampSubMaster			(Camp Dragonhead)
	[1000676] = "defaultTalkWithTarokmagurok_001",		--Tarok Magurok				Pplstd					(Camp Dragonhead)
	[1600063] = "defaultTalkWithNcanago_001",			--N'Canago					ShopSalesman			(Camp Dragonhead)
	[1500239] = "defaultTalkWithClaudien_001",			--Claudien					ItemRepair				(Camp Dragonhead)
	[1000675] = "defaultTalkWithSidonia_001",			--Sidonia					Pplstd					(Camp Dragonhead)
	[1001698] = "defaultTalkWithLiflingulin_001",		--Storm Srgt Liflin Gulin	>>NeedsQuestMarker<<	(Camp Dragonhead)
	--[1002001] = "defaultTalkWithAlberic_001",			--Alberic					>>NeedsQuestMarker<<	(Gates of Judgement)
	[1001500] = "defaultTalkWithHourlinet_001",			--Hourlinet					Pplstd					(Gates of Judgement)
	[1001499] = "defaultTalkWithOrtefauchel_001",		--OrteFauchel				Pplstd					(Gates of Judgement)
	[1500105] = "defaultTalkWithSkaetlorh_001",			--Skaetlorh					CampSubMaster			(Camp Crooked Fork)
	[1600097] = "defaultTalkWithFawkes_001",			--Fawkes					ShopSalesman			(Camp Crooked Fork)
	[1000677] = "defaultTalkWithPaul_001",				--Paul						Pplstd					(Camp Crooked Fork)
	[1500079] = "defaultTalkWithPanhajaab_001",			--Panha Jaab				CampMaster				(Camp Crooked Fork)
	[1500260] = "defaultTalkWithFrine_001",				--Frine						ItemRepair				(Camp Crooked Fork)
	[1500080] = "defaultTalkWithMomoroto_001",			--Momoroto					CampMaster				(Camp Glory)
	[1500106] = "defaultTalkWithJijiri_001",			--Jijiri					CampSubMaster			(Camp Glory)
	[1500246] = "defaultTalkWithSeghuie_001",			--Seghuie					ItemRepair				(Camp Glory)
	[1600130] = "defaultTalkWithFolcard_001",			--Folcard					ShopSalesman			(Camp Glory)
	[1500081] = "defaultTalkWithFirmien_001",			--Firmien					CampMaster				(Camp Ever Lakes)
	[1500107] = "defaultTalkWithNdhajakkya_001",		--Ndha Jakkya				CampSubMaster			(Camp Ever Lakes)
	[1500245] = "defaultTalkWithShulolo_001",			--Shulolo	`				ItemRepair				(Camp Ever Lakes)
	[1600113] = "defaultTalkWithPoponagu_001",			--Poponagu					ShopSalesman			(Camp Ever Lakes)
	[1000678] = "defaultTalkWithMhustym_001",			--Mhustym					Pplstd					(Camp Riversmeet)
	[1500108] = "defaultTalkWithLycelle_001",			--Lycelle					CampSubMaster			(Camp Riversmeet)
	[1500082] = "defaultTalkWithKleytai_001",			--Kleytai					CampMaster				(Camp Riversmeet)
	[1500241] = "defaultTalkWithZwelfhyll_001",			--Zwelfhyll					ItemRepair				(Camp Riversmeet)
	[1600110] = "defaultTalkWithSynnove_001",			--Synnove					ShopSalesman			(Camp Riversmeet)
	[1001368] = "defaultTalkWithArmantel_001",			--Armantel					Pplstd					(Falcon's Nest)
	[1001369] = "defaultTalkWithIliette_001",			--Iliette					Pplstd					(Falcon's Nest)
	[1001366] = "defaultTalkWithGaetelle_001",			--Gaetelle					Pplstd					(Falcon's Nest)
	[1001364] = "defaultTalkWithRickeman_001",			--Rickeman					Pplstd					(Falcon's Nest)
	[1001367] = "defaultTalkWithHubairtien_001",		--Hubairtien				Pplstd					(Falcon's Nest)
	[1001365] = "defaultTalkWithQuenburga_001",			--Quenburga					Pplstd					(Falcon's Nest)
	[1001363] = "defaultTalkWithErmiance_001",			--Ermiance					Pplstd					(Falcon's Nest)
	[1001362] = "defaultTalkWithRawawa_001",			--Rawawa					Pplstd					(Falcon's Nest)
	[1500067] = "defaultTalkWithLoloma_001",			--Loloma					HamletBreeder			(Falcon's Nest)
	[1001574] = "defaultTalkWithArscelin_001",			--Arscelin					>>NeedsQuestMarker<<	(Owls Nest)		 	
	[1001358] = "defaultTalkWithPatrick_001",			--Patrick					>>NeedsQuestMarker<<	(Owls Nest)		 	
	[1000667] = "defaultTalkWithBubudoga_001",			--Bubudoga					Pplstd					(Owls Nest)
	[1001356] = "defaultTalkWithJanlenoux_001",			--Janlenoux					Pplstd					(Owls Nest)
	[1001355] = "defaultTalkWithAmianne_001",			--Amianne					Pplstd					(Owls Nest)
	[1001357] = "defaultTalkWithFyrloug_001",			--Fyrloug					Pplstd					(Owls Nest)
	[1001360] = "defaultTalkWithOdeve_001",				--Odeve						Pplstd					(Owls Nest)
	[1001361] = "defaultTalkWithEmerissel_001",			--Emerissel					Pplstd					(Owls Nest)
	[1001359] = "defaultTalkWithElde_001",				--Elde						Pplstd					(Owls Nest)
	[1001354] = "defaultTalkWithWidigast_001",			--Widigast					Pplstd					(Owls Nest)
	[1001159] = "defaultTalkWithWowotazi_001",			--Wowotazi					Pplstd					(The Fesse Entrance)
	[1001155] = "defaultTalkWithLadislas_001",			--Ladislas					Pplstd					(Hengr's Crucible Entrance)
	[1001156] = "defaultTalkWithHersande_001",			--Hersande					Pplstd					(The Aeyrie Entrance)
	[1001154] = "defaultTalkWithDyrstweitz_001",		--Dyrsweitz					Dungeon					(Dzemael Darkhold Entrance)
	--[1001955] = "defaultTalkWithTristechambel_001",	--Tristechambel				Dungeon					(Aurum Vale Entrance)
	[1001157] = "defaultTalkWithPuroro_001",			--Puroro					Pplstd					(Aurum Vale Blocked Entrance)
	--[1500122] = "defaultTalkWithDiegoathral_001",		--Diego Athral				Levequest				(Outside Camp Riversmeet)
	
}

function onTalk(player, quest, npc, eventName)

    local npcId = npc:GetActorClassId();
    local clientFunc = defaultTalkRoc[npcId];
    
    if (npcId == 1000675) then -- Sidonia - Dragonhead								--PLACEHOLDER
        if (player:IsQuestCompleted(110005)) then -- "Sundered Skies" completed.	-- PLACEHOLDER
            defaultTalkRoc(player, quest);
        else
            callClientFunction(player, "delegateEvent", player, quest, clientFunc);
        end
    else
        callClientFunction(player, "delegateEvent", player, quest, clientFunc);
    end
    
    player:EndEvent();
end

function IsQuestENPC(player, quest, npc)
	return defaultTalkRoc[npc.GetActorClassId()] ~= nil;
end