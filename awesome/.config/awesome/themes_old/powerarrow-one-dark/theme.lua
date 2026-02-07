--[[
    based upon:
        github.com/lcpz
        github.com/eaufavor/AwesomeWM-powerarrow-dark/

--]]

local scheme = require("color_schemes.one_dark")

local kbdcfg = require("keyboard_layout").kbdcfg
local gears  = require("gears")
local lain   = require("lain")
local awful  = require("awful")
local wibox  = require("wibox")
local dpi    = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-one-dark"
theme.wallpaper                                 = theme.dir .. "/wall_1.jpg"
theme.font                                      = "monospace 10"
theme.taglist_font                              = "Fira Code 10"
theme.fg_normal                                 = scheme.fg_normal
theme.fg_focus                                  = scheme.fg_focus
theme.blue                                      = scheme.blue
theme.green                                     = scheme.green
theme.fg_urgent                                 = scheme.fg_urgent
theme.bg_normal                                 = scheme.bg_normal
theme.bg_focus                                  = scheme.bg_focus
theme.bg_urgent                                 = scheme.bg_urgent
theme.border_width                              = dpi(2)
theme.border_normal                             = scheme.border_normal
theme.border_focus                              = scheme.border_focus
theme.border_marked                             = scheme.border_marked
theme.tasklist_bg_focus                         = scheme.tasklist_bg_focus
theme.taglist_bg_focus                          = scheme.taglist_bg_focus
theme.taglist_fg_focus                          = scheme.taglist_fg_focus
theme.taglist_bg_empty                          = scheme.taglist_bg_empty
theme.taglist_fg_empty                          = scheme.taglist_fg_empty
theme.taglist_fg_urgent                         = scheme.taglist_fg_urgent
theme.taglist_bg_urgent                         = scheme.taglist_bg_urgent
theme.taglist_bg_occupied                       = scheme.taglist_bg_occupied
theme.titlebar_bg_focus                         = scheme.titlebar_bg_focus
theme.titlebar_bg_normal                        = scheme.tittlebar_bg_normal
theme.titlebar_fg_focus                         = scheme.tittlebar_fg_focus
theme.wibar_border_color                        = scheme.wibar_border_color
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = gears.color.recolor_image(theme.dir .. "/icons/submenu.png", scheme.fg_normal)
theme.layout_tile                               = gears.color.recolor_image(theme.dir .. "/icons/tile.png", scheme.fg_normal)
theme.layout_tileleft                           = gears.color.recolor_image(theme.dir .. "/icons/tileleft.png", scheme.fg_normal)
theme.layout_tilebottom                         = gears.color.recolor_image(theme.dir .. "/icons/tilebottom.png", scheme.fg_normal)
theme.layout_tiletop                            = gears.color.recolor_image(theme.dir .. "/icons/tiletop.png", scheme.fg_normal)
theme.layout_fairv                              = gears.color.recolor_image(theme.dir .. "/icons/fairv.png", scheme.fg_normal)
theme.layout_fairh                              = gears.color.recolor_image(theme.dir .. "/icons/fairh.png", scheme.fg_normal)
theme.layout_spiral                             = gears.color.recolor_image(theme.dir .. "/icons/spiral.png", scheme.fg_normal)
theme.layout_dwindle                            = gears.color.recolor_image(theme.dir .. "/icons/dwindle.png", scheme.fg_normal)
theme.layout_max                                = gears.color.recolor_image(theme.dir .. "/icons/max.png", scheme.fg_normal)
theme.layout_fullscreen                         = gears.color.recolor_image(theme.dir .. "/icons/fullscreen.png", scheme.fg_normal)
theme.layout_magnifier                          = gears.color.recolor_image(theme.dir .. "/icons/magnifier.png", scheme.fg_normal)
theme.layout_floating                           = gears.color.recolor_image(theme.dir .. "/icons/floating.png", scheme.fg_normal)
theme.widget_ac                                 = gears.color.recolor_image(theme.dir .. "/icons/ac.png", scheme.fg_normal)
theme.widget_battery                            = gears.color.recolor_image(theme.dir .. "/icons/battery.png", scheme.fg_normal)
theme.widget_battery_low                        = gears.color.recolor_image(theme.dir .. "/icons/battery_low.png", scheme.fg_normal)
theme.widget_battery_empty                      = gears.color.recolor_image(theme.dir .. "/icons/battery_empty.png", scheme.fg_normal)
theme.widget_mem                                = gears.color.recolor_image(theme.dir .. "/icons/mem.png", scheme.fg_normal)
theme.widget_cpu                                = gears.color.recolor_image(theme.dir .. "/icons/cpu.png", scheme.fg_normal)
theme.widget_temp                               = gears.color.recolor_image(theme.dir .. "/icons/temp.png", scheme.fg_normal)
theme.widget_net                                = gears.color.recolor_image(theme.dir .. "/icons/net.png", scheme.fg_normal)
theme.widget_hdd                                = gears.color.recolor_image(theme.dir .. "/icons/hdd.png", scheme.fg_normal)
theme.widget_music                              = gears.color.recolor_image(theme.dir .. "/icons/note.png", scheme.fg_normal)
theme.widget_music_on                           = gears.color.recolor_image(theme.dir .. "/icons/note_on.png", scheme.fg_normal)
theme.widget_vol                                = gears.color.recolor_image(theme.dir .. "/icons/vol.png", scheme.fg_normal)
theme.widget_vol_low                            = gears.color.recolor_image(theme.dir .. "/icons/vol_low.png", scheme.fg_normal)
theme.widget_vol_no                             = gears.color.recolor_image(theme.dir .. "/icons/vol_no.png", scheme.fg_normal)
theme.widget_vol_mute                           = gears.color.recolor_image(theme.dir .. "/icons/vol_mute.png", scheme.fg_normal)
theme.widget_mail                               = gears.color.recolor_image(theme.dir .. "/icons/mail.png", scheme.fg_normal)
theme.widget_mail_on                            = gears.color.recolor_image(theme.dir .. "/icons/mail_on.png", scheme.fg_normal)
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true theme.useless_gap                               = dpi(0)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.keyboard_us                               = theme.dir .. "/icons/united-states.png"
theme.keyboard_ru                               = theme.dir .. "/icons/russia.png"


local markup     = lain.util.markup
local separators = require("separators")

-- Keyboard layout widget

--theme.kbdcfg = kbdcfg({type = "gui"})
--theme.kbdcfg.add_primary_layout("English", theme.keyboard_us, "us")
--theme.kbdcfg.add_primary_layout("Русский", theme.keyboard_ru, "ru")
--theme.kbdcfg.bind()

-- Mouse bindings

--[[
theme.kbdcfg.widget:buttons(
awful.util.table.join(
    awful.button({ }, 1, function () theme.kbdcfg.switch_next() end)
    --, awful.button({ }, 3, function () theme.kbdcfg.menu:toggle() end)
  )
)
]]--
-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
--    "date +'%a %d %b %R'", 60,
    "date +'%R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Fira Code 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_focus
    }
})

-- Mail IMAP check
--local mailicon = wibox.widget.imagebox(theme.widget_mail)
--[[ commented because it needs to be set before use
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_markup(markup.font(theme.font, " " .. mailcount .. " "))
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--]]

-- MPD
--[[
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
    awful.button({ }, 1, function ()
        os.execute("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        os.execute("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
        os.execute("mpc next")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(theme.widget_music)
        end

        widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))
    end
})
]]--

-- MEM

local memicon = wibox.widget.imagebox(theme.widget_mem)
--memicon.opacity = 0.7
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
--cpuicon.opacity = 0.7
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(
            theme.font, " " .. string.format("%02.f", cpu_now.usage) .. "% "))
    end
})

-- Coretemp

local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- / fs
--local fsicon = wibox.widget.imagebox(theme.widget_hdd)
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})
--]]

-- Battery
--[[
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                baticon:set_image(theme.widget_ac)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_ac)
        end
    end
})
--]]

-- ALSA volume

local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end

        widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
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
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font,
            markup(theme.green, " " .. string.format("%06.1f", net_now.received))
            .. " " ..
            markup(theme.blue, " " .. string.format("%06.1f", net_now.sent) .. " ")))
    end
})

-- Separators
local spr     = wibox.widget.textbox(' ')
-- local arrl_ll = separators.arrow_left(theme.bg_focus, theme.bg_focus, theme.bg_normal)
-- local arrl_ld = separators.arrow_left(theme.bg_normal, theme.bg_focus,theme.bg_normal)



function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

-- Tags
    tag_layouts = {
                awful.layout.suit.floating,
                awful.layout.suit.floating,
                awful.layout.suit.tile,
                awful.layout.suit.tile,
                awful.layout.suit.tile,
    }
    awful.tag.add(awful.util.tagnames[0], {
                layout             = tag_layouts[0],
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
            awful.button({}, 5, function () awful.layout.inc(-1) end)
                         ))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style   = {
            shape = function(cr, width, height)
    	        gears.shape.powerline (cr, width, height, 10)
    	    end
        },
        layout   = {
            spacing = -8,
            spacing_widget = {
                shape = function(cr, width, height)
    	             gears.shape.powerline (cr, 0, height, 18)
    	          end,
            },
        forced_width = 512,

        layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 12,
                right = 12,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
        buttons = awful.util.taglist_buttons
    }

--    s.mytaglist = awful.widget.taglist(
--        s,
--        awful.widget.taglist.filter.all,
--        awful.util.taglist_buttons
--
--    )

    -- Create a tasklist widget
--    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(18),
        bg = theme.bg_normal,
        fg = theme.fg_normal
    })
    -- Right widget setup
    local widget_list = {
        {volicon, theme.volume.widget},
        {memicon, mem.widget},
        {cpuicon, cpu.widget},
        {tempicon, temp.widget},
        {neticon, net.widget},
        {spr, --[[theme.kbdcfg.widget]], spr},
        {clock, spr, spr},
        {s.mylayoutbox}
    }

    local powerline_colors = {
        theme.bg_focus,
--      theme.border_normal,
--      theme.green,
--      theme.blue/
    }

    local right_widgets = {}
      for i = 1,#widget_list,1
        do
            color_n = powerline_colors[(i % #powerline_colors) + 1]
            if ( i > 1 )
            then color_p = powerline_colors[((i-1) % #powerline_colors) + 1]
            else color_p = theme.bg_normal
            end
            local sep = separators.arrow_left(color_p, color_n, theme.bg_normal)
            table.insert(right_widgets, sep)
            for j = 1,#widget_list[i],1
                do
                    local w = widget_list[i][j]
                    table.insert(
                        right_widgets,
                        wibox.container.background(w, color_n)
                    )
                end
        end

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
--        expand = 'none',
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spr,
            s.mytaglist,
            s.mypromptbox,
        },
    --:    s.mytasklist, -- Middle widget
          spr,
        { -- Right widgets
            spacing = -0.5,
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            table.unpack(right_widgets)

        },
    }
end

return theme
