---@diagnostic disable: undefined-global

-- Standard Awesome library
local awful = require("awful")
local bling = require("modules.bling")

-- Custom layouts
local centered = bling.layout.centered

-- Set the layouts
tag.connect_signal("request::default_layouts", function ()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        centered,
        awful.layout.suit.floating
    })
end)
