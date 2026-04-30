vim.pack.add({
  { src = "https://github.com/brianhuster/live-preview.nvim" },
})

require("live-preview").setup()

local map = vim.keymap.set
local function keymap_cfgs(desc)
  return { desc = desc, noremap = true, silent = true }
end

map("n", "<leader>lps", "<cmd>LivePreview start<cr>", keymap_cfgs("打开 live-preview"))
map("n", "<leader>lpc", "<cmd>LivePreview close<cr>", keymap_cfgs("关闭 live-preview"))
