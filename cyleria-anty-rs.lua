-- anty RS
local fragsName = 'antyRsFragsName'
if not storage[fragsName] then storage[fragsName] = { value = 0} end

onTextMessage(function(mode, text)
 if string.find(text, "Warning! The murder") then
    frags = frags + 1
end
end)

local multiTargetSpell = 'ultimate power'
local singleTargetSpell = 'inception'
local distance = 2
local amountOfMonsters = 2
local fragLimit = 3

macro(1000, "Anty RS",  function()
    local isSafe = true;
    local specAmount = 0
    if not g_game.isAttacking() then
        return
    end
    for i,mob in ipairs(getSpectators()) do
        if (getDistanceBetween(player:getPosition(), mob:getPosition())  <= distance and mob:isMonster())  then
            specAmount = specAmount + 1
        end
        if (mob:isPlayer() and player:getName() ~= mob:getName()) then
            isSafe = false;
        end
    end
    if (specAmount >= amountOfMonsters and ((storage[fragsName].value <= fragLimit) or isSafe)) then
        say(multiTargetSpell)
    else
        say(singleTargetSpell)
    end
end)
