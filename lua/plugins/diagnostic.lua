vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})

local map = vim.keymap.set
local function keymap_cfgs(desc)
  return { desc = desc, noremap = true, silent = true }
end

map("n", "<leader>d", function ()
  vim.diagnostic.open_float({ scope = "cursor", border = "rounded" })
end, keymap_cfgs("切换诊断窗口"))
