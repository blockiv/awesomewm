---@diagnostic disable: redefined-local
---@diagnostic disable: unused-local
---@diagnostic disable: undefined-global

local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")
local animation = require("src.modules.animation")

-- Enable tag previews
local function enable_tag_preview(self, c3)
	self:connect_signal("mouse::enter", function()
		if #c3:clients() > 0 then
			awesome.emit_signal("bling::tag_preview::update", c3)
			awesome.emit_signal("bling::tag_preview::visibility", s, true)
		end
	end)
	self:connect_signal("mouse::leave", function()
		awesome.emit_signal("bling::tag_preview::visibility", s, false)
	end)
end

local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewprev(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewnext(t.screen)
	end)
)

local function get_taglist(s)
	return awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		layout = { layout = wibox.layout.fixed.vertical },
		buttons = taglist_buttons,
		widget_template = {
			widget = wibox.container.margin,
			forced_width = dpi(40),
			forced_height = dpi(30),
			create_callback = function(self, c3, _)
				enable_tag_preview(self, c3)
				local indicator = wibox.widget({
					widget = wibox.container.place,
					valign = "center",
					{
						widget = wibox.container.background,
						forced_width = dpi(8),
						shape = gears.shape.rounded_bar,
					},
				})
				wibox.container.rotate(indicator)

				self.indicator_animation = animation:new({
					duration = 0.125,
					easing = animation.easing.linear,
					update = function(self, pos)
						indicator.children[1].forced_height = pos
					end,
				})

				self:set_widget(indicator)

				if c3.selected then
					self.widget.children[1].bg = beautiful.blue
					self.indicator_animation:set(dpi(32))
				elseif #c3:clients() == 0 then
					self.widget.children[1].bg = beautiful.bg_lighter
					self.indicator_animation:set(dpi(8))
				else
					self.widget.children[1].bg = beautiful.dimblack
					self.indicator_animation:set(dpi(16))
				end
			end,
			update_callback = function(self, c3, _)
				if c3.selected then
					self.widget.children[1].bg = beautiful.blue
					self.indicator_animation:set(dpi(32))
				elseif #c3:clients() == 0 then
					self.widget.children[1].bg = beautiful.bg_lighter
					self.indicator_animation:set(dpi(8))
				else
					self.widget.children[1].bg = beautiful.dimblack
					self.indicator_animation:set(dpi(16))
				end
			end,
		},
	})
end

return get_taglist
