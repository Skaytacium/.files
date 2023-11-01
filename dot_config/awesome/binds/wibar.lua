require("binds.default")

local gears = require("gears")
local awful = require("awful")


return {
	tasklist = gears.table.join(
		awful.button({}, 1, function(c)
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end),

		awful.button({}, 4, function() awful.client.focus.byidx(-1) end),

		awful.button({}, 5, function() awful.client.focus.byidx(1) end)
	),
	taglist = gears.table.join(
		awful.button({}, 1, function(t) t:view_only() end),

		awful.button({ Modkey }, 1, function(t)
			if client.focus then client.focus:move_to_tag(t) end
		end),

		awful.button({}, 3, awful.tag.viewtoggle),

		awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),

		awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end)
	)
}
