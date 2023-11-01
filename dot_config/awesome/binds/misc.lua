require("binds.default")

local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")


return gears.table.join(
	awful.key({ Modkey }, "Return", function() awful.spawn(Terminal) end,
		{ description = "open a terminal", group = "launcher" }),

	awful.key({ Modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
		{ description = "run prompt", group = "launcher" }),


	awful.key({ Modkey, }, "s", hotkeys_popup.show_help,
		{ description = "show help", group = "awesome" }),

	awful.key({ Modkey, "Control" }, "r", awesome.restart,
		{ description = "reload awesome", group = "awesome" }),

	awful.key({ Modkey, "Shift" }, "q", awesome.quit,
		{ description = "quit awesome", group = "awesome" })
)
