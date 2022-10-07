local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")

-- asset paths
local assets_path = Theme_path .. "../assets/"
local icon_path = assets_path .. "icons/"
local layout_path = assets_path .. "layout/"
local shape_path = assets_path .. "shapes/"
local titlebar_path = assets_path .. "titlebar/"

-- fonts
Theme.font_name = "Operator Mono"
Theme.nerd_font = "OperatorMono Nerd Font"
Theme.material_icons = "Material Icons"
Theme.font_size = "12"
Theme.font = Theme.font_name .. " " .. Theme.font_size

-- base colors
Theme.black = "#151720"
Theme.dimblack = "#1a1c25"
Theme.light_black = "#262831"
Theme.grey = "#666891"
Theme.red = "#dd6777"
Theme.yellow = "#ecd3a0"
Theme.magenta = "#c296eb"
Theme.green = "#90ceaa"
Theme.blue = "#86aaec"
Theme.cyan = "#93cee9"
Theme.aqua = "#7bd9e6"

-- backgrounds
Theme.bg_normal = "#0d0f18"
Theme.bg_contrast = "#0f111a"
Theme.bg_lighter = "#11131c"

-- elements bg
Theme.bg_focus = Theme.bg_normal
Theme.bg_urgent = Theme.red
Theme.bg_minimize = Theme.bg_normal
Theme.bg_systray = Theme.bg_normal

-- foregrounds
Theme.fg_normal = "#a5b6cf"
Theme.fg_focus = Theme.fg_normal
Theme.fg_urgent = Theme.fg_normal
Theme.fg_minimize = Theme.fg_normal

-- some actions bg colors
Theme.actions = {
	bg = Theme.bg_normal,
	contrast = Theme.bg_contrast,
	lighter = Theme.bg_lighter,
	fg = Theme.fg_normal,
}


-- bar
Theme.bar_height = 40

-- gaps and borders
Theme.useless_gap = dpi(5)
Theme.border_width = dpi(0)
Theme.border_color_normal = Theme.bg_normal
Theme.border_color_active = Theme.bg_normal
Theme.border_color_marked = Theme.bg_normal
Theme.border_radius = dpi(10)

-- tasklist
Theme.tasklist_plain_task_name = true
Theme.tasklist_bg = Theme.bg_normal
Theme.tasklist_bg_focus = Theme.dimblack
Theme.tasklist_bg_urgent = Theme.red .. "4D" -- 30% transparency

-- task preview
Theme.task_preview_widget_border_radius = dpi(7)
Theme.task_preview_widget_bg = Theme.bg_normal
Theme.task_preview_widget_border_color = Theme.bg_normal
Theme.task_preview_widget_border_width = 0
Theme.task_preview_widget_margin = dpi(10)

-- taglist
local taglist_square_size = dpi(5)
Theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, Theme.blue)
Theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, Theme.dimblack)

-- tag preview
Theme.tag_preview_widget_border_radius = dpi(7)
Theme.tag_preview_client_border_radius = dpi(7)
Theme.tag_preview_client_opacity = 0.5
Theme.tag_preview_client_bg = Theme.bg_lighter
Theme.tag_preview_client_border_color = Theme.blue
Theme.tag_preview_client_border_width = 1
Theme.tag_preview_widget_bg = Theme.bg_normal
Theme.tag_preview_widget_border_color = Theme.bg_normal
Theme.tag_preview_widget_border_width = 0
Theme.tag_preview_widget_margin = dpi(7)

-- menu
Theme.menu_font = Theme.font
Theme.menu_submenu_icon = gears.color.recolor_image(shape_path .. "triangle.png", Theme.fg_normal)
Theme.menu_height = dpi(40)
Theme.menu_width = dpi(180)
Theme.menu_bg_focus = Theme.bg_lighter

-- titlebar
Theme.titlebar_bg = Theme.bg_contrast
Theme.titlebar_bg_focus = Theme.bg_normal
Theme.titlebar_fg = Theme.bg_normal

-- close
Theme.titlebar_close_button_normal = gears.color.recolor_image(titlebar_path .. "circle.png", Theme.dimblack)
Theme.titlebar_close_button_focus = gears.color.recolor_image(titlebar_path .. "circle.png", Theme.red)

-- maximized
Theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(titlebar_path .. "circle.png", Theme.dimblack)
Theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(titlebar_path .. "circle.png", Theme.dimblack)
Theme.titlebar_maximized_button_focus_active = gears.color.recolor_image(titlebar_path .. "circle.png", Theme.green)
Theme.titlebar_maximized_button_focus_inactive = gears.color.recolor_image(titlebar_path .. "circle.png", Theme.green)

-- minimize
Theme.titlebar_minimize_button_normal = gears.color.recolor_image(titlebar_path .. "circle.png", Theme.dimblack)
Theme.titlebar_minimize_button_focus = gears.color.recolor_image(titlebar_path .. "circle.png", Theme.yellow)

-- tooltips
Theme.tooltip_bg = Theme.bg_normal
Theme.tooltip_fg = Theme.fg_normal

-- icons
Theme.icon_theme = "Papirus-Dark"

-- layouts
Theme.layout_floating = gears.color.recolor_image(layout_path .. "floating.png", Theme.fg_normal)
Theme.layout_tile = gears.color.recolor_image(layout_path .. "tile.png", Theme.fg_normal)
Theme.layout_centered = gears.color.recolor_image(layout_path .. "centered.png", Theme.fg_normal)
Theme.layout_fullscreen = gears.color.recolor_image(layout_path .. "fullscreen.png", Theme.fg_normal)
Theme.layout_max = gears.color.recolor_image(layout_path .. "max.png", Theme.fg_normal)

-- icons
--[[ Theme.launcher_icon = gears.color.recolor_image(icon_path .. "launcher.svg") ]]
Theme.launcher_icon = icon_path .. "launcher.svg"

