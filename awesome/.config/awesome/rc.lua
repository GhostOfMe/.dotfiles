local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type


local blind  = require("blind")
local kbdcfg = require("keyboard_layout")
local gears  = require("gears")
local awful  = require("awful")
require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
--local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi      = require("beautiful.xresources").apply_dpi
local logout   = require("awesome-wm-widgets.logout-widget.logout")

awesome.themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"

local layouts = require("main.layouts")
awful.layout.layouts = layouts


-- Notifications
--
--

beautiful.notification_max_width = 100;
beautiful.notification_max_height = 200;


naughty.config.defaults['icon_size'] = 100;

beautiful.notfication_width = 400;


-- run_once({
--    "unclutter -root"
-- }) -- entries must be separated by commas

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]


local vars = require("main.user_variables")
require("main.error")

local modkey = vars.modkey
local editor = vars.editor

awful.util.terminal                    = vars.terminal

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

beautiful.init(vars.config_path .. "/themes/nord.lua")
beautiful.maximized_hide_border = true
gears.debug.dump(beautiful.red)
require("main.tag")
require("appearance.wibox")

require("key.taglist_buttons")

local globalbuttons = require("key.globalbuttons")
local globalkeys    = require("key.globalkeys")

root.keys(globalkeys)
root.buttons(globalbuttons)

require("main.rules")

require("main.signal")

beautiful.useless_gap = 4


--awful.spawn.with_shell("~/.config/awesome/random_wallpaper.sh")
--awful.spawn.with_shell("~/.config/awesome/autostart.sh")
--awful.spawn.with_shell("~/.config/awesome/picom_on.sh")
--awful.spawn.with_shell("~/.config/awesome/player.sh")
