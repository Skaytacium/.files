require("binds/default")
require("main")

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox/init")
local binds = require("binds.wibar")
local gruvbox = require("gruvbox")


awful.screen.connect_for_each_screen(function(s)
	do
		local i = 0

		while i < Tags do
			awful.tag.add("", {
				layout = awful.layout.layouts[1],
				screen = s
			})
			i = i + 1
		end
	end

	s.mypromptbox = awful.widget.prompt{ prompt = "" }
	s.mytaglist = awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.all,
		buttons = binds.taglist,
		style = {
			shape = gears.shape.powerline
		},
		layout = {
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			widget = wibox.container.background,
			id = "background_role",
			{
				widget = wibox.container.margin,
				left = 15,
				right = 15,
			},
		}
	}
	s.mytasklist = awful.widget.tasklist {
		screen          = s,
		filter         = awful.widget.tasklist.filter.currenttags,
		buttons         = binds.tasklist,
		style = {
			shape = gears.shape.powerline
		},
		widget_template = {
			widget          = wibox.container.background,
			id              = "background_role",
			{
				widget = wibox.container.place,
				{
					widget = awful.widget.clienticon,
					id     = "clienticon",
				}
			},
			create_callback = function(self, c)
				self:get_children_by_id("clienticon")[1].client = c
			end,
		},
	}
	s.mysystray = wibox.widget {
		widget = wibox.container.background,
		shape = function(cr, width, height) gears.shape.powerline(cr, width, height, -15) end,
		shape_clip = true,
		{
			widget = wibox.container.margin,
			left = 15,
			right = 15,
			color = gruvbox.bgs.bg1,
			wibox.widget.systray()
		}
	}
	s.mytextclock = wibox.widget {
		widget = wibox.container.background,
		bg = gruvbox.bgs.bg1,
		shape = function(cr, width, height) gears.shape.powerline(cr, width, height, -15) end,
		shape_clip = true,
		{
			widget = wibox.container.margin,
			left = 15,
			right = 15,
			color = gruvbox.bgs.bg1,
			wibox.widget.textclock("%H:%M, %e/%y")
		}
	}
	s.mylayoutbox = wibox.widget {
		widget = wibox.container.background,
		bg = gruvbox.fgs.fg1,
		fg = gruvbox.black,
		shape = gears.shape.rectangular_tag,
		shape_clip = true,
		{
			widget = wibox.container.margin,
			left = 20,
			right = 10,
			color = gruvbox.fgs.fg1,
			awful.widget.layoutbox()
		}
	}

	s.mywibox = awful.wibar({ position = "bottom", screen = s })
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist,
		{
			layout = wibox.layout.fixed.horizontal,
			spacing_widget = {
				widget = wibox.widget.seperator,
				shape = gears.shape.circle,
				color = gruvbox.gray,
			},
			s.mysystray,
			s.mytextclock,
			s.mylayoutbox,
		},
	}
end)
