local awful = require("awful")

-- awful.util.tagnames = { "➀", "➁", "➂", "➃", "➄" }

local tags = {"I", "II", "III", "IV", "V"}
awful.util.tagnames = tags
awful.screen.connect_for_each_screen(function(s)
    awful.tag(tags, s, awful.layout.layouts[1])
end)

-- awful.util.tagnames = tags
