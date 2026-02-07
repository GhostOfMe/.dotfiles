local gears 	= require("gears")
local beautiful = require("beautiful")

local _M = {
	config_path 	= gears.filesystem.get_configuration_dir(),
	themes_path 	= gears.filesystem.get_themes_dir(),
	home_path 		= os.getenv("HOME"),
	dpi 			= beautiful.xresources.apply_dpi,
	vi_focus        = false, -- vi-like client focus - https://github.com/lcpz/awesome-copycats/issues/275
	cycle_prev      = true,  -- cycle trough all previous client or just the first -- https://github.com/lcpz/awesome-copycats/issues/274
	defaut_layout	= "us(intl-unicode)",
	modkey 			= "Mod4",
	altkey 			= "Mod1",
	
	terminal 		= "alacritty",
	explorer        = "thunar",
	editor          = os.getenv("EDITOR") or "vim",
	gui_editor      = os.getenv("GUI_EDITOR") or "sublime",
	browser         = os.getenv("BROWSER") or "firefox",
	scrlocker       = "slock",
}

return _M
