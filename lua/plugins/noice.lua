--return {
--    enabled = false,
--    "folke/noice.nvim",
--    event = "VeryLazy",
--    dependencies = {
--        "MunifTanjim/nui.nvim",
--        {
--            "rcarriga/nvim-notify", -- 可选，用于漂亮的通知弹窗,
--            opts = {
--                max_width = 50,
--                render = "wrapped-compact",
--            },
--        },
--    },
--    opts = {
--        routes = {
--            {
--                filter = {
--                    event = "msg_show",
--                    any = {
--                        { find = "written" },
--                    },
--                },
--                opts = { skip = false },
--                view = "notify",
--            },
--        },
--        lsp = {
--            -- 覆盖 lsp 的 hover 和 signature 帮助
--            override = {
--                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--                ["vim.lsp.util.stylize_markdown"] = true,
--                ["cmp.entry.get_documentation"] = true,
--            },
--            hover = {
--                enabled = true,
--                silent = false, -- 如果设为 true，则在没有内容时不显示空框
--            },
--            signature = {
--                enabled = false,
--            },
--            progress = { enabled = false },
--        },
--        views = {
--            cmdline_popup = {
--                position = {
--                    row = "30%", -- 距离顶部 30%
--                    col = "50%", -- 水平正中心
--                },
--                size = {
--                    width = 60,
--                    height = "auto",
--                },
--            },
--        },
--        presets = {
--            lsp_doc_border = true,  -- 给 LSP 文档添加边框！
--            bottom_search = true,   -- 底部搜索栏
--            command_palette = true, -- 命令面板
--            long_message_to_split = true,
--            inc_rename = false,     -- 如果你用了 inc-rename.nvim 就设为 true
--        },
--    },
--    config = function(_, opts)
--        local noice = require("noice")
--        noice.setup(opts)
--        vim.keymap.set("n", "<leader>ml", function()
--            noice.cmd("last")
--        end)
--    end
--}

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        -- 1. 禁用所有不相关的功能接管
        messages = { enabled = false },  -- 禁用消息重定向到 Noice
        notify = { enabled = false },    -- 禁用 Noice 接管通知
        popupmenu = { enabled = false }, -- 禁用 Noice 的补全菜单界面

        -- 2. 彻底禁用命令行和搜索栏美化
        cmdline = { enabled = false },
        search = { enabled = false },

        lsp = {
            -- 保持 hover 开启
            hover = {
                enabled = true,
                silent = true,
                opts = { border = { style = "single" }, },
            },
            signature = { enabled = false }, -- 签名帮助如果也不想要可以关掉
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            progress = { enabled = false },
        },

        -- 3. 预设配置：只开启文档边框
        presets = {
            bottom_search = false,   -- 禁用底部搜索栏美化
            command_palette = false, -- 禁用命令面板
            long_message_to_split = false,
            inc_rename = false,
            lsp_doc_border = true, -- 核心：只保留文档边框美化
        },

        -- 4. 强制视图样式
        views = {
            hover = {
                border = { style = "single" },
                position = { row = 2, col = 2 },
            },
        },
    },
}
