macro(10*1000, "Stamina doll at 40h", function()
    local minimalStamina = 60*40
    local staminadollId = 3209
    stamina = g_game.getLocalPlayer():getStamina()
    if stamina < minimalStamina then use(staminadollId) end
end)
