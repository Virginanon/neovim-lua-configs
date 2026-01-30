return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify", -- 可选，用于漂亮的通知弹窗,
            opts = {
                max_width = 50,
                render = "wrapped-compact",
            },
        },
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    poll_rate = 10,
                    window = {
                        normal_hl = "Comment",
                        winblend = 5,
                        border = "rounded",
                    },
                },
            },
        },
    },
    opts = {
        lsp = {
            -- 覆盖 lsp 的 hover 和 signature 帮助
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            hover = {
                enabled = true,
                silent = false, -- 如果设为 true，则在没有内容时不显示空框
            },
            signature = {
                enabled = false,
            },
            progress = { enabled = false },
        },

        views = {
            cmdline_popup = {
                position = {
                    row = "30%", -- 距离顶部 30%
                    col = "50%", -- 水平正中心
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
            --notify = {
            --    replace = true,
            --    merge = true,
            --    backend = "popup",
            --    win_options = {
            --        wrap = true,
            --        linebreak = true,
            --    },
            --    size = {
            --        width = 50,
            --        height = "auto",
            --    },
            --},
        },
        presets = {
            lsp_doc_border = true,  -- 给 LSP 文档添加边框！
            bottom_search = true,   -- 底部搜索栏
            command_palette = true, -- 命令面板
            long_message_to_split = true,
            inc_rename = false,     -- 如果你用了 inc-rename.nvim 就设为 true
        },
    },
    config = function(_, opts)
        local noice = require("noice")
        noice.setup(opts)
        vim.keymap.set("n", "<leader>nl", function()
            noice.cmd("last")
        end)
    end
}
