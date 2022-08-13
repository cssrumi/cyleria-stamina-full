macro(10*1000, "Stamina doll at 14h", function()
    local minimalStamina = 60*14
    local staminadollId = 3209
    stamina = g_game.getLocalPlayer():getStamina()
    if stamina < minimalStamina then use(staminadollId) end
end)
