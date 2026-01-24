return {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {
        -- 默认配置就很棒，它会自动显示 A-Z 和 a-z 的标记
        default_mappings = true,
        builtin_marks = { ".", "<", ">", "^" }, -- 也可以显示一些内置的特殊标记
        refresh_interval = 250,
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        bookmark_0 = {
            sign = "⚑", -- 你甚至可以自定义书签的图标
            virt_text = "hello world",
        },
    },
}
