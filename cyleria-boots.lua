local newboots = 9018
local wornboots = 9020

local repair = macro(10*1000, function()
    if not g_game.isOnline() then return end
    if getFeet() and getFeet():getId() == wornboots then 
        say("!cyleria boots") 
    end
end)

addIcon("cyleria boots", {item={id = newboots}, movable=true}, function(icon, isOn)
    repair.setOn(isOn)
end)
