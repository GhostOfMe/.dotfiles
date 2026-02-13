--------------------------
-- Rose Piné awesome theme --
--------------------------
local vars = require("main.user_variables")

local rp = {
    n0 = "#191724",
    n1 = "#1f1d2e",
    n2 = "#26233a",
    n3 = "#6e6a86",
    n4 = "#908caa",
    n5 = "#e0def4",
    n6 = "#eb6f92",
    n7 = "#f6c177",
    n8 = "#ebbcba",
    n9 = "#31748f",
    n10 = "#9ccfd8",
    n11 = "#c4a7e7",
    n12 = "#21202e",
    n13 = "#403d52",
    n14 = "#524f67",
}

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = vars.config_path .. "themes/"

local theme = {}

theme.font = "FiraCode Nerd Font 10"

theme.bg_normal = rp.n1
theme.bg_focus = rp.n1
theme.bg_urgent = rp.n2
-- theme.bg_minimize   = "#444444"
theme.bg_systray = theme.bg_normal

theme.fg_normal = rp.n4
theme.fg_focus = rp.n8
theme.fg_urgent = rp.n14
-- theme.fg_minimize   = "#ffffff"
theme.colors = {rp.n7, rp.n8, rp.n10, rp.n11, rp.n10, rp.n8}
theme.red = rp.n11
theme.green = rp.n12

theme.border_width = dpi(2)
theme.border_normal = rp.n0
theme.border_focus = rp.n10
theme.border_marked = rp.n7

theme.taglist_bg_focus = rp.n6
theme.taglist_fg_focus = theme.bg_normal
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_fg_empty = rp.n3
theme.taglist_fg_urgent = theme.bg_normal
theme.taglist_bg_urgent = rp.n9
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_fg_occupied = rp.n8

theme.green = rp.n7
theme.blue = rp.n11
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

theme.wallpaper = themes_path .. "backgrounds/rp/1.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "icons/rp/layouts/fairh.png"
theme.layout_fairv = themes_path .. "icons/rp/layouts/layouts/fairv.png"
theme.layout_floating = themes_path .. "icons/rp/layouts/floating.png"
theme.layout_magnifier = themes_path .. "icons/rp/layouts/magnifier.png"
theme.layout_max = themes_path .. "icons/rp/layouts/max.png"
theme.layout_fullscreen = themes_path .. "icons/rp/layouts/fullscreen.png"
theme.layout_tilebottom = themes_path .. "icons/rp/layouts/tilebottom.png"
theme.layout_tileleft = themes_path .. "icons/rp/layouts/tileleft.png"
theme.layout_tile = themes_path .. "icons/rp/layouts/tile.png"
theme.layout_tiletop = themes_path .. "icons/rp/layouts/layouts/tiletop.png"
theme.layout_spiral = themes_path .. "icons/rp/layouts/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "icons/rp/layouts/layouts/dwindle.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
