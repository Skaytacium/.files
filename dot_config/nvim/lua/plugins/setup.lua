-- gruvbox
local gruvbox = require "../gruvbox"

-- treesitter
require "nvim-treesitter.install".compilers = { "gcc", "zig" }
require "nvim-treesitter.configs".setup {
	ensure_installed = { "bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "go", "gomod", "html", "javascript", "json", "lua", "make", "ninja", "python", "regex", "rust", "typescript", "yaml", "zig" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	}
}

-- barbar
require "barbar".setup {
	icons = {
		button = false,
		inactive = { button = false }
	},
	animation = false
}

-- gitsigns
require "gitsigns".setup {
	signcolumn = false,
	numhl = true,
}

-- nvim-colorizer
-- Waiting for https://github.com/norcalli/nvim-colorizer.lua/issues/96
-- require "colorizer".setup {}

-- lualine
require "lualine".setup {
	options = {
		icons_enabled = true,
		theme = {
			normal = {
				a = { bg = gruvbox.black, fg = gruvbox.white, gui = 'bold' },
				b = { fg = gruvbox.gray },
				c = { fg = gruvbox.gray },
			},
			insert = {
				a = { fg = gruvbox.light.blue },
				b = { fg = gruvbox.blue },
				c = { fg = gruvbox.blue },
			},
			visual = {
				a = { fg = gruvbox.light.yellow },
				b = { fg = gruvbox.yellow },
				c = { fg = gruvbox.yellow },
			},
			replace = {
				a = { fg = gruvbox.light.red },
				b = { fg = gruvbox.red },
				c = { fg = gruvbox.red },
			},
			command = {
				a = { fg = gruvbox.light.green },
				b = { fg = gruvbox.green },
				c = { fg = gruvbox.green },
			},
		},
		section_separators = "",
		component_separators = "",
	}
}

-- presence
require "presence":setup {
	neovim_image_text = "idk",
	main_image = "file"
}

-- telescope
local telescope = require "telescope"
telescope.setup()
telescope.load_extension("fzf")
telescope.load_extension("file_browser")

-- indent guides
require "ibl".setup {
	scope = { enabled = true },
}

-- context
require "treesitter-context".setup {
	patterns = {
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
		}
	}
}
