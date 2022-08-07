local idgi = 9058 -- ID GI
local igcounts  = 200 -- ILOSC GI
local staminaMinCap = 200

macro(100, "STAMINAFULL COMMAND", function()
    itemCount = 0
    for _, container in pairs(getContainers()) do
        for _, item in pairs(container:getItems()) do
            if item:getId() == idgi then
                itemCount = itemCount + item:getCount()
           end 
       end
    end

    if itemCount and itemCount >= igcounts and freecap() >= staminaMinCap then
        say("!staminafull")
        delay(10000)
    end
end)
