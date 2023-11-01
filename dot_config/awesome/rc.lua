require("awful.hotkeys_popup.keys")
-- WHERE IS THE DOCUMENTATION FOR THIS WHY IS IT NOT THERE
require("awful.autofocus")

local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")

-- basic config
require("main")

-- add theme
require("theme")

-- wibar
require("wibar")

-- keybindinds
local binds = require("binds")


if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "startup errors",
		text = awesome.startup_errors
	})
end

do
	local in_error = false

	awesome.connect_signal("debug::error", function(err)
		if in_error then return end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "error",
			text = tostring(err)
		})

		in_error = false
	end)
end


local bindings = gears.table.join(binds.misc, binds.layout, binds.clients)

root.keys(gears.table.join(bindings, binds.tags, binds.hints))

-- default to first tag
for s in screen do s.tags[1]:view_only() end

awful.rules.rules = {
	{
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			keys = gears.table.join(bindings, binds.window),
			buttons = binds.buttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen
		}
	}
}


client.connect_signal("manage", function(c)
	if awesome.startup
		and not c.size_hints.user_position
		and not c.size_hints.program_position then
		awful.placement.no_offscreen(c)
	end
end)

client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)
