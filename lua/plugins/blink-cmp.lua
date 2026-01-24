vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP 悬浮文档" })
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover, {
--     border = "rounded",
--   }
-- )
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
--   vim.lsp.handlers.signature_help, {
--     border = "rounded",
--   }
-- )

return {
    "Saghen/blink.cmp",
    version = "*",
    opts = {
        keymap = {
            preset = "default",
            ["<C-j>"] = { "scroll_documentation_down", "fallback" },
            ["<C-k>"] = { "scroll_documentation_up", "fallback" },
            ["<Tab>"] = { "accept", "fallback" },
        },
        sources = {
            default = { "lsp", "path", "snippets" },
        },
        completion = {
              menu = {
                  border = "rounded",
                  draw = {
                      columns = {
                          { "label", "label_description", gap = 1 },
                          { "kind_icon", "kind", gap = 1 },
                          { "source_name" },
                      },
                  },
              },
              documentation = {
                  window = { border = "rounded" },
                  auto_show = true,
              },
        },
        signature = {
            enabled = true,
            window = { border = "rounded" },
        },
    }
}

