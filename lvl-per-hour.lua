
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
