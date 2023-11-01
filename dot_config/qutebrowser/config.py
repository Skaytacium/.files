# gruvbox
g = {
    "bg": [
        "#1d2021",
        "#282828",
        "#3c3836",
        "#504945",
        "#665c54",
        "#7c6f64",
    ],
    "fg": [
        "#fbf1c7",
        "#ebdbb2",
        "#d5c4a1",
        "#bdae93",
        "#a89984",
    ],
    "b": {
        "r": "#fb4934",
        "g": "#b8bb26",
        "y": "#fabd2f",
        "b": "#83a598",
        "p": "#d3869b",
        "a": "#8ec07c",
        "h": "#928374",
        "o": "#fe8019",
    },
    "d": {
        "r": "#cc241d",
        "g": "#98971a",
        "y": "#d79921",
        "b": "#458588",
        "p": "#b16286",
        "a": "#689d6a",
        "h": "#a89984",
        "o": "#d65d0e"
    }
}

c.colors.completion.fg = [g["fg"][2], g["fg"][2], g["fg"][2]]
c.colors.completion.odd.bg = g["bg"][1]
c.colors.completion.even.bg = c.colors.completion.odd.bg
c.colors.completion.category.fg = g["d"]["b"]
c.colors.completion.category.bg = g["bg"][1]
c.colors.completion.category.border.top = c.colors.completion.category.bg
c.colors.completion.category.border.bottom = c.colors.completion.category.bg
c.colors.completion.item.selected.fg = g["fg"][2]
c.colors.completion.item.selected.bg = g["bg"][0]
c.colors.completion.item.selected.border.top = c.colors.completion.item.selected.bg
c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.bg
c.colors.completion.item.selected.match.fg = g["d"]["g"]
c.colors.completion.match.fg = c.colors.completion.item.selected.match.fg
c.colors.completion.scrollbar.fg = c.colors.completion.item.selected.fg
c.colors.completion.scrollbar.bg = c.colors.completion.category.bg

c.colors.contextmenu.disabled.bg = g["bg"][0]
c.colors.contextmenu.disabled.fg = g["fg"][2]
c.colors.contextmenu.menu.bg = g["bg"][1]
c.colors.contextmenu.menu.fg = g["fg"][2]
c.colors.contextmenu.selected.bg = g["bg"][3]
c.colors.contextmenu.selected.fg = c.colors.contextmenu.menu.fg

c.colors.downloads.bar.bg = g["bg"][1]
c.colors.downloads.start.fg = g["bg"][1]
c.colors.downloads.start.bg = g["d"]["b"]
c.colors.downloads.stop.fg = c.colors.downloads.start.fg
c.colors.downloads.stop.bg = g["d"]["a"]
c.colors.downloads.error.fg = g["d"]["r"]

c.colors.hints.fg = g["bg"][1]
c.colors.hints.bg = g["d"]["y"]
c.colors.hints.match.fg = g["bg"][3]

c.colors.keyhint.fg = g["fg"][4]
c.colors.keyhint.suffix.fg = g["fg"][0]
c.colors.keyhint.bg = g["bg"][1]

c.colors.messages.error.fg = g["bg"][1]
c.colors.messages.error.bg = g["d"]["r"]
c.colors.messages.error.border = c.colors.messages.error.bg
c.colors.messages.warning.fg = g["bg"][1]
c.colors.messages.warning.bg = g["d"]["y"]
c.colors.messages.warning.border = c.colors.messages.warning.bg
c.colors.messages.info.fg = g["fg"][2]
c.colors.messages.info.bg = g["bg"][1]
c.colors.messages.info.border = c.colors.messages.info.bg

c.colors.prompts.fg = g["fg"][2]
c.colors.prompts.border = f'1px solid {g["bg"][2]}'
c.colors.prompts.bg = g["bg"][1]
c.colors.prompts.selected.bg = g["bg"][3]

c.colors.statusbar.normal.fg = g["fg"][2]
c.colors.statusbar.normal.bg = g["bg"][1] 
c.colors.statusbar.command.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.command.bg = c.colors.statusbar.normal.bg
c.colors.statusbar.insert.fg = g["bg"][1]
c.colors.statusbar.insert.bg = g["d"]["b"]
c.colors.statusbar.passthrough.fg = g["bg"][1]
c.colors.statusbar.passthrough.bg = g["d"]["b"]
c.colors.statusbar.private.fg = g["fg"][2]
c.colors.statusbar.private.bg = g["d"]["p"]
c.colors.statusbar.command.private.fg = c.colors.statusbar.private.fg
c.colors.statusbar.command.private.bg = c.colors.statusbar.private.bg
c.colors.statusbar.caret.fg = g["bg"][1]
c.colors.statusbar.caret.bg = g["d"]["a"]
c.colors.statusbar.caret.selection.fg = c.colors.statusbar.caret.fg
c.colors.statusbar.caret.selection.bg = g["b"]["p"]
c.colors.statusbar.progress.bg = g["d"]["b"]
c.colors.statusbar.url.fg = g["fg"][2]
c.colors.statusbar.url.error.fg = g["d"]["r"]
c.colors.statusbar.url.hover.fg = g["fg"][2]
c.colors.statusbar.url.success.http.fg = g["b"]["y"]
c.colors.statusbar.url.success.https.fg = g["fg"][2]
c.colors.statusbar.url.warn.fg = g["d"]["y"]

c.colors.tabs.bar.bg = g["bg"][0]
c.colors.tabs.indicator.start = g["bg"][3]
c.colors.tabs.indicator.stop = g["bg"][3]
c.colors.tabs.indicator.error = g["d"]["r"]
c.colors.tabs.odd.fg = g["fg"][2]
c.colors.tabs.odd.bg = g["bg"][1]
c.colors.tabs.even.fg = c.colors.tabs.odd.fg
c.colors.tabs.even.bg = c.colors.tabs.odd.bg
c.colors.tabs.selected.odd.fg = c.colors.tabs.odd.fg
c.colors.tabs.selected.odd.bg = g["bg"][3]
c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg
c.colors.tabs.selected.even.bg = c.colors.tabs.selected.odd.bg
c.colors.tabs.pinned.even.fg = c.colors.tabs.odd.fg
c.colors.tabs.pinned.even.bg = g["bg"][0]
c.colors.tabs.pinned.odd.fg = c.colors.tabs.pinned.even.fg
c.colors.tabs.pinned.odd.bg = c.colors.tabs.pinned.even.bg
c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.odd.fg
c.colors.tabs.pinned.selected.even.bg = c.colors.tabs.selected.odd.bg
c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.pinned.selected.odd.fg
c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.pinned.selected.even.bg

c.colors.webpage.bg = g["bg"][1]
c.colors.webpage.darkmode.enabled = True


c.tabs.title.format="{audio} {current_title}"


config.load_autoconfig()
