local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local appearance = {
    my_taglist = require("appearance.taglist"),
    my_tasklist = require("appearance.tasklist"),
    my_wallpaper = require("appearance.wallpaper"),
    my_widgets = require("appearance.widget_bar")
}

local separator = wibox.container.margin(wibox.widget.textbox(" "), 0, 0, 0, 1)

local wibar_colors = beautiful.colors

awful.screen.connect_for_each_screen(function(s)

    local my_widgets = {appearance.my_widgets.systray(s), appearance.my_widgets.alsa(s, beautiful.bg_normal),
                        appearance.my_widgets.my_netinfo(s, beautiful.bg_normal, beautiful.bg_normal),
                        appearance.my_widgets.memory(s, beautiful.bg_normal),
                        appearance.my_widgets.cpu(s, beautiful.bg_normal),
                        appearance.my_widgets.temp(s, beautiful.bg_normal),
                        wibox.container.margin(appearance.my_widgets.keyboardlayout(s, beautiful.bg_normal), 0, 0, 0, 1),
                        appearance.my_widgets.textclock(s, beautiful.bg_normal)}

    my_widgets[2].fg = "#000000"

    local right_layout = wibox.layout.fixed.horizontal()

    local cur = 1
    for i = 2, #my_widgets do
        local color_p = wibar_colors[((cur - 1) % #wibar_colors) + 1]
        cur = cur + 1

        local tmp_background_widget = wibox.container.background(my_widgets[i], color_p)
        right_layout:add(wibox.container.background(separator, color_p))
        right_layout:add(tmp_background_widget)
        right_layout:add(wibox.container.background(separator, color_p))
    end

    appearance.my_wallpaper(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(awful.button({}, 1, function()
        awful.layout.inc(1)
    end), awful.button({}, 3, function()
        awful.layout.inc(-1)
    end), awful.button({}, 4, function()
        awful.layout.inc(1)
    end), awful.button({}, 5, function()
        awful.layout.inc(-1)
    end)))

    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(19)
    })

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            my_taglist(s),
            s.mypromptbox
        },

        appearance.my_tasklist(s), -- Middle widget
        -- nil,

        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- appearance.my_widgets.systray(s),
            -- separator,
            -- wibox.container.background(wibox.widget{ appearance.my_widgets.alsa(s), separator,  layout = wibox.layout.align.horizontal}, "#ff00ff"),
            -- appearance.my_widgets.netdown(s),
            -- appearance.my_widgets.netup(s),
            -- separator,
            -- appearance.my_widgets.memory(s),
            -- separator,
            -- appearance.my_widgets.cpu(s),
            -- separator,
            -- appearance.my_widgets.temp(s),
            -- separator,
            -- wibox.container.margin(appearance.my_widgets.keyboardlayout(s), 0, 0, 0, 1),
            -- separator,
            -- wibox.container.margin(appearance.my_widgets.textclock(s), 0, 0, 0, 1),
            right_layout,
            s.mylayoutbox
        }
    }
end)

-- }}}

-- Create a wibox for each screen and add it
-- awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- }}}
