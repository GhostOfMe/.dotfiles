local awful = require("awful")
local beautiful = require("beautiful")

-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function(s)
  local only_one = #s.tiled_clients == 1
  for _, c in pairs(s.clients) do
    --if only_one and not c.floating or c.maximized then
    if c.maximized then
      c.border_width = 0
    else
      c.border_width = beautiful.border_width
    end
  end
end)


-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup
		and not c.size_hints.user_position
		and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

client.connect_signal("manage", function(c)
    if not awesome.startup then awful.client.setslave(c) end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = false})
-- end)

-- Focus urgent windows
client.connect_signal("property::urgent", function(c)
    c.minimized = false
    c:jump_to()

end)


-- client.connect_signal("property::floating", function(c)
--     if c.floating then
--         awful.titlebar.show(c)
--     else
--         awful.titlebar.hide(c)
--     end
-- end)


-- client.connect_signal("focus", function(c)
--        c.border_color = "#1cdc9a"
--        c.border_width = 2
-- end)