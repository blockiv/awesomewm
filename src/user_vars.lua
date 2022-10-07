---@diagnostic disable: lowercase-global
-- User variables

--[[ local awful = require("awful") ]]
--[[ local dpi = require("beautiful").xresources.apply_dpi ]]
local home = os.getenv("HOME")

-- Default modkey
modkey = "Mod4"

-- Default applications
terminal = "st"
explorer = terminal .. " -e vifm"
browser = "firefox"

-- Default editor
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Wallpaper
wallpaper = home .. "/Pictures/Wallpapers/one_piece_manga.png"


