return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local custom_catppuccin = require('lualine.themes.catppuccin')

    -- 将状态栏的中间部分背景设为 NONE (透明)
    custom_catppuccin.normal.bg = 'NONE'
    custom_catppuccin.insert.bg = 'NONE'
    custom_catppuccin.visual.bg = 'NONE'
    custom_catppuccin.replace.bg = 'NONE'
    custom_catppuccin.command.bg = 'NONE'

    require("lualine").setup({
      options = {
        -- 核心配置：使用 catppuccin 主题
        theme = custom_catppuccin,
        -- 分隔符样式：你可以换成 '', '' 等更酷炫的图标
        component_separators = { left = '|', right = '|'},
        -- section_separators = { left = '', right = ''},
        -- 全局状态栏（Neovim 0.7+ 建议开启，让底部只有一行状态栏）
        globalstatus = true,
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = ' ' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location', separator = { right = ' ' }, left_padding = 2 },
            --{
            --  require("noice").api.status.command.get,
            --  cond = require("noice").api.status.command.has,
            --  color = { fg = "#ff9e64" },
            --},
        },
      },
    })
  end,
}
