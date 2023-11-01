require("binds.default")

local gears = require("gears")
local awful = require("awful")


return gears.table.join(
	awful.key({ Modkey }, "LMB(1)", nil, { description = "move client", group = "buttons" }),

	awful.key({ Modkey }, "RMB(3)", nil, { description = "resize client", group = "buttons" }),

	awful.key({ Modkey }, "#", nil, { description = "view tag #", group = "tags" }),

	awful.key({ Modkey, "Shift" }, "#", nil, { description = "move focused client to tag #", group = "tags" })
)
