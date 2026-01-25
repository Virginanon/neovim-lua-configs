return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- 重点：将延迟设短，这样你一按下按键它就跳出来
        delay = 500,
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
        layout = {
            align = "center", -- 居中显示更有视觉冲击力
        },
        -- 开启这个可以接管所有的按键回显
        show_help = true,
        show_keys = true,
    },
}
