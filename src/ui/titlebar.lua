local awful = require("awful")
local wibox = require("wibox")

client.connect_signal("request::titlebars", function(c)
	local titlebar = awful.titlebar(c, {
		position = "top",
		size = "40",
	})

	local titlebar_buttons = {
		awful.button({}, 1, function()
			c:activate({
				context = "titlebar",
				action = "mouse_move",
			})
		end),
		awful.button({}, 3, function()
			c:activate({
				context = "titlebar",
				action = "mouse_resize",
			})
		end),
	}

	local buttons_loader = {
		layout = wibox.layout.fixed.horizontal,
		buttons = titlebar_buttons,
	}

	local function pad_button(button, margin)
		margin = margin or {
			top = 13,
			bottom = 13,
			left = 4,
			right = 4,
		}

		return wibox.widget({
			button,
			top = margin.top,
			bottom = margin.bottom,
			left = margin.left,
			right = margin.right,
			widget = wibox.container.margin,
		})
	end

	titlebar:setup({
		{
			pad_button(awful.titlebar.widget.closebutton(c), {
				top = 13,
				bottom = 13,
				right = 4,
				left = 14,
			}),
			pad_button(awful.titlebar.widget.maximizedbutton(c)),
			pad_button(awful.titlebar.widget.minimizebutton(c)),
			layout = wibox.layout.fixed.horizontal,
		},
		buttons_loader,
		buttons_loader,
		layout = wibox.layout.align.horizontal,
	})
end)
