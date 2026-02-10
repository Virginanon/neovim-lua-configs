local opts = { silent = true, noremap = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- move
vim.keymap.set({ "n", "v" }, "<C-j>", "9j", opts)
vim.keymap.set({ "n", "v" }, "<C-k>", "9k", opts)

-- window
vim.keymap.set({ "n", "v" }, "<leader>wj", "<C-w>j", opts)
vim.keymap.set({ "n", "v" }, "<leader>wk", "<C-w>k", opts)
vim.keymap.set({ "n", "v" }, "<leader>wh", "<C-w>h", opts)
vim.keymap.set({ "n", "v" }, "<leader>wl", "<C-w>l", opts)

-- terminal
vim.keymap.set("t", "<C-`>", [[<C-\><C-n>]], opts)
