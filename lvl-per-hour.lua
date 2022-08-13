
-- LOOT SELL --
local lootItemIds = {
["3281"] = "giant sword",
["3420"] = "demon shield",
["3364"] = "golden legs",
["3079"] = "boots of haste",
["3366"] = "magic plate armor",
["3386"] = "dragon scale mail"
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

-- exp gain --
local uiExpPerHour = setupUI([[
Panel
  size: 14 14
  anchors.horizontalCenter: parent.horizontalCenter
  anchors.bottom: prev.top
  margin-top: 80

  Label
    id: ExpPerHour
    color: yellow
    font: verdana-11px-rounded
    height: 14
    text-auto-resize: true
    !text: tr('lvl/h')

]], modules.game_interface.getMapPanel())

-- uiExpPerHour:hide()

local maxGainsCount = 30
local expGains = {}
local gain = 0
local lastLvl = player:getLevel()
local lastLvlPercent = player:getLevelPercent()
lvlPerHourName = "lvlPerHour"
if not storage[lvlPerHourName] then storage[lvlPerHourName] = { value = 0} end

macro(30*1000, function()
    lvlPercent = player:getLevelPercent()
    lvlPercentGain = (lvlPercent - lastLvlPercent + 100) % 100
    local lvl = player:getLevel()
    lvlGain = lvl - lastLvl
    
    gain = lvlPercentGain / 100
    if lvlGain > 1 then
        gain = gain + lvlGain - 1
    end
    lastLvl = lvl
    lastLvlPercent = lvlPercent

    table.insert(expGains, 1, gain)
    if table.getn(expGains) > maxGainsCount then
        table.remove(expGains)
    end
    sum = 0
    for _, v in pairs(expGains) do
        sum = sum + v
    end
    lph = 2 * 60 * sum / table.getn(expGains)
    storage[lvlPerHourName].value = lph
    uiExpPerHour.ExpPerHour:setText(string.format("%.2f", lph) .. ' lvl/h')
end)
