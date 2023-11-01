local beautiful = require("beautiful")
local gruvbox = require("gruvbox")


beautiful.fg_normal = gruvbox.fgs.fg1
beautiful.bg_normal = gruvbox.bgs.bg0
beautiful.tasklist_fg_normal = gruvbox.fgs.fg1
beautiful.font = "monospace"

-- tasklist
beautiful.tasklist_bg_normal = gruvbox.bgs.bg1
beautiful.tasklist_bg_focus = gruvbox.bgs.bg3
beautiful.tasklist_bg_minimize = gruvbox.bgs.bg0h

-- titlebar
beautiful.titlebar_fg = gruvbox.fgs.fg1
beautiful.titlebar_bg = gruvbox.bgs.bg0

-- taglist
beautiful.taglist_bg_empty = gruvbox.bgs.bg0h
beautiful.taglist_bg_occupied = gruvbox.bgs.bg1
beautiful.taglist_bg_focus = gruvbox.bgs.bg4

-- border
beautiful.border_width = 1
beautiful.border_color = gruvbox.blue

-- systray
beautiful.bg_systray = gruvbox.bgs.bg1
