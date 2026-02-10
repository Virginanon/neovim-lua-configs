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
}
