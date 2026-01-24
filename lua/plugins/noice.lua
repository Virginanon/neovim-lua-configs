return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- 可选，用于漂亮的通知弹窗
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
    },
    views = {
    cmdline_popup = {
      position = {
        row = "40%", -- 距离顶部 40%，接近中心
        col = "50%", -- 水平正中心
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = "53%", -- 位于输入框下方一点点
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
  presets = {
      bottom_search = true,    -- 底部搜索栏
      command_palette = true,  -- 命令面板
      long_message_to_split = true,
      inc_rename = false,      -- 如果你用了 inc-rename.nvim 就设为 true
      lsp_doc_border = true,   -- 给 LSP 文档添加边框！
    },
  },
}
