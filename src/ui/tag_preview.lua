local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local bling = require("src.modules.bling")

bling.widget.tag_preview.enable({
	show_client_content = true,
	scale = 0.25,
	honor_padding = true,
	honor_workarea = true,
	placement_fn = function(c)
		awful.placement.top_left(c, {
			margins = {
				top = beautiful.useless_gap * 2,
				left = beautiful.bar_height + beautiful.useless_gap * 2,
			},
		})
	end,
	background_widget = wibox.widget({
		image = wallpaper,
		horizontal_fit_policy = "fit",
		vertical_fit_policy = "fit",
		widget = wibox.widget.imagebox,
	}),
})
