-- Treesitter
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

-- Barbar
require "barbar".setup {
	icons = {
		button = false,
		inactive = { button = false }
	},
	animation = false
}

-- Lualine
require "lualine".setup {
	options = {
		icons_enabled = true,
		theme = "gruvbox_dark",
		section_separators = "",
		component_separators = "",
	},
}

-- Presence
require "presence":setup {
	neovim_image_text = "what should i put here :thinking:",
	main_image = "file"
}

-- Telescope
local telescope = require "telescope"
telescope.setup()
telescope.load_extension("fzf")
telescope.load_extension("file_browser")

-- Indent guides
require "ibl".setup {
	scope = { enabled = true },
}

-- Context
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
