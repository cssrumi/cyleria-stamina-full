-- works only if exp potion is visible in your containers
macro(30*1000, "EXP POTION", function()
    if player:getHealth() < 90 then
        warn('health to low to use exp potion: ' .. player:getHealth())
        delay(1000)
        return
    end
    if player:getMana() < 70 then
        warn('mana to low to use exp potion: ' .. player:getMana())
        delay(1000)
        return
    end
    if storage[lvlPerHourName] and storage[lvlPerHourName].value < 1 then
        warn('lvl per hour is to low to use exp potion: ' .. storage[lvlPerHourName].value)
        return
    end
    for _, container in pairs(g_game.getContainers()) do
        for __, item in ipairs(container:getItems()) do
            if item:getId() == 7440 then
                return g_game.use(item)
            end
        end
    end
    warn('exp potion not found')
    warn('remember that exp potion must be visible to be clickable')
end)
