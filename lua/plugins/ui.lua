return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- 确保主题在所有插件之前加载
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- 选一个味道：latte, frappe, macchiato, mocha
                transparent_background = false, -- 如果你想要透明背景，改为 true
                term_colors = true,
                integrations = {
                    -- 核心插件集成
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- 对 snacks.nvim 的深度支持
                    snacks = true,
                    -- LSP 语义高亮支持
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "undercurl" },
                            hints = { "undercurl" },
                            warnings = { "undercurl" },
                            information = { "undercurl" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                },
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
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
                        row = "20%", -- 距离顶部 30%
                        col = "50%", -- 水平正中心
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
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
            vim.keymap.set("n", "<leader>ml", function()
                noice.cmd("last")
            end)
        end
    }
}
