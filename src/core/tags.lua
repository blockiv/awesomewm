local awful = require("awful")

-- Tags
screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own tag table
	local names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }

	awful.tag(names, s, awful.layout.layouts[1])
end)
