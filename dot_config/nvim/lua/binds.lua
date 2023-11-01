local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope
map("n", "<A-p>f", ":Telescope find_files<CR>", opts)
map("n", "<A-p>p", ":Telescope oldfiles<CR>", opts)
map("n", "<A-p>n", ":Telescope file_browser<CR>", opts)

-- Trouble
map("n", "<A-t>t", ":TroubleToggle<CR>", opts)
map("n", "<A-t>w", ":TroubleToggle workspace_diagnostics<CR>", opts)
map("n", "<A-t>d", ":TroubleToggle lsp_definitions<CR>", opts)

-- Vim
map("n", "<A-f>", "gg=G''", opts)
-- map("n", "<A-r>", ":execute 'silent! write !doas tee % > /dev/null'<BAR>edit!<CR>", opts)

map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
map("n", "o", "o<ESC>", opts)
map("n", "O", "O<ESC>", opts)

map("i", "<C-c>", "<ESC>", opts)
-- Buffer shifting
map("i", "<A-k>", "<ESC>:BufferNext<CR>", opts)
map("i", "<A-j>", "<ESC>:BufferPrevious<CR>", opts)
map("", "<A-k>", "<ESC>:BufferNext<CR>", opts)
map("", "<A-j>", "<ESC>:BufferPrevious<CR>", opts)
map("", "<A-K>", "<ESC>:BufferMoveNext<CR>", opts)
map("", "<A-J>", "<ESC>:BufferMovePrevious<CR>", opts)
map("n", "<A-c>", ":BufferClose!<CR>", opts)
