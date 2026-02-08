local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local beautiful = require("beautiful")
local kbdcfg = require("keyboard_layout").kbdcfg
local markup = lain.util.markup

local widgets = {}

-- ALSA volume

function widgets.alsa(s, fg)
    local fg = fg or beautiful.fg_normal
    local myvolume = lain.widget.alsa({
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
    myvolume.widget:buttons(awful.util.table.join(awful.button({}, 4, function()
        awful.util.spawn("amixer set Master 1%+")
        myvolume.update()
    end), awful.button({}, 5, function()
        awful.util.spawn("amixer set Master 1%-")
        myvolume.update()
    end)))

    return wibox.widget {
        screen = s,
        widget = myvolume.widget
    }
end

-- Net

function widgets.my_netinfo(s, fg1, fg2)
    local fg1 = fg1 or beautiful.blue
    local fg2 = fg2 or beautiful.green
    local mynetdowninfo = wibox.widget.textbox()
    local mynetupinfo = lain.widget.net({
        settings = function()
            if iface ~= "network off" -- and
            -- string.match(theme.weather.widget.text, "N/A")
            then
                -- theme.weather.update()
            end

            widget:set_markup(markup.fontfg(beautiful.font, fg1, string.format("祝 %06.1f", net_now.sent % 10000)))
            mynetdowninfo:set_markup(markup.fontfg(beautiful.font, fg2,
                string.format(" %06.1f ", net_now.received % 10000)))
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
    local fg = fg or beautiful.fg_normal
    local mymemory = lain.widget.mem({
        settings = function()
            widget:set_markup(markup.fontfg(beautiful.font, fg, string.format(" %4.0fM", mem_now.used)))
        end
    })
    return wibox.widget {
        screen = s,
        widget = mymemory.widget
    }
end

-- Cpu

function widgets.cpu(s, fg)
    local fg = fg or beautiful.fg_normal
    local mycpu = lain.widget.cpu({
        settings = function()
            widget:set_markup(markup.fontfg(beautiful.font, fg, string.format(" %3.0f%%", cpu_now.usage)))
        end
    })
    return wibox.widget {
        screen = s,
        widget = mycpu.widget
    }
end

-- Temperature
function widgets.temp(s, fg)
    local fg = fg or beautiful.fg_normal
    local mytemp = lain.widget.temp({
        settings = function()
            widget:set_markup(markup.fontfg(beautiful.font, fg, string.format("%3.0f°C", coretemp_now)))
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

-- kbdcfg.widget:set_markup(markup.fontfg("monospace 10", "#ff0000", string.format("%s", kbdcfg.widget.text)))

function widgets.keyboardlayout(s, fg)
    local kbdcfg = kbdcfg({
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
function widgets.textclock(s, fg)
    os.setlocale(os.getenv("LANG")) -- to localize the clock
    local fg = fg or beautiful.fg_normal
    local mytextclock = wibox.widget.textclock(markup(fg, "%a %d %b ") .. markup(fg, "|") ..
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

