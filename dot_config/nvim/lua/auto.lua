local ac = vim.api.nvim_create_autocmd

-- Set Gruvbox
ac("vimenter", {
	pattern = "*",
	nested = true,
	command = "colorscheme gruvbox"
})
-- Change color of indent line
ac("ColorScheme", {
	pattern = "*",
	command = "highlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine"
})
-- Remove leading comments
ac("FileType", {
	pattern = "*",
	command = "setl formatoptions-=ro"
})
-- Zig filetyping
ac({"BufNewFile", "BufRead"}, {
	pattern = "*.zig",
	command = "setl ft=zig"
})
