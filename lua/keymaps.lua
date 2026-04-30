---------------------------------------------------------
-- key maps
---------------------------------------------------------

vim.g.mapleader = " "
local map = vim.keymap.set
local function keymap_cfgs(desc)
  return { desc = desc, noremap = true, silent = true }
end

-- move cursor

map({ "n", "v" }, "<C-j>", "9j", keymap_cfgs("向下移动 9 行"))
map({ "n", "v" }, "<C-k>", "9k", keymap_cfgs("向上移动 9 行"))

map("n", "<leader>wl", "<C-w>l", keymap_cfgs("移动光标到右边的窗口"))
map("n", "<leader>wh", "<C-w>h", keymap_cfgs("移动光标到左边的窗口"))
map("n", "<leader>wj", "<C-w>j", keymap_cfgs("移动光标到上边的窗口"))
map("n", "<leader>wk", "<C-w>k", keymap_cfgs("移动光标到下边的窗口"))

-- yank and paste

map({ "n", "v" }, "<leader>0p", '"0p', keymap_cfgs("粘贴显式复制的内容"))
map({ "n", "v" }, "<leader>cy", '"+y', keymap_cfgs("复制到系统剪贴板"))
map({ "n", "v" }, "<leader>cp", '"+p', keymap_cfgs("从系统剪贴板粘贴"))

-- window

map("n", "<leader>ws", "5<C-w><", keymap_cfgs("横向缩小窗口"))
map("n", "<leader>ww", "5<C-w>>", keymap_cfgs("横向扩大窗口"))
