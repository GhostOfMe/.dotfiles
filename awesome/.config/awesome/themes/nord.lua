--------------------------
-- Nord awesome theme --
---------------------------
--  _____           _ 
-- |   | |___ ___ _| |
-- | | | | . |  _| . |
-- |_|___|___|_| |___|


local vars = require("main.user_variables")

local nord = {
    n0 = "#2e3440",
    n1 = "#3b4252",
    n2 = "#434c5e",
    n3 = "#4c566a",
    n4 = "#d8dee9",
    n5 = "#e5e9f0",
    n6 = "#eceff4",
    n7 = "#8fbcbb",
    n8 = "#88c0d0",
    n9 = "#81a1c1",
    n10 = "#5e81ac",
    n11 = "#bf616a",
    n12 = "#d08770",
    n13 = "#ebcb8b",
    n14 = "#a3be8c",
    n15 = "#b48ead",
}


local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = vars.config_path .. "themes/"

local theme = {}

theme.font          = "monospace 10"

theme.bg_normal     = nord.n0
theme.bg_focus      = nord.n3
theme.bg_urgent     = nord.n2
--theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = nord.n4
theme.fg_focus      = nord.n8
theme.fg_urgent     = nord.n14
--theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = nord.n0
theme.border_focus  = nord.n10
theme.border_marked = nord.n7

theme.taglist_bg_focus      = theme.bg_focus
theme.taglist_fg_focus      = theme.fg_normal
theme.taglist_bg_empty      = theme.bg_normal
theme.taglist_fg_empty      = nord.n3
theme.taglist_fg_urgent     = theme.fg_normal
theme.taglist_bg_urgent     = theme.bg_normal
theme.taglist_bg_occupied   = theme.bg_normal

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
--theme.taglist_bg_focus = "#ff0000"

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
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = themes_path.."backgrounds/nord/1.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh      = themes_path.."icons/nord/layouts/fairh.png"
theme.layout_fairv      = themes_path.."icons/nord/layouts/layouts/fairv.png"
theme.layout_floating   = themes_path.."icons/nord/layouts/floating.png"
theme.layout_magnifier  = themes_path.."icons/nord/layouts/magnifier.png"
theme.layout_max        = themes_path.."icons/nord/layouts/max.png"
theme.layout_fullscreen = themes_path.."icons/nord/layouts/fullscreen.png"
theme.layout_tilebottom = themes_path.."icons/nord/layouts/tilebottom.png"
theme.layout_tileleft   = themes_path.."icons/nord/layouts/tileleft.png"
theme.layout_tile       = themes_path.."icons/nord/layouts/tile.png"
theme.layout_tiletop    = themes_path.."icons/nord/layouts/layouts/tiletop.png"
theme.layout_spiral     = themes_path.."icons/nord/layouts/layouts/spiral.png"
theme.layout_dwindle    = themes_path.."icons/nord/layouts/layouts/dwindle.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
