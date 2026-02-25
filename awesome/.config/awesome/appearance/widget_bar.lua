local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local beautiful = require("beautiful")
local kbdcfg = require("keyboard_layout").kbdcfg
local markup = lain.util.markup
local freedesktop   = require("freedesktop")

local vars = require("main.user_variables")

local widgets = {}

-- Menu

function widgets.menu(s)
    local myawesomemenu = {
    { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "Manual", string.format("%s -e man awesome", terminal) },
    { "Edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
    { "Restart", awesome.restart },
    { "Quit", function() awesome.quit() end },
    }

    awful.util.mymainmenu = freedesktop.menu.build {
        before = {
            { "Awesome", myawesomemenu, beautiful.awesome_icon },
            -- other triads can be put here
        },
        after = {
            { "Open terminal", terminal },
            -- other triads can be put here
        }
    }

    -- Hide the menu when the mouse leaves it

    awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function()
        if not awful.util.mymainmenu.active_child or
        (awful.util.mymainmenu.wibox ~= mouse.current_wibox and
        awful.util.mymainmenu.active_child.wibox ~= mouse.current_wibox) then
            awful.util.mymainmenu:hide()
        else
            awful.util.mymainmenu.active_child.wibox:connect_signal("mouse::leave",
            function()
                if awful.util.mymainmenu.wibox ~= mouse.current_wibox then
                    awful.util.mymainmenu:hide()
                end
            end)
        end
    end)

    local awesome_icon = wibox.widget.imagebox()
    awesome_icon:set_image(beautiful.awesome_icon)

    mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

    -- Define mouse button actions
    awesome_icon:buttons(awful.util.table.join(
        awful.button({}, 1, function()
            -- Action for left click
            awful.spawn.with_shell(vars.config_path .. "/scripts/powermenu.sh")
        end),
        awful.button({}, 3, function() 
            -- Action for right click
            naughty.notify({ text = "Right click on imagebox!" })
        end)
    ))
                                     
    return wibox.widget {
        screen = s,
        widget = awesome_icon
    }

end


-- ALSA volume

function widgets.alsa(s, fg)
    fg = fg or beautiful.fg_normal
    myvolume = lain.widget.alsa({
        settings = function()
            local icon = " "
            if volume_now.status == "off" then
                icon = "󰝟"
            elseif tonumber(volume_now.level) == 0 then
                icon = "󰕿"
            elseif tonumber(volume_now.level) <= 50 then
                icon = "󰖀"
            else
                icon = "󰕾"
            end
            widget:set_markup(markup.fontfg(beautiful.font, fg, string.format("%s %3.0f%%", icon, volume_now.level)))
        end
    })
    myvolume.widget:buttons(awful.util.table.join(
        awful.button({}, 4,
            function()
                awful.util.spawn("amixer set Master 1%+", false)
                myvolume.update()
            end
        ),
        awful.button({}, 5,
            function()
                awful.util.spawn("amixer set Master 1%-", false)
                myvolume.update()
            end
        )
    ))

    beautiful.volume = myvolume

    return wibox.widget {
        screen = s,
        widget = myvolume.widget
    }
end

-- Net

function widgets.my_netinfo(s, fg1, fg2)
    fg1 = fg1 or beautiful.blue
    fg2 = fg2 or beautiful.green
    local mynetdowninfo = wibox.widget.textbox()
    local mynetupinfo = lain.widget.net({
        settings = function()
            widget:set_markup(
                markup.fontfg(beautiful.font, fg1, string.format("祝 %06.1f", net_now.sent % 10000)))
            mynetdowninfo:set_markup(
                markup.fontfg(beautiful.font, fg2, string.format(" %06.1f ", net_now.received % 10000)))
        end
    })
    return wibox.widget {
        mynetdowninfo,
        mynetupinfo.widget,
        layout = wibox.layout.fixed.horizontal,
        screen = s
    }

end

-- Ram

function widgets.memory(s, fg)
    fg = fg or beautiful.fg_normal
    local mymemory = lain.widget.mem({
        settings = function()
            widget:set_markup(
                markup.fontfg(beautiful.font, fg, string.format(" %4.0fM", mem_now.used))
            )
        end
    })
    return wibox.widget {
        screen = s,
        widget = mymemory.widget
    }
end

-- Cpu

function widgets.cpu(s, fg)
    fg = fg or beautiful.fg_normal
    local mycpu = lain.widget.cpu({
        settings = function()
            widget:set_markup(
                markup.fontfg(beautiful.font, fg, string.format(" %3.0f%%", cpu_now.usage)))
        end
    })
    return wibox.widget {
        screen = s,
        widget = mycpu.widget
    }
end

-- Temperature

function widgets.temp(s, fg)
    fg = fg or beautiful.fg_normal
    local mytemp = lain.widget.temp({
        settings = function()
            widget:set_markup(
                markup.fontfg(beautiful.font, fg, string.format("%3.0f°C", coretemp_now)))
        end
    })
    return wibox.widget {
        screen = s,
        widget = mytemp.widget
    }
end

-- Tray

local mysystray = wibox.widget.systray()

function widgets.systray(s)
    return wibox.widget {
        screen = s,
        widget = mysystray
    }
end

-- Keyboard Layout

function widgets.keyboardlayout(s, fg)
    kbdcfg = kbdcfg({
        type = "tui",
        fg = fg or beautiful.fg_normal,
        font = beautiful.font
    })

    kbdcfg.add_primary_layout("English", "US", "us -option compose:ralt")
    kbdcfg.add_primary_layout("Русский", "RU", "ru,us -option compose:ralt")
    kbdcfg.bind()

    kbdcfg.widget:buttons(awful.util.table.join(awful.button({}, 1, function()
        kbdcfg.switch_next()
    end)))
    return wibox.widget {
        screen = s,
        widget = kbdcfg.widget,
        fg = "#000000"
    }
end

-- Textclock

function widgets.textclock(s, fg, fg_date)
    os.setlocale(os.getenv("LANG")) -- to localize the clock
    fg = fg or beautiful.fg_normal
    fg_date = fg_date or beautiful.fg_normal

    local mytextclock = wibox.widget.textclock(markup(fg_date, "%a %d %b ") .. markup(fg_date, "|") ..
                                                   markup.bold(markup(fg, " %H:%M ")))
    mytextclock.font = beautiful.font

    -- Calendar
    
    local cal = lain.widget.cal({
        attach_to = {mytextclock},
        notification_preset = {
            font = beautiful.font,
            fg = beautiful.fg_normal,
            bg = beautiful.bg_normal
        }
    })
    return wibox.widget {
        screen = s,
        widget = mytextclock
    }
end

return widgets

