local awful = require("awful")

-- Tags
screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table
    local names = { "一", "二", "三", "四", "五", "六", "七", "八", "九" }
    
    awful.tag(names, s, awful.layout.layouts[1])
end)
