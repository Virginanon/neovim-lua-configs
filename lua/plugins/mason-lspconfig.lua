return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                -- gh: 悬浮文档
                vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
                -- gd: 跳到定义 (Neovim 内置)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                -- gr: 跳到引用 (优先使用 Telescope)
                -- 放在这里是因为回调执行时，Telescope 通常已经加载好了
                local has_telescope, builtin = pcall(require, 'telescope.builtin')
                if has_telescope then
                    vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
                else
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                end
                -- gi 跳到实现处
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "跳转到实现", buffer = ev.buf })
            end,
        })

        require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "ts_ls", "vue_ls", "html", "emmet_ls", "cssls", "tailwindcss" },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        -- 核心：将 'vim' 设为全局变量
                        globals = { "vim" },
                    },
                    workspace = {
                        -- 让 LSP 认识 Neovim 运行时文件，提供更强的 API 补全
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        })
        vim.lsp.enable("lua_ls")

        vim.lsp.config("html", {
            on_attach = function(client, _)
                -- 禁掉 html lsp 丑陋的格式化能力
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
        })
        -- emmet_ls 提供输入标签名自动补全的能力
        vim.lsp.config("emmet_ls", {
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "scss", "sass", "less", "vue" },
        })
        vim.lsp.enable("html")
        vim.lsp.enable("emmet_ls")

        vim.lsp.config("tailwindcss", {
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "scss", "sass", "less", "vue" },
        })
        vim.lsp.enable("tailwindcss")

        local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
        local vue_plugin_path = mason_path .. "/vue-language-server/node_modules/@vue/language-server"
        vim.lsp.config("ts_ls", {
            filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vue_plugin_path,
                        languages = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
                    },
                },
            },
            settings = {
                javascript = {
                    suggest = { completeFunctionCalls = true },
                    format = { enable = true },
                },
                typescript = {
                    suggest = { completeFunctionCalls = true }
                },
            },
        })
        vim.lsp.config("vue_ls", {
            init_options = {
                vue = {
                    hybridMode = true,
                },
            },
        })
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("vue_ls")
    end,
}
