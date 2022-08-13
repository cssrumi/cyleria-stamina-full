local uiIgPerHour = setupUI([[
Panel
  size: 14 14
  anchors.horizontalCenter: parent.horizontalCenter
  anchors.bottom: prev.top
  margin-top: 120

  Label
    id: IgPerHour
    color: red
    font: verdana-11px-rounded
    height: 14
    text-auto-resize: true
    !text: tr('ig/h')

]], modules.game_interface.getMapPanel())
-- uiIgPerHour:hide()

local idgi = 9058 -- ID GI
local igMaxCountAmount = 30
local igCounts = {}
local lastCount = 0

macro(30*1000, function()
    itemCount = itemAmount(idgi)
    if lastCount == 0 then lastCount = itemCount end
    table.insert(igCounts, 1, itemCount - lastCount)
    lastCount = itemCount
    if table.getn(igCounts) > igMaxCountAmount then
        table.remove(igCounts)
    end
    sum = 0
    for _, v in pairs(igCounts) do
        sum = sum + v
    end
    iph = 2 * 60 * sum / table.getn(igCounts)
    uiIgPerHour.IgPerHour:setText(string.format("%.2f", iph) .. ' ig/h')
end)
