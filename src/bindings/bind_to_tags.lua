-- Awesome libs
local awful = require("awful")
local gears = require("gears")
local globalkeys = require("bindings.global_keys")
local mod = "Mod4"

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag
        awful.key(
            { mod },
            "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
                client.emit_signal("tag::switched")
            end,
            { description = "View tag " .. i, group = "Tag" }
        ),
        -- Toggle tag
        awful.key(
            { mod, "Control" },
            "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "Toggle tag " .. i, group = "Tag" }
        ),
        -- Send client to tag
        awful.key(
            { mod, "Shift" },
            "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end,
            { description = "Move focused client to tag " .. i, group = "Tag" }
        ),
        -- Add client to tag
        awful.key(
            { mod, "Control", "Shift" },
            "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end,
            { description = "Add focused client to tag " .. i, group = "Tag" }
        )
    )
end
root.keys(globalkeys)
