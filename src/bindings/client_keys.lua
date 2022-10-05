-- Awesome Libs
local awful = require("awful")
local gears = require("gears")
local mod = "Mod4"

return gears.table.join(
    awful.key({ mod }, "f", function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end,
    { description = "Toggle fullscreen", group = "Client" }),

    awful.key({ mod, "Shift" }, "c", function (c)
        c:kill()
    end,
    { description = "Close focused client", group = "Client" }),

    awful.key({ mod, "Control" }, "space",  awful.client.floating.toggle,
    { description = "Toggle floating", group = "Client" }),

    awful.key({ mod, "Control" }, "Return", function (c)
        c:swap(awful.client.getmaster())
    end,
    { description = "Move to master", group = "Client" }),

    awful.key({ mod }, "t", function (c)
        c.ontop = not c.ontop
    end,
    { description = "Toggle keep on top", group = "Client" }),

    awful.key({ mod }, "n", function (c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end,
    { description = "Minimize client", group = "Client" }),

    awful.key({ mod, "Shift" }, "m", function (c)
        c.maximized = not c.maximized
        c:raise()
    end,
    { description = "(Un)maximize client", group = "Client" })
)
