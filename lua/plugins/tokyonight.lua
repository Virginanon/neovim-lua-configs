return {
    "folke/tokyonight.nvim",
    lazy = false,               -- 主题插件必须在启动时加载
    priority = 1000,            -- 确保在其他插件之前加载
    opts = {
        style = "night",        -- 推荐风格：'storm', 'moon', 'night', 'day'
        transparent = false,    -- 是否开启透明背景（Neovide 的透明度由全局变量控制）
        terminal_colors = true, -- 在终端中使用主题颜色
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- 背景样式设置：暗色调更适合 Neovide
            sidebars = "dark",
            floats = "dark",
        },
        on_highlights = function(hl, c)
            hl.Comment = {
                fg = "#7caea3",
                italic = true,
            }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd([[colorscheme tokyonight]])
    end,
}
