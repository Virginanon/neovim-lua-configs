-- 基础按键设置 --

local global = vim.g
local keymaps = vim.keymap.set

global.mapleader = " "
local keymap_settings = { silent = true, noremap = true }

keymaps("n", "<C-j>", "9j", keymap_settings)
keymaps("n", "<C-k>", "9k", keymap_settings)
keymaps("v", "<C-j>", "9j", keymap_settings)
keymaps("v", "<C-k>", "9k", keymap_settings)

keymaps("n", ")", "^", keymap_settings)

keymaps("n", "S", "i<CR><ESC>", keymap_settings)

-- adjust window size
keymaps("n", "<C-S-b>", "5<C-w>>", keymap_settings)
keymaps("n", "<C-S-s>", "5<C-w><", keymap_settings)

-- move cursor to window
keymaps("n", "<A-h>", "<C-w>h", keymap_settings)
keymaps("n", "<A-l>", "<C-w>l", keymap_settings)
keymaps("n", "<A-j>", "<C-w>j", keymap_settings)
keymaps("n", "<A-k>", "<C-w>k", keymap_settings)

-- rename variable
keymaps("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", keymap_settings)
