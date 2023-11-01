local o = vim.opt

o.linebreak=true
o.tabstop=4
o.shiftwidth=0
o.backspace={
	"indent",
	"eol",
	"start"
}
o.autoindent=true

o.ignorecase = true
o.smartcase = true

o.relativenumber=true
o.number=true
o.scrolloff=1
o.title=true

o.mouse="a"
o.autochdir=true
o.termguicolors=true
o.completeopt={
	"menuone",
	"noinsert",
	"noselect"
}

o.nrformats:remove({"octal"})
o.sessionoptions:remove({"options"})
o.viewoptions:remove({"options"})
vim.cmd[[set formatoptions-=o]]

o.undofile=true
o.undodir=vim.fn.expand("~/.local/share") .. "/nvim/undo//"

-- Treesitter folding
o.foldmethod="expr"
o.foldexpr="nvim_treesitter#foldexpr()"
