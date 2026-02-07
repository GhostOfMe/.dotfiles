local gears  = require("gears")
local awful  = require("awful")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local kbdcfg        = require("keyboard_layout").kbdcfg

local appearance = {
    my_taglist = require("appearance.taglist"),
    my_tasklist = require("appearance.tasklist"),
    my_wallpaper = require("appearance.wallpaper"),
    my_widgets = require("appearance.widget_bar"),
}

awful.screen.connect_for_each_screen(function(s)

    appearance.my_wallpaper(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            my_taglist(s),
            s.mypromptbox,
        },

       appearance.my_tasklist(s), -- Middle widget
       --nil,
        
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            appearance.my_widgets.systray(s),
            appearance.my_widgets.alsa(s),
            appearance.my_widgets.netdown(s),
            appearance.my_widgets.netup(s),
            appearance.my_widgets.memory(s),
            appearance.my_widgets.cpu(s),
            appearance.my_widgets.temp(s),
            wibox.container.margin(appearance.my_widgets.keyboardlayout(s), 0, 0, 0, 1),
            wibox.container.margin(appearance.my_widgets.textclock(s), 0, 0, 0, 1),
            s.mylayoutbox,
        },
    }
end)

-- }}}

-- Create a wibox for each screen and add it
--awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- }}}
