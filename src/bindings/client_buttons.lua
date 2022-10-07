-- Awesome Libs
local awful = require("awful")
local gears = require("gears")
local mod = modkey

return gears.table.join(
	awful.button({}, 1, function(c)
		c:activate({ context = "mouse_click" })
	end),
	awful.button({ mod }, 1, function(c)
		c:activate({ context = "mouse_click", action = "mouse_move" })
	end),
	awful.button({ mod }, 3, function(c)
		c:activate({ context = "mouse_click", action = "mouse_resize" })
	end)
)
