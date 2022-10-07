---@diagnostic disable: lowercase-global
---@diagnostic disable: undefined-global

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local helpers = require("src.helpers")
local dpi = beautiful.xresources.apply_dpi

require("src.ui.bar.calendar")

screen.connect_signal("request::desktop_decoration", function(s)
	-- launcher
	local launcher = helpers.mkbtn({
		image = beautiful.launcher_icon,
		forced_height = dpi(16),
		forced_width = dpi(16),
		halign = "center",
		valign = "center",
		widget = wibox.widget.imagebox,
	}, beautiful.black, beautiful.dimblack)

	local launcher_tooltip = helpers.make_popup_tooltip("Search Applications", function(d)
		return awful.placement.bottom_left(d, {
			margins = {
				bottom = beautiful.bar_height + beautiful.useless_gap * 2,
				left = beautiful.useless_gap * 2,
			},
		})
	end)

	launcher_tooltip.attach_to_object(launcher)

	launcher:add_button(awful.button({}, 1, function()
		launcher_tooltip.hide()
		awful.spawn("rofi -show drun")
	end))

	-- tags
	local get_tags = require("src.ui.bar.tags")
	local taglist = get_tags(s)

	--tasks
	local get_tasks = require("src.ui.bar.tasks")
	local tasklist = get_tasks(s)

	-- time
	local clock = wibox.widget({
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox,
	})

	gears.timer({
		timeout = 10,
		autostart = true,
		call_now = true,
		callback = function()
			clock.markup = os.date("%H\n%M")
		end,
	})

	clock:connect_signal("mouse::enter", function()
		awesome.emit_signal("calendar::visibility", true)
	end)

	clock:connect_signal("mouse::leave", function()
		awesome.emit_signal("calendar::visibility", false)
	end)

	local base_layoutbox = awful.widget.layoutbox({
		screen = s,
	})

	-- remove built-in tooltip
	base_layoutbox._layoutbox_tooltip:remove_from_object(base_layoutbox)

	-- create button container
	local layoutbox = helpers.mkbtn(base_layoutbox, beautiful.black, beautiful.dimblack)

	-- capitalize layout name
	local function layoutname()
		return "Layout: " .. helpers.capitalize(awful.layout.get(s).name)
	end

	-- make custom tooltip for the whole button
	local layoutbox_tooltip = helpers.make_popup_tooltip(layoutname(), function(d)
		return awful.placement.bottom_right(d, {
			margins = {
				bottom = beautiful.bar_height + beautiful.useless_gap * 2,
				right = beautiful.useless_gap * 2,
			},
		})
	end)

	layoutbox_tooltip.attach_to_object(layoutbox)

	-- update tooltip content
	local update_content = function()
		layoutbox_tooltip.widget.text = layoutname()
	end

	tag.connect_signal("property::layout", update_content)
	tag.connect_signal("property::selected", update_content)

	-- layoutbox buttons
	helpers.add_buttons(layoutbox, {
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(1)
		end),
	})

	local function mkcontainer(template)
		return wibox.widget({
			template,
			left = dpi(8),
			right = dpi(8),
			top = dpi(6),
			bottom = dpi(6),
			widget = wibox.container.margin,
		})
	end

	s.mywibox = awful.wibar({
		position = "left",
		margins = beautiful.useless_gap,
		width = beautiful.bar_height,
		height = s.geometry.height - beautiful.useless_gap * 4,
		shape = gears.shape.rounded_rect,
		screen = s,
	})

	s.mywibox:setup({
		{
			layout = wibox.layout.align.vertical,
			{
				{
					mkcontainer({
						launcher,
						taglist,
						spacing = dpi(12),
						layout = wibox.layout.fixed.vertical,
					}),
					widget = wibox.container.margin,
				},
				layout = wibox.layout.fixed.vertical,
			},
			nil,
			{
				mkcontainer({
					clock,
					layoutbox,
					spacing = dpi(8),
					layout = wibox.layout.fixed.vertical,
				}),
				layout = wibox.layout.fixed.vertical,
			},
		},
		{
			mkcontainer({
				tasklist,
				layout = wibox.layout.fixed.vertical,
			}),
			halign = "center",
			widget = wibox.widget.margin,
			layout = wibox.container.place,
		},
		layout = wibox.layout.stack,
	})
end)
