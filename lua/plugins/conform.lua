return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
            timeout_ms = 200,
            lsp_format = "fallback", -- 如果没有找到格式化工具，则尝试用 LSP
        },
    },
}
