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
            ensure_installed = { "lua_ls", "ts_ls", "html", "cssls" },
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

        vim.lsp.config("ts_ls", {
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
        vim.lsp.enable("ts_ls")
    end,
}
