vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

local nvim_treesitter = require("nvim-treesitter")

nvim_treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})
nvim_treesitter.install({
  "lua",
  "vim",
  "vimdoc",
  "javascript",
  "typescript",
  "tsx",
  "html",
  "css",
  "vue",
  "json",
  "markdown",
  "markdown_inline",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "typescriptreact",
    "html",
    "css",
    "vue",
    "json",
    "markdown",
  },
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)                                       -- 启用高亮
    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- 缩进
  end
})
