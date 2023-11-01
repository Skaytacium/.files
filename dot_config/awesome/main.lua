local awful = require("awful")


editor = os.getenv("EDITOR") or "neovim"
editor_cmd = "kitty -e " .. editor
Tags = 4

awful.layout.layouts = {
    awful.layout.suit.max,
    awful.layout.suit.floating,
    awful.layout.suit.spiral,
    awful.layout.suit.fair,
    awful.layout.suit.tile,
}
