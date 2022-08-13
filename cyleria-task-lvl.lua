onTalk(function(name, level, mode, text, channel, pos)
    if string.find(text, "!tasklevel") then
        matched = string.match(text, "%b``")
        tasklevel = string.gsub(matched, "`", '')
        say(tasklevel)   
    end
end)
