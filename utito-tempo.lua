local utito = macro(500, "UTITO TEMPO",  function() 
    if not hasPartyBuff() and player:getHealth() > 90 then
        say("utito tempo")
    end
end)
