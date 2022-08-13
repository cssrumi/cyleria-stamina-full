macro(1000, "SD Target", function()
    if g_game.getAttackingCreature() then
        useWith(3155, g_game.getAttackingCreature())
    end
end)
