require("binds.default")

local gears = require("gears")
local awful = require("awful")


return gears.table.join(
	awful.key({ Modkey, }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{ description = "toggle fullscreen", group = "window" }),

	awful.key({ Modkey, "Shift" }, "c", function(c) c:kill() end,
		{ description = "close", group = "window" }),

	awful.key({ Modkey, "Control" }, "space", awful.client.floating.toggle,
		{ description = "toggle floating", group = "window" }),

	awful.key({ Modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
		{ description = "move to master", group = "window" }),

	awful.key({ Modkey, }, "t", function(c) c.ontop = not c.ontop end,
		{ description = "toggle keep on top", group = "window" }),

	awful.key({ Modkey, }, "n", function(c) c.minimized = true end,
		{ description = "minimize", group = "window" }),

	awful.key({ Modkey, }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{ description = "(un)maximize", group = "window" }),

	awful.key({ Modkey, "Control" }, "m", function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end,
		{ description = "(un)maximize vertically", group = "window" }),

	awful.key({ Modkey, "Shift" }, "m", function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end,
		{ description = "(un)maximize horizontally", group = "window" })
)
