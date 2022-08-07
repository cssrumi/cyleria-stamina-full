-- LOOT SELL --
local lootItemIds = {
["3281"] = "giant sword",
["3420"] = "demon shield",
["3364"] = "golden legs",
["3079"] = "boots of haste",
["3366"] = "magic plate armor",
["3386"] = "dragon scale mail",
["3320"] = "fire axe",
["3309"] = "thunder hammer",
["3422"] = "great shield",
["3392"] = "royal helmet",
["3414"] = "mastermind shield"
}
local ids={}
local currentIdIdx = 0
local count = 0

for k,_ in pairs(lootItemIds) do
  count=count+1
  ids[count]=k
end

macro(5*1000, "LOOT SELL", function()
    if not g_game.isOnline() then return end
    for idx, id in pairs(ids) do
        if idx <= currentIdIdx then goto skip_to_next end
        currentIdIdx = idx
        found = findItem(id)
        if found then
            say("!sell " .. lootItemIds[id])
            return
        end
        ::skip_to_next::
    end
    currentIdIdx = 0
end)
