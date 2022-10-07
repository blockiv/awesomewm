-- Standard awesome library
local awful = require("awful")
local menu = require("src.ui.menu")

awful.mouse.append_global_mousebindings({
    awful.button({}, 3, function() menu.mainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewprev),
    awful.button({}, 5, awful.tag.viewnext),
})
