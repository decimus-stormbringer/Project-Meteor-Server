require ("global")
require ("quest")

function onTrigger(player, quest)
    -- Fetch the completed quest list from C#
    local completedQuests = player:GetCompletedQuestNames()

    -- Handle empty quest list
    if completedQuests == nil or #completedQuests == 0 then
        player:SendMessage(0x20, "", "You have not completed any quests.")
        return
    end

    -- Header
    player:SendMessage(0x20, "", "=== Completed Quests ===")

    -- Loop through each completed quest and display it
    for i, questDisplayString in ipairs(completedQuests) do
        -- questDisplayString is in the format "QuestID -- QuestName"
        player:SendMessage(0x20, "", questDisplayString)
    end

    -- Footer
    player:SendMessage(0x20, "", "========================")
end