macro(1000, "Target spell", function()
    local targetspell = 'inception'
    if g_game.getAttackingCreature() then
        say(targetspell)
    end
end)
