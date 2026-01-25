return {
    "Saghen/blink.cmp",
    version = "*",
    opts = {
        keymap = {
            preset = "default",
            ["<C-j>"] = { "scroll_documentation_down", "fallback" },
            ["<C-k>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "show_documentation", "hide_documentation", "fallback" },
            ["<Tab>"] = { "accept", "fallback" },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
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
    },
}
