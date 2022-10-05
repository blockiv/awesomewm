-- Awesome libs
local awful = require("awful")
local bling = require("modules.bling")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
--[[ local menu = require("config.menu") ]]

--[[ local mod = user_vars.modkey ]]
local mod = "Mod4"
local ctrl = "Control"
local shift = "Shift"

return gears.table.join(
    -- [[ Awesome ]] --
    awful.key({ mod }, "F1", hotkeys_popup.show_help, { description = "Show help", group = "Awesome" }),
    awful.key({ mod, ctrl }, "r", awesome.restart, { description = "Restart Awesome", group = "Awesome" }),
    awful.key({ mod, shift }, "q", awesome.quit, { description = "Quit Awesome", group = "Awesome" }),
    --[[ awful.key({ mod }, "m", menu.show(), { description = "Open Menubar", group = "Launcher" }), ]]

    -- [[ Hardware ]] --
    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +2%")
    end, { description = "Raise volume", group = "Volume" }),
    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -2%")
    end, { description = "Lower volume", group = "Volume" }),
    awful.key({}, "XF86AudioMute", function()
		awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false)
	end, { description = "Mute volume", group = "Volume" }),

    -- [[ Applications ]] --
    awful.key({ mod }, "p", function ()
        awful.spawn("rofi -show drun")
    end, { description = "Open launcher", group = "Launcher" }),
    awful.key({ mod }, "Return", function ()
        awful.spawn(terminal)
    end, { description = "Launch terminal", group = "Apps" }),
    awful.key({ mod }, "w", function ()
        awful.spawn("firefox")
    end, { description = "Open web browser", group = "Apps" }),

    -- [[ Tag related keybindings ]] --
    awful.key({ mod, shift }, "h", awful.tag.viewprev,
        { description = "View previous tag", group = "Tag" }),
    awful.key({ mod, shift }, "l", awful.tag.viewnext,
        { description = "View next tag", group = "Tag" }),
    awful.key({ mod, shift }, "Tab", awful.tag.history.restore,
        { description = "Return to previous tag", group = "Tag" }),

    -- [[ Focus related keybindings ]] --
    awful.key({ mod }, "j", function ()
        awful.client.focus.byidx(1)
        bling.module.flash_focus.flashfocus(client.focus)
    end, { description = "Focus next by index", group = "Client" }),
    awful.key({ mod }, "k", function ()
        awful.client.focus.byidx(-1)
        bling.module.flash_focus.flashfocus(client.focus)
    end, { description = "Focus previous by index", group = "Client" }),
    awful.key({ mod }, "Tab", function ()
        awful.client.focus.history.previous()
        bling.module.flash_focus.flashfocus(client.focus)
    end, { description = "Focus previous client", group = "Client" }),

    -- Restore and focus minimized client
    awful.key({ mod, ctrl }, "n", function ()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            c:activate { raise = true, context = "key.unminimize" }
        end
    end, { description = "Restore minimized client", group = "Client" }),

    -- [[ Layout related keybindings ]] -- 
    -- Move clients through stack
    awful.key({ mod, shift }, "j", function ()
        awful.client.swap.byidx(1)
    end, { description = "Swap with next client by index", group = "Client" }),
    awful.key({ mod, shift }, "k", function ()
        awful.client.swap.byidx(-1)
    end, { description = "Swap with previous client by index", group = "Client" }),

    -- Focus urgent client
    awful.key({ mod }, "u", awful.client.urgent.jumpto,
        { description = "Focus urgent client", group = "Client" }),

    -- Adjust width of master area
    awful.key({ mod }, "h", function ()
        awful.tag.incmwfact(-0.05)
    end, { description = "Decrease width of master area", group = "Layout" }),
    awful.key({ mod }, "l", function ()
        awful.tag.incmwfact(0.05)
    end, { description = "Increase width of master area", group = "Layout" }),

    -- Adjust number of master clients
    awful.key({ mod }, "i", function ()
        awful.tag.incnmaster(1, nil, true)
    end, { description = "Increase number of master clients", group = "Layout" }),
    awful.key({ mod }, "d", function ()
        awful.tag.incnmaster(-1, nil, true)
    end, { description = "Decrease number of master clients", group = "Layout" }),

    -- Adjust number of columns
    awful.key({ mod, shift }, "i", function ()
        awful.tag.incncol(1, nil, true)
    end, { description = "Increase number of columns", group = "Layout" }),
    awful.key({ mod, shift }, "d", function ()
        awful.tag.incncol(-1, nil, true)
    end, { description = "Decrease number of columns", group = "Layout" }),

    -- Switch layout
    awful.key({ mod }, ".", function ()
        awful.layout.inc(1)
    end, { description = "Select next layout", group = "Layout" }),
    awful.key({ mod }, ",", function ()
        awful.layout.inc(-1)
    end, { description = "Select previous layout", group = "Layout" }),

    -- Center a floating window
    awful.key({ mod }, "c", function ()
        awful.placement.centered(client.focus, {
            honor_workarea = true
        })
    end, { description = "Center floating window", group = "Client" })
)
