require("binds.default")

local gears = require("gears")
local awful = require("awful")


return gears.table.join(
	awful.key({ Modkey, }, "k", function() awful.client.focus.byidx(1) end,
		{ description = "focus next by index", group = "clients" }),

	awful.key({ Modkey, }, "j", function() awful.client.focus.byidx(-1) end,
		{ description = "focus previous by index", group = "clients" }),

	awful.key({ Modkey, "Shift" }, "k", function() awful.client.swap.byidx(1) end,
		{ description = "swap with next client by index", group = "clients" }),

	awful.key({ Modkey, "Shift" }, "j", function() awful.client.swap.byidx(-1) end,
		{ description = "swap with previous client by index", group = "clients" }),

	awful.key({ Modkey, }, "u", awful.client.urgent.jumpto,
		{ description = "jump to urgent client", group = "clients" }),

	awful.key({ Modkey, }, "Tab", function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{ description = "go back", group = "clients" }),

	awful.key({ Modkey, "Control" }, "n", function()
			local c = awful.client.restore()
			if c then
				c:emit_signal(
					"request::activate", "key.unminimize", { raise = true }
				)
			end
		end,
		{ description = "restore minimized", group = "clients" })
)
