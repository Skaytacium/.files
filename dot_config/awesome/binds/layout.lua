require("binds.default")

local gears = require("gears")
local awful = require("awful")


return gears.table.join(
	awful.key({ Modkey, }, "space", function() awful.layout.inc(1) end,
		{ description = "select next", group = "layout" }),

	awful.key({ Modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
		{ description = "select previous", group = "layout" }),

	awful.key({ Modkey, }, "=", function() awful.tag.incmwfact(0.05) end,
		{ description = "increase master width factor", group = "tile" }),

	awful.key({ Modkey, }, "-", function() awful.tag.incmwfact(-0.05) end,
		{ description = "decrease master width factor", group = "tile" }),

	awful.key({ Modkey, "Shift" }, "=", function() awful.tag.incnmaster(1, nil, true) end,
		{ description = "increase the number of master clients", group = "tile" }),

	awful.key({ Modkey, "Shift" }, "-", function() awful.tag.incnmaster(-1, nil, true) end,
		{ description = "decrease the number of master clients", group = "tile" }),

	awful.key({ Modkey, "Control" }, "=", function() awful.tag.incncol(1, nil, true) end,
		{ description = "increase the number of columns", group = "tile" }),

	awful.key({ Modkey, "Control" }, "-", function() awful.tag.incncol(-1, nil, true) end,
		{ description = "decrease the number of columns", group = "tile" })
)
