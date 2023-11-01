local g = vim.g

g.gruvbox_italic=1

g.completion_enable_auto_popup = 1
g.coq_settings = {
	["auto_start"]="shut-up",
	["display.pum.fast_close"]= false,
	["clients"]= {
		["lsp.weight_adjust"]= 1.5,
		["snippets.warn"]= {"outdated"}
	}
}

g.Hexokinase_highlighters = {"backgroundfull"}
