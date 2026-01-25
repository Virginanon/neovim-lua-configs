-- 基础按键设置 --

local global = vim.g
local keymaps = vim.keymap.set

global.mapleader = " "
local keymap_settings = { silent = true, noremap = true }

keymaps("n", "<C-j>", "9j", keymap_settings)
keymaps("n", "<C-k>", "9k", keymap_settings)
keymaps("v", "<C-j>", "9j", keymap_settings)
keymaps("v", "<C-k>", "9k", keymap_settings)

-- window 相关 mappings

keymaps("n", "<leader>wl", "<C-w>l", keymap_settings)
keymaps("n", "<leader>wh", "<C-w>h", keymap_settings)
keymaps("n", "<leader>wj", "<C-w>j", keymap_settings)
keymaps("n", "<leader>wk", "<C-w>k", keymap_settings)

keymaps("n", "<C-S-l>", "5<C-w>>", keymap_settings)
keymaps("n", "<C-S-s>", "5<C-w><", keymap_settings)

keymaps("n", "<leader>h", ":bp<CR>", keymap_settings)
keymaps("n", "<leader>l", ":bn<CR>", keymap_settings)
keymaps("n", "<leader>q", ":bd<CR>", keymap_settings)
keymaps("n", "<leader>p", ":ls<CR>", keymap_settings)

keymaps("n", "<A-h>", "<C-w>h", keymap_settings)
keymaps("n", "<A-l>", "<C-w>l", keymap_settings)
keymaps("n", "<A-j>", "<C-w>j", keymap_settings)
keymaps("n", "<A-k>", "<C-w>k", keymap_settings)
