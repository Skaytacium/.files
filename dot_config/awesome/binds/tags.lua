require("binds.default")
require("main")

local gears = require("gears")
local awful = require("awful")


local keys = gears.table.join(
	awful.key({ Modkey }, "h", awful.tag.viewprev, { description = "view previous", group = "tags" }),

	awful.key({ Modkey }, "l", awful.tag.viewnext, { description = "view next", group = "tags" })
)

local i = 0

while i < Tags do
	i = i + 1
	local j = i

	keys = gears.table.join(keys,
		awful.key({ Modkey }, "#" .. j + 9, function()
				local screen = awful.screen.focused()
				local tag = screen.tags[j]
				if tag then tag:view_only() end
			end
		),

		awful.key({ Modkey, "Shift" }, "#" .. j + 9, function()
				if client.focus then
					local tag = client.focus.screen.tags[j]
					if tag then client.focus:move_to_tag(tag) end
				end
			end
		)
	)
end

return keys
