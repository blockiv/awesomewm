-- Awesome Libs
local awful = require("awful")
local gears = require("gears")

return gears.table.join(
    awful.button({ }, 1, function (c)
        c:activate { context = "mouse_click" }
    end),
    awful.button({ "Mod4" }, 1, function (c)
        c:activate { context = "mouse_click", action = "mouse_move"  }
    end),
    awful.button({ "Mod4" }, 3, function (c)
        c:activate { context = "mouse_click", action = "mouse_resize"}
    end)
)
