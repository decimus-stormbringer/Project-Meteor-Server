require("global");

local initClassItems, initRaceItems;

function onBeginLogin(player)		
	-- New character, set the initial quest
	if (player:GetPlayTime(false) == 0) then
		initialTown = player:GetInitialTown();
		if (initialTown == 1 and player:HasQuest(110001) == false) then
			player:AddQuest(110001);
			player:SetHomePoint(1280001);
		elseif (initialTown == 2 and player:HasQuest(110005) == false) then
			player:AddQuest(110005);
			player:SetHomePoint(1280061);
		elseif (initialTown == 3 and player:HasQuest(110009) == false) then
			player:AddQuest(110009);
			player:SetHomePoint(1280031);
		end		
		
	end
	
	-- Set Dream Packet if waking up in the inn
	if (player.CurrentArea.ZoneId == 244) then
		local dreamCode = 35;
	
		-- In Plain Sight wakeup dream
		if (player:HasItem(10011243) and not player:HasQuest(110829)) then
			dreamCode = 1;
		-- The Usual Suspect wakeup dream
		elseif (player:HasItem(10011252) and not player:HasQuest(110849)) then
			dreamCode = 2;
		-- Nael Van Darnus nightmare
		--elseif (player:???) then -- Kill these to prevent lua error
			dreamCode = 20;
		-- Random item
		--elseif (player:???) then  -- Kill these to prevent lua error
			dreamCode = math.random(21, 33);
		end
		
		player:SetLoginDreamCode(dreamCode);
	end

	-- For Opening. Set Director and reset position incase d/c
	if (player:HasQuest(110001) == true and player.CurrentArea.ZoneId == 193) then
		director = player.CurrentArea:CreateDirector("OpeningDirector", false);		
		player:AddDirector(director);
		director:StartDirector(true);
		player:SetLoginDirector(director);
		player:KickEvent(director, "noticeEvent", true);
		player.positionX = 0.016;
		player.positionY = 10.35;
		player.positionZ = -36.91;
		player.rotation = 0.025;
		player:GetQuest(110001):GetData():ClearData();
	elseif (player:HasQuest(110005) == true and player.CurrentArea.ZoneId == 166) then 
		director = player.CurrentArea:CreateDirector("OpeningDirector", false);
		player:AddDirector(director);
		director:StartDirector(false);
		player:SetLoginDirector(director);
		player:KickEvent(director, "noticeEvent", true);	
		player.positionX = 369.5434;
		player.positionY = 4.21;
		player.positionZ = -706.1074;
		player.rotation = -1.26721;
		player:GetQuest(110005):GetData():ClearData();
	elseif (player:HasQuest(110009) == true and player.CurrentArea.ZoneId == 184) then
		director = player.CurrentArea:CreateDirector("OpeningDirector", false);
		player:AddDirector(director);
		director:StartDirector(true);
		player:SetLoginDirector(director);
		player:KickEvent(director, "noticeEvent", true);
		player.positionX = 5.364327;
		player.positionY = 196.0;
		player.positionZ = 133.6561;
		player.rotation = -2.849384;
		player:GetQuest(110009):GetData():ClearData();
	end
end

function onLogin(player)

	if (player:GetPlayTime(false) == 0) then
		player:SendMessage(0x1D,"",">PlayTime == 0, new player!");
		
		initClassItems(player);
		initRaceItems(player);	
		--player:GetItemPackage(0):AddItems({4040001, 8011001, 8050621, 8070346, 8090307});
		--player:GetEquipment():Set({0, 8, 12, 13, 15},{0, 1, 2, 3, 4},0);
		player:RecalculateStats();
		player:SavePlayTime();		
	end	
	
	player.HPP = 100;
	player.MPP = 100;
	player.TPP = 0;
	player:RecalculateStats();
end

function initClassItems(player)

	local slotTable;
	local invSlotTable;

	--DoW	
	if (player.GetClass() == CLASSID_PUG) then 		--PUG
		player:GetItemPackage(0):AddItems({4020001, 8030701, 8050728, 8080601, 8090307});
		player:GetEquipment():Set({0, 10, 12, 14, 15},{0, 1, 2, 3, 4},0);
	elseif (player.GetClass() == CLASSID_GLA) then	--GLA
		player:GetItemPackage(0):AddItems({4030010, 8031120, 8050245, 8080601, 8090307});
		player:GetEquipment():Set({0, 10, 12, 14, 15},{0, 1, 2, 3, 4},0);
	elseif (player.GetClass() == CLASSID_MRD) then	--MRD
		player:GetItemPackage(0):AddItems({4040001, 8011001, 8050621, 8070346, 8090307});
		player:GetEquipment():Set({0, 8, 12, 13, 15},{0, 1, 2, 3, 4},0);
	elseif (player.GetClass() == CLASSID_ARC) then	--ARC
		player:GetItemPackage(0):AddItems({4070001, 8030601, 8050622, 8080601, 8090307});
		player:GetEquipment():Set({0, 10, 12, 14, 15},{0, 1, 2, 3, 4},0);
	elseif (player.GetClass() == CLASSID_LNC) then	--LNC
		player:GetItemPackage(0):AddItems({4080201, 8030801, 8051015, 8080501, 8090307});
		player:GetEquipment():Set({0, 10, 12, 14, 15},{0, 1, 2, 3, 	4},0);
	--DoM	
	elseif (player.GetClass() == CLASSID_THM) then	--THM
		player:GetItemPackage(0):AddItems({5020001, 8030245, 8050346, 8080346, 8090208});
		player:GetEquipment():Set({0, 10, 12, 14, 15},{0, 1, 2, 3, 4},0);
	elseif (player.GetClass() == CLASSID_CNJ) then	--CNJ
		player:GetItemPackage(0):AddItems({5030101, 8030445, 8050031, 8080246, 8090208});
		player:GetEquipment():Set({0, 10, 12, 14, 15},{0, 1, 2, 3, 4},0);
		
	--DoH
	elseif (player.GetClass() == CLASSID_CRP) then	-- CRP
	elseif (player.GetClass() == CLASSID_BSM) then	-- BSM
	elseif (player.GetClass() == CLASSID_ARM) then	-- ARM
	elseif (player.GetClass() == CLASSID_GSM) then	-- GSM
	elseif (player.GetClass() == CLASSID_LTW) then	-- LTW
	elseif (player.GetClass() == CLASSID_WVR) then	-- WVR
	elseif (player.GetClass() == CLASSID_ALC) then	-- ALC
	elseif (player.GetClass() == CLASSID_CUL) then	-- CUL
	
	--DoL
	elseif (player.GetClass() == CLASSID_MIN) then	--MIN
	elseif (player.GetClass() == CLASSID_BTN) then	--BTN	
	elseif (player.GetClass() == CLASSID_FSH) then	--FSH
	end
	
end

function initRaceItems(player)

	if (player.playerWork.tribe == 1) then		--Hyur Midlander Male
		player:GetItemPackage(0):AddItem(8040001);
		player:GetItemPackage(0):AddItem(8060001);
	elseif (player.playerWork.tribe == 2) then	--Hyur Midlander Female
		player:GetItemPackage(0):AddItem(8040002);
		player:GetItemPackage(0):AddItem(8060002);
	elseif (player.playerWork.tribe == 3) then	--Hyur Highlander Male
		player:GetItemPackage(0):AddItem(8040003);
		player:GetItemPackage(0):AddItem(8060003);
	elseif (player.playerWork.tribe == 4) then	--Elezen Wildwood Male
		player:GetItemPackage(0):AddItem(8040004);
		player:GetItemPackage(0):AddItem(8060004);
	elseif (player.playerWork.tribe == 5) then	--Elezen Wildwood Female
		player:GetItemPackage(0):AddItem(8040006);
		player:GetItemPackage(0):AddItem(8060006);
	elseif (player.playerWork.tribe == 6) then	--Elezen Duskwight Male
		player:GetItemPackage(0):AddItem(8040005);
		player:GetItemPackage(0):AddItem(8060005);
	elseif (player.playerWork.tribe == 7) then	--Elezen Duskwight Female
		player:GetItemPackage(0):AddItem(8040007);
		player:GetItemPackage(0):AddItem(8060007);
	elseif (player.playerWork.tribe == 8) then	--Lalafell Plainsfolk Male
		player:GetItemPackage(0):AddItem(8040008);
		player:GetItemPackage(0):AddItem(8060008);
	elseif (player.playerWork.tribe == 9) then	--Lalafell Plainsfolk Female
		player:GetItemPackage(0):AddItem(8040010);
		player:GetItemPackage(0):AddItem(8060010);
	elseif (player.playerWork.tribe == 10) then	--Lalafell Dunesfolk Male
		player:GetItemPackage(0):AddItem(8040009);
		player:GetItemPackage(0):AddItem(8060009);
	elseif (player.playerWork.tribe == 11) then	--Lalafell Dunesfolk Female
		player:GetItemPackage(0):AddItem(8040011);
		player:GetItemPackage(0):AddItem(8060011);
	elseif (player.playerWork.tribe == 12) then	--Miqo'te Seekers of the Sun
		player:GetItemPackage(0):AddItem(8040012);
		player:GetItemPackage(0):AddItem(8060012);
	elseif (player.playerWork.tribe == 13) then	--Miqo'te Seekers of the Moon
		player:GetItemPackage(0):AddItem(8040013);
		player:GetItemPackage(0):AddItem(8060013);
	elseif (player.playerWork.tribe == 14) then	--Roegadyn Sea Wolf
		player:GetItemPackage(0):AddItem(8040014);
		player:GetItemPackage(0):AddItem(8060014);
	elseif (player.playerWork.tribe == 15) then	--Roegadyn Hellsguard
		player:GetItemPackage(0):AddItem(8040015);
		player:GetItemPackage(0):AddItem(8060015);
	end

	player:GetEquipment():Set({9,11},{5,6}, 0);
	
end