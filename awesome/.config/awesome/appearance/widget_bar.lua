local gears  = require("gears")
local awful  = require("awful")
local wibox         = require("wibox")
local lain          = require("lain")
local beautiful     = require("beautiful")
local kbdcfg        = require("keyboard_layout").kbdcfg
local markup        = lain.util.markup


local widgets = {} 

-- ALSA volume
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
    widget:set_markup(
      markup.fontfg(
        beautiful.font,
        beautiful.fg_normal,
        string.format("%s %3.0f%%", icon, volume_now.level)))
  end
})

myvolume.widget:buttons(awful.util.table.join(
  awful.button({}, 4, function()
    awful.util.spawn("amixer set Master 1%+")
    myvolume.update()
  end),
  awful.button({}, 5, function()
    awful.util.spawn("amixer set Master 1%-")
    myvolume.update()
  end)
))

function widgets.alsa(s)
	return wibox.widget {
		screen = s,
		widget = myvolume.widget,
	}
end

-- Net
local mynetdowninfo = wibox.widget.textbox()
local mynetupinfo = lain.widget.net({
  settings = function()
    if iface ~= "network off" --and
        --string.match(theme.weather.widget.text, "N/A")
    then
      --theme.weather.update()
    end

    widget:set_markup(
      markup.fontfg(
        beautiful.font,
        beautiful.fg_normal,
        string.format("祝 %06.1f ", net_now.sent % 10000)
      ))
    mynetdowninfo:set_markup(
      markup.fontfg(
        beautiful.font,
        beautiful.fg_normal, 
        string.format(" %06.1f ", net_now.received % 10000)
      ))
  end
})

function widgets.netdown(s)
	return wibox.widget {
		screen = s,
		widget = mynetdowninfo,
	}
end

function widgets.netup(s)
	return wibox.widget {
		screen = s,
		widget = mynetupinfo.widget
	}
end

-- Ram
local mymemory = lain.widget.mem({
  settings = function()
    widget:set_markup(
      markup.fontfg(
        beautiful.font,
        beautiful.fg_normal,
        string.format(" %4.0fM", mem_now.used)
      ))
  end
})

function widgets.memory(s)
	return wibox.widget {
		screen = s,
		widget = mymemory.widget,
	}
end

-- Cpu
local mycpu = lain.widget.cpu({
  settings = function()
    widget:set_markup(markup.fontfg(beautiful.font, beautiful.fg_normal, string.format(" %3.0f%%", cpu_now.usage)))
  end
})

function widgets.cpu(s)
	return wibox.widget {
		screen = s,
		widget = mycpu.widget,
	}
end

-- Temperature
local mytemp = lain.widget.temp({
  settings = function()
    widget:set_markup(markup.fontfg(beautiful.font, beautiful.fg_normal, string.format("%3.0f°C", coretemp_now)))
  end
})

function widgets.temp(s)
	return wibox.widget {
		screen = s,
		widget = mytemp.widget,
	}
end

-- Tray
local mysystray = wibox.widget.systray()

function widgets.systray(s)
	return wibox.widget {
		screen = s,
		widget = mysystray,
	}
end

-- Keyboard Layout
local mykeyboardlayout = awful.widget.keyboardlayout()

mykeyboardlayout:buttons(
  awful.util.table.join(
    awful.button({}, 1, function() kbdcfg.switch_next() end)
  )
)

local kbdcfg = kbdcfg({ type = "tui" })
kbdcfg.add_primary_layout("English", "| US ", "us -option compose:ralt")
kbdcfg.add_primary_layout("Русский", "| RU ", "ru,us -option compose:ralt")
kbdcfg.bind()

function widgets.keyboardlayout(s)
	return wibox.widget {
		screen = s,
		widget = mykeyboardlayout,
	}
end

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock(markup(beautiful.fg_normal, "%a %d %b ") ..
  markup(beautiful.fg_normal, "|") .. markup(beautiful.fg_normal, " %H:%M "))
mytextclock.font = beautiful.font

-- Calendar
local cal = lain.widget.cal({
  attach_to = { mytextclock },
  notification_preset = {
    font = "Fira Code 10",
    fg   = beautiful.fg_normal,
    bg   = beautiful.bg_normal
  }
})

function widgets.textclock(s)
	return wibox.widget {
		screen = s,
		widget = mytextclock,
	}
end

return widgets

