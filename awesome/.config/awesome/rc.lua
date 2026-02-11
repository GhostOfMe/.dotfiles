local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- local menubar       = require("menubar")

require("awful.hotkeys_popup.keys")
local dpi = require("beautiful.xresources").apply_dpi
local logout = require("awesome-wm-widgets.logout-widget.logout")

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

awful.util.terminal = vars.terminal

beautiful.init(vars.config_path .. "/themes/nord.lua")
beautiful.maximized_hide_border = true

require("main.error")
require("main.tag")
require("appearance.wibar")

require("key.taglist_buttons")

local globalbuttons = require("key.globalbuttons")
local globalkeys = require("key.globalkeys")

root.keys(globalkeys)
root.buttons(globalbuttons)

require("main.rules")

require("main.signal")

beautiful.useless_gap = 4

-- awful.spawn.with_shell("~/.config/awesome/random_wallpaper.sh")
-- awful.spawn.with_shell("~/.config/awesome/autostart.sh")
-- awful.spawn.with_shell("~/.config/awesome/picom_on.sh")
-- awful.spawn.with_shell("~/.config/awesome/player.sh")
