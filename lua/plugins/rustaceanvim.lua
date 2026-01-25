return {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    opts = {
        server = {
            cmd = function ()
                return { "rust-analyzer" }
            end,
            on_attach = function (_, bufnr)
                if vim.lsp.inlay_hint then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,
            default_settings = {
                ["rust_analyzer"] = {
                    inlayHints = {
                        bindingModeHints = { enable = true },
                        chainingHints = { enable = true },
                        closingBraceHints = { enable = true },
                        parameterHints = { enable = true },
                        typeHints = { enable = true },
                    }
                },
            },
        },
    },
    config = function (_, opts)
        vim.g.rustaceanvim = opts
    end
}
