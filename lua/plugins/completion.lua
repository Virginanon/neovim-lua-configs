-- 3. complete

vim.pack.add({
  { src = "https://github.com/Saghen/blink.cmp",      version = "v1" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/zbirenbaum/copilot.lua" },
})

require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<M-l>",
      accept_word = "<M-w>",
      accept_line = "<M-e>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<M-c>",
    },
  },
  panel = {
    enabled = true,
  },
})

vim.keymap.set("i", "<M-p>", function() require("copilot.panel").toggle() end, { desc = "切换 Github Copilot Panel" })

require("blink.cmp").setup({
  keymap = {
    preset = "super-tab",
    ["<C-n>"] = {
      function(cmp)
        return cmp.select_next({ auto_insert = false })
      end,
      "fallback_to_mappings",
    },
    ["<C-p>"] = {
      function(cmp)
        return cmp.select_prev({ auto_insert = false })
      end,
      "fallback_to_mappings",
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  completion = {
    menu = {
      border = "rounded",
      max_height = 10,
      winblend = 0,
      draw = {
        columns = {
          { "kind_icon" },
          { "label",      "label_description", gap = 1 },
          { "source_name" },
        },
      },
    },
    documentation = {
      auto_show = true,
      window = {
        border = "rounded",
        winblend = 0,
      },
    },
  },
  fuzzy = {
    implementation = "lua",
  },
})

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    require("nvim-autopairs").setup({})
    require("nvim-ts-autotag").setup({})
  end
})
