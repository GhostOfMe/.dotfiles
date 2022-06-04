--[[
     ▙ ▌▞▀▖▛▀▖▛▀▖
     ▌▌▌▌ ▌▙▄▘▌ ▌
     ▌▝▌▌ ▌▌▚ ▌ ▌
     ▘ ▘▝▀ ▘ ▘▀▀
--]]

local kbdcfg = require("keyboard_layout").kbdcfg

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/nord"
theme.wallpaper                                 = theme.confdir .. "/wall.png"
theme.font                                      = "monospace 10"
theme.bg_normal                                 = "#2e3440"
theme.bg_focus                                  = "#4c566a"
theme.bg_urgent                                 = "#434c5e"
theme.fg_normal                                 = "#d8dee9"
theme.fg_focus                                  = "#88c0d0"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#2e3440"
theme.border_focus                              = "#5e81ac"
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#434c5e"
theme.menu_fg_focus                             = "#4c566a"
theme.menu_bg_normal                            = "#d8dee9"
theme.menu_bg_focus                             = "#e5e9f0"
theme.widget_temp                               = gears.color.recolor_image(theme.confdir .. "/icons/temp.png", theme.bg_normal)
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = gears.color.recolor_image(theme.confdir .. "/icons/cpu.png", theme.bg_normal)
theme.widget_weather                            = gears.color.recolor_image(theme.confdir .. "/icons/dish.png", theme.bg_normal)
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = gears.color.recolor_image(theme.confdir .. "/icons/mem.png", theme.bg_normal)
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = gears.color.recolor_image(theme.confdir .. "/icons/net_down.png", theme.bg_normal)
theme.widget_netup                              = gears.color.recolor_image(theme.confdir .. "/icons/net_up.png", theme.bg_normal)
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = gears.color.recolor_image(theme.confdir .. "/icons/clock.png", theme.bg_normal)
theme.widget_vol                                = gears.color.recolor_image(theme.confdir .. "/icons/spkr.png", theme.bg_normal)
theme.taglist_bg_focus                          = theme.bg_focus
theme.taglist_fg_focus                          = theme.fg_normal
theme.taglist_bg_empty                          = theme.bg_normal
theme.taglist_fg_empty                          = "#4c566a"
theme.taglist_fg_urgent                         = theme.fg_normal
theme.taglist_bg_urgent                         = theme.bg_normal
theme.taglist_bg_occupied                       = theme.bg_normal
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

theme.keyboard_us                               = theme.confdir .. "/icons/united-states.png"
theme.keyboard_ru                               = theme.confdir .. "/icons/russia.png"

local markup = lain.util.markup

-- Keyboard layout widget
theme.kbdcfg = kbdcfg({type = "tui"})
theme.kbdcfg.add_primary_layout("English", " US ", "us -option compose:ralt")
theme.kbdcfg.add_primary_layout("Русский", " RU ", "ru,us -option compose:ralt")
theme.kbdcfg.bind()

-- Mouse bindings
kbdcfg.widget:buttons(
awful.util.table.join(
    awful.button({ }, 1, function () kbdcfg.switch_next() end)
  , awful.button({ }, 3, function () theme.kbdcfg.menu:toggle() end)
  )
)

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup(theme.bg_normal, "%a %d %b ") .. markup(theme.bg_normal, "|") .. markup(theme.bg_normal, " %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Fira Code 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 490068,
    notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, theme.bg_normal, "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, theme.bg_normal, string.format("%3.0f°C ", units)))

    end
})


-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.bg_normal, string.format("%3.0f%% ", cpu_now.usage)))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.bg_normal, string.format("%3.0f°C ", coretemp_now)))
    end
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end

        widget:set_markup(markup.fontfg(theme.font, theme.bg_normal, string.format("%3.0f%% ", volume_now.level)))
    end
})

theme.volume.widget:buttons(awful.util.table.join(
                               awful.button({}, 4, function ()
                                     awful.util.spawn("amixer set Master 1%+")
                                     theme.volume.update()
                               end),
                               awful.button({}, 5, function ()
                                     awful.util.spawn("amixer set Master 1%-")
                                     theme.volume.update()
                               end)
))

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end

        widget:set_markup(markup.fontfg(theme.font, theme.bg_normal, string.format("%06.1f ", net_now.sent%10000)))
        netdowninfo:set_markup(markup.fontfg(theme.font, theme.bg_normal,string.format("%06.1f ", net_now.received%10000)))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.bg_normal, string.format("%4.0fM ", mem_now.used)))
    end
})


function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
--[[
    local wallpaper = theme.wallpaper

    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
--]]


    -- Tags
    --awful.tag(awful.util.tagnames, s, awful.layout.layouts)


    -- Tags
        tag_layouts = {
                    awful.layout.suit.floating,
                    awful.layout.suit.floating,
                    awful.layout.suit.tile,
                    awful.layout.suit.tile,
                    awful.layout.suit.tile,
        }
        awful.tag.add(awful.util.tagnames[1], {
                    layout             = tag_layouts[1],
                    gap_single_client  = true,
                    screen             = s,
                    selected           = true,
        })

        for i = 2,#awful.util.tagnames,1
            do
                awful.tag.add(
                    awful.util.tagnames[i], {
                    layout = tag_layouts[i],
                    screen = s,
                })
            end


    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
--    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(19), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            wibox.container.background(volicon, "#5e81ac"),
            wibox.container.background(theme.volume.widget, "#5e81ac"),
            wibox.container.background(netdownicon, "#8fbcbb"),
            wibox.container.background(netdowninfo, "#8fbcbb"),
            wibox.container.background(netupicon, "#8fbcbb"),
            wibox.container.background(netupinfo.widget, "#8fbcbb"),
            wibox.container.background(memicon, "#ebcb8b"),
            wibox.container.background(memory.widget, "#ebcb8b"),
            wibox.container.background(cpuicon, "#d08770"),
            wibox.container.background(cpu.widget, "#d08770"),
            wibox.container.background(tempicon, "#bf616a"),
            wibox.container.background(temp.widget, "#bf616a"),
            wibox.container.background(weathericon, "#b48ead"),
            wibox.container.background(theme.weather.widget, "#b48ead"),
            wibox.container.background(theme.kbdcfg.widget, "#4c566a"),
            wibox.container.background(clockicon, "#81a1c1"),
            wibox.container.background(mytextclock, "#81a1c1"),
            s.mylayoutbox
        },
    }


end

return theme
