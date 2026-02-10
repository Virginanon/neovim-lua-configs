return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            explorer = { enabled = true },  -- 文件浏览器
            picker = { enabled = true },    -- 选择器（类似 Telescope）

            notifier = { enabled = true },  -- 漂亮的通知系统
            dashboard = { enabled = true }, -- 启动界面
            indent = { enabled = true },    -- 缩进线
            input = { enabled = true },     -- 更好的 UI 输入框
            statuscolumn = { enabled = true }, -- 侧边栏状态列
            words = { enabled = true },     -- 光标下相同单词高亮

            bigfile = { enabled = true },
            terminal = {
                enabled = true,
                win = {
                    width = 0.6,
                    height = 0.8,
                    border = "rounded",
                    style = "terminal",
                },
            },
        },
        keys = {
            -- explorer and picker
            { "<leader>ee", function() Snacks.explorer() end, desc = "File Explorer" },
            { "<leader>eb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>ef", function() Snacks.picker.files() end, desc = "Find Files" },
            { "<leader>eg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
            { "<leader>er", function() Snacks.picker.recent() end, desc = "Recent" },

            -- terminal
            { "<leader>tp", function() Snacks.terminal("pwsh") end, desc = "Terminal (pwsh)" },
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {},
    },
}
