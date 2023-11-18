require("paq") {
	-- Plugin manager
	"wbthomason/packer.nvim";
	-- Brackets
	"tpope/vim-surround";
	-- Emmet
	"mattn/emmet-vim";
	-- Commenting
	"tpope/vim-commentary";
	-- Syntax highlighting (and a lot more)
	{ "nvim-treesitter/nvim-treesitter", build=function() vim.cmd "TSUpdate" end };
	-- Context
	"nvim-treesitter/nvim-treesitter-context";
	-- Tabs
	"romgrk/barbar.nvim";
	-- Status line
	"nvim-lualine/lualine.nvim";
	-- Color theme
	"gruvbox-community/gruvbox";
	-- Line indents
	"lukas-reineke/indent-blankline.nvim";
	-- File erunxplorer
	"nvim-telescope/telescope-file-browser.nvim";
	-- Fuzzy searcher
	"nvim-telescope/telescope.nvim";
	"nvim-lua/plenary.nvim";
	{ "nvim-telescope/telescope-fzf-native.nvim", build="make" };
	-- Discord
	"andweeb/presence.nvim";
	-- LSP config
	"neovim/nvim-lspconfig";
	-- Autocompletion
	"ms-jpq/coq_nvim";
	"ms-jpq/coq.artifacts";
	-- Trouble
	"folke/trouble.nvim";
	-- Extra language tools
	"p00f/clangd_extensions.nvim";
	"simrat39/rust-tools.nvim";
	-- Git wriapper
	"tpope/vim-fugitive";
	-- Git integration
	"lewis6991/gitsigns.nvim";
	-- Alignment
	"junegunn/vim-easy-align";
	-- Icons
	"kyazdani42/nvim-web-devicons";
	-- Color previewer
	"norcalli/nvim-colorizer.lua";
}

require "plugins.setup"
