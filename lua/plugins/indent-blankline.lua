return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl", -- 注意：v3 版本需要指定主模块为 ibl
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        indent = {
            char = "│", -- 默认辅助线字符
            tab_char = "│",
        },
        scope = {
            enabled = true,                      -- 开启当前作用域（括号范围）高亮
            show_start = true,                   -- 是否显示括号起始行的辅助线
            show_end = false,
            highlight = { "Function", "Label" }, -- 高亮颜色参考
        },
        exclude = {
            filetypes = { "help", "dashboard", "neo-tree", "lazy", "mason" },
        },
    },
}
