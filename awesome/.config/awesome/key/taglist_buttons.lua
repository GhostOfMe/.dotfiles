local awful  = require("awful")
local gears  = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local modkey = require("main.user_variables").modkey


awful.util.taglist_buttons             = gears.table.join(

  awful.button({}, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    ---@diagnostic disable-next-line
    if client.focus then
      ---@diagnostic disable-next-line
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    ---@diagnostic disable-next-line
    if client.focus then
      ---@diagnostic disable-next-line
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons            = gears.table.join(
  awful.button({}, 1, function(c)
    ---@diagnostic disable-next-line
    if c == client.focus then
      c.minimized = true
    else
      --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

      -- Without this, the following
      -- :isvisible() makes no sense
      c.minimized = false
      if not c:isvisible() and c.first_tag then
        c.first_tag:view_only()
      end
      -- This will also un-minimize
      -- the client, if needed
      ---@diagnostic disable-next-line
      client.focus = c
      c:raise()
    end
  end),
  awful.button({}, 2, function(c) c:kill() end),
  awful.button({}, 3, function()
    local instance = nil

    return function()
      if instance and instance.wibox.visible then
        instance:hide()
        instance = nil
      else
        instance = awful.menu.clients({ theme = { width = dpi(250) } })
      end
    end
  end),
  awful.button({}, 4, function() awful.client.focus.byidx(1) end),
  awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
)
