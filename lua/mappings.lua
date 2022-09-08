-- more mappings are defined in `lua/config/which.lua`
local map = vim.keymap.set
local default_options = { silent = true }
local expr_options = { expr = true, silent = true }

-- Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- Use LSP for go to definition
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", default_options)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", default_options)

-- Better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', default_options)

-- Tab switch buffer
map("n", "<TAB>", "<cmd>bnext<CR>", default_options)
map("n", "<S-TAB>", "<cmd>bprev<CR>", default_options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", "<cmd>nohlsearch<Bar>:echo<CR>", default_options)

-- Resizing panes
map("n", "<Left>", "<cmd>vertical resize +1<CR>", default_options)
map("n", "<Right>", "<cmd>vertical resize -1<CR>", default_options)
map("n", "<Up>", "<cmd>resize -1<CR>", default_options)
map("n", "<Down>", "<cmd>resize +1<CR>", default_options)

-- Autocorrect spelling from previous error
map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", default_options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

-- move over a closing element in insert mode
map("i", "<C-l>", function()
  return require("functions").escapePair()
end, default_options)
