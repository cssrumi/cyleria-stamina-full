onTextMessage(function(mode, text)
    if string.find(text, "You are dead.") then
        doScreenshot("/screenshots/"..player:getName().. " - Death " ..os.date('%Y-%m-%d, %H.%M.%S').. ".png")
        return
    end
end)
