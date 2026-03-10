require ("global")
require ("quest")

--[[
Quest Script

Name:   Sundered Skies 
Code:   Man0g0
Id:     110005
Prereq: None (Given on chara creation)
]]

-- Sequence Numbers
SEQ_000 = 0;  -- Intro with Yda & Papalymo
SEQ_005 = 5;  -- Combat tutorial
SEQ_010 = 10; -- Gridania section

-- Actor Class Ids
YDA                 = 1000009;
PAPALYMO            = 1000010;
YDA_COMBAT          = 2290006;
PAPALYMO_COMBAT     = 2290005;

FARRIMOND           = 1000017;
CECILIA             = 1000683;
SWETHYNA            = 1000680;
TKEBBE              = 1000876;
LONSYGG             = 1000951;
PUSH_ADV_GUILD      = 1099046;
BLOCKER1            = 1099047;

-- Non-interactive NPCs
GUILD_ANENE         = 1000427;
GUILD_SYLBERT       = 1000428; -- No source
GUILD_HONGA_VUNGA   = 1000429;
GUILD_NONCO_MENANCO = 1000430;
GUILD_LTANDHAA      = 1000431;
GUILD_POFUFU        = 1000432;
GUILD_ODILIE        = 1000434; -- No source
GUILD_BASEWIN       = 1000435; -- No source
GUILD_SEIKFRAE      = 1000436; -- No source
GUILD_EDASSHYM      = 1000437;
GUILD_TIERNEY       = 1000456;
GUILD_GONTRANT      = 1000457;
GUILD_VKOROLON      = 1000458;
GUILD_EMONI         = 1001183;
GUILD_GYLES         = 1001184;
GUILD_PENELOPE      = 1700001; -- No source

-- Quest Markers
MRKR_LONSYGG        = 11000501;  -- Obsolete.  Pre-1.19 location for this npc
MRKR_YDA            = 11000502;
MRKR_PAPALYMO       = 11000503;
MRKR_GUILD          = 11000504;

-- Quest Flags
FLAG_SEQ000_MINITUT0        = 0; -- Talked to Yda.
FLAG_SEQ000_MINITUT1        = 1; -- Talked to Papalymo.
FLAG_SEQ000_MINITUT2        = 2; -- Talked to Yda again.
FLAG_SEQ000_TARGET_STARTED  = 3; -- Target tutorial has been started (prevents double-click talk hard-lock)

FLAG_SEQ010_TKEBBE          = 0; -- Talked to T'kebbe (optional)


function onStart(player, quest)
    quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
    local data = quest:GetData();

    if (sequence == SEQ_000) then
        local ydaCanPush = not data:GetFlag(FLAG_SEQ000_MINITUT0);
        local ydaFlag = QFLAG_TALK;
        local papalymoFlag = (not data:GetFlag(FLAG_SEQ000_MINITUT1) and data:GetFlag(FLAG_SEQ000_MINITUT0) and QFLAG_TALK or QFLAG_NONE);

        if (not data:GetFlag(FLAG_SEQ000_MINITUT0)) or (data:GetFlag(FLAG_SEQ000_MINITUT1)) then
            ydaFlag = QFLAG_TALK;
        else
            ydaFlag = QFLAG_NONE;
        end        
        
        --SetENpc(classId, byte flagType=0, isTalkEnabled, isPushEnabled, isEmoteEnabled, isSpawned)
        quest:SetENpc(YDA, ydaFlag, true, ydaCanPush);
        quest:SetENpc(PAPALYMO, papalymoFlag);
    elseif (sequence == SEQ_010) then      
        local tkebbeTalk = (not data:GetFlag(FLAG_SEQ010_TKEBBE) and QFLAG_TALK or QFLAG_NONE);       
        quest:SetENpc(FARRIMOND);
        quest:SetENpc(CECILIA);
        quest:SetENpc(SWETHYNA);
        quest:SetENpc(TKEBBE, tkebbeTalk);
        quest:SetENpc(LONSYGG);
        quest:SetENpc(BLOCKER1, QFLAG_NONE, false, true);
        quest:SetENpc(PUSH_ADV_GUILD, QFLAG_PUSH, false, true);        
    end
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();

    if (sequence == SEQ_000) then
        seq000_onTalk(player, quest, npc, classId);
    elseif (sequence == SEQ_010) then
        seq010_onTalk(player, quest, npc, classId);
    end
    quest:UpdateENPCs();
end

function onPush(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    local data = quest:GetData();
    
    if (sequence == SEQ_000) then
        if (classId == YDA) then        
            if (not data:GetFlag(FLAG_SEQ000_TARGET_STARTED)) then
                callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal002");
                data:SetFlag(FLAG_SEQ000_TARGET_STARTED);
                player:EndEvent();
            end
        end
    elseif (sequence == SEQ_010) then
        if (classId == BLOCKER1) then  
            callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml001");
            GetWorldManager():DoPlayerMoveInZone(player, 109.966, 7.559, -1206.117, -2.7916, 0x11)
            player:EndEvent();        
        elseif (classId == PUSH_ADV_GUILD) then 
            player:ReplaceQuest(quest, "Man0g1");
            return;
        end
    end
    quest:UpdateENPCs();
	player:EndEvent();
end

function onNotice(player, quest, target)
    callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal001withHQ");

    player:EndEvent();
    quest:UpdateENPCs();
end

function seq000_onTalk(player, quest, npc, classId)
    local data = quest:GetData();

    if (classId == YDA) then
        if (not data:GetFlag(FLAG_SEQ000_TARGET_STARTED)) then
            player:EndEvent();
            return;
        end
        if (not data:GetFlag(FLAG_SEQ000_MINITUT0)) then -- If Talk tutorial
            callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal003");
            data:SetFlag(FLAG_SEQ000_MINITUT0); -- Disable Yda's PushEvent and set up Papalymo
        elseif (data:GetFlag(FLAG_SEQ000_MINITUT1)) then -- If Talked to after Papaylmo 
            doContentArea(player, quest, npc); -- Set up Combat Tutorial
        else
            callClientFunction(player, "delegateEvent", player, quest, "processEvent000_3");
        end
    elseif (classId == PAPALYMO) then
        if (data:GetFlag(FLAG_SEQ000_MINITUT0)) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
            data:SetFlag(FLAG_SEQ000_MINITUT1);
        else
            callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
        end
    end 
    player:EndEvent();
end

function seq010_onTalk(player, quest, npc, classId)
    local data = quest:GetData();

    if (classId == SWETHYNA) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");    
    elseif (classId == CECILIA) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
    elseif (classId == FARRIMOND) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent020_4");
    elseif (classId == TKEBBE) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent020_5");   
        data:SetFlag(FLAG_SEQ010_TKEBBE);
    elseif (classId == LONSYGG) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent020_6");
    end
    player:EndEvent();
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    local possibleMarkers = {};
    local data = quest:GetData();

    if (sequence == SEQ_000) then
        
        if (not data:GetFlag(FLAG_SEQ000_MINITUT0)) or (data:GetFlag(FLAG_SEQ000_MINITUT1))  then 
            table.insert(possibleMarkers, MRKR_YDA); 
        end
        
        if (data:GetFlag(FLAG_SEQ000_MINITUT0)) and (not data:GetFlag(FLAG_SEQ000_MINITUT1)) then
            table.insert(possibleMarkers, MRKR_PAPALYMO);
        end    
       
    elseif (sequence == SEQ_010) then
        table.insert(possibleMarkers, MRKR_GUILD);
    end

    return unpack(possibleMarkers)
end

function doContentArea(player, quest, npc)
    quest:GetData():ClearData();
    quest:StartSequence(SEQ_005);    
    contentArea = player.CurrentArea:CreateContentArea(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man0g01", "SimpleContent30010", "Quest/QuestDirectorMan0g001");
   
    if (contentArea == nil) then
        return;
    end

    director = contentArea:GetContentDirector();
    player:AddDirector(director);
    director:StartDirector(false);

    player:KickEvent(director, "noticeEvent", true);
    player:SetLoginDirector(director);

    GetWorldManager():DoZoneChangeContent(player, contentArea, 362.4087, 4, -703.8168, 1.5419, 16);
    return;
end
