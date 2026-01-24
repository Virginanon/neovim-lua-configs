return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- 确保主题优先加载
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- 变体选择：latte, frappe, macchiato, mocha
      transparent_background = true, -- **关键**：开启透明背景，配合 Neovide
      term_colors = true,
      integrations = {
        nvimtree = true,  -- 完美支持 nvim-tree
        telescope = {
          enabled = true,
          style = "nvchad" -- telescope 的外观风格
        },
        notify = true,
        mini = true,
        -- 如果有其他插件，可以在此开启支持
      },
    })

    -- 立即应用主题
    vim.cmd.colorscheme("catppuccin")
  end,
}
