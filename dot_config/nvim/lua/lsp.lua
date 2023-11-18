local lsp = require "lspconfig"
local coq = require "coq".lsp_ensure_capabilities

local on_attach = function(_, bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gR", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gf", vim.lsp.buf.formatting, bufopts)
end

-- Zig
-- lsp.zls.setup(coq { cmd = { "C:\\code\\_compile\\zls\\zig-out\\bin\\zls.exe" } })
-- Go
lsp.gopls.setup(coq {})
-- Typescript
lsp.tsserver.setup(coq { on_attach = on_attach })
-- Python
lsp.jedi_language_server.setup(coq { on_attach = on_attach })
-- Rust
lsp.rust_analyzer.setup(coq {
	settings = {
		["rust_analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
			},
			cargo = {
				loadOutDirsFromCheck = true
			},
			procMacro = {
				enable = true
			}
		}
	},
	on_attach = on_attach
})
-- Lua
lsp.lua_ls.setup(coq {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = {
					"?/init.lua",
					"?.lua"
				}
			},
			workspace = {
				library = {
					"/usr/share/nvim/runtime/lua",
					"/usr/share/nvim/runtime/lua/lsp",
					"/usr/share/awesome/lib"
				}
			},
			completion = {
				enable = true,
			},
			diagnostics = {
				enable = true,
				globals = { "vim", "awesome", "client", "root" }
			},
			telemetry = {
				enable = false
			}
		}
	},
	on_attach = on_attach
})
-- Clangd
require "clangd_extensions".setup {
	server = {
		on_attach = on_attach
	}
}
