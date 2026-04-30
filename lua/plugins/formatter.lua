vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

-- 这是一套 Prettier CLI 参数，适用于 JavaScript / TypeScript / Vue / HTML / CSS 等前端相关文件的格式化。
local prettier_args = {
  -- 如果项目里有 .prettierrc / prettier.config.js / prettier.config.cjs，
  -- 就优先使用项目配置；没有项目配置时，才使用下面这些 CLI 参数。
  "--config-precedence",
  "prefer-file",

  -- 每行最大宽度
  "--print-width",
  "120",

  -- 缩进宽度
  "--tab-width",
  "2",

  -- 不使用 tab 缩进，使用空格
  "--no-use-tabs",

  -- 使用分号
  "--semi",

  -- JS / TS 字符串使用单引号
  "--single-quote",

  -- JSX 属性不使用单引号，仍然使用双引号
  "--no-jsx-single-quote",

  -- 对象属性只在必要时加引号
  "--quote-props",
  "as-needed",

  -- 尾随逗号使用 es5 风格
  "--trailing-comma",
  "es5",

  -- 对象大括号内部加空格：{ foo: 1 }
  "--bracket-spacing",

  -- 多行 HTML / JSX / Vue 标签的 > 不跟在最后一个属性后面
  "--no-bracket-same-line",

  -- 箭头函数参数总是加括号：(x) => x
  "--arrow-parens",
  "avoid",

  -- 固定使用 LF 换行
  "--end-of-line",
  "lf",

  -- HTML / Vue 空白处理按 CSS display 规则判断
  "--html-whitespace-sensitivity",
  "css",

  -- Vue SFC 中不额外缩进 <script> 和 <style> 内容
  "--no-vue-indent-script-and-style",

  -- 不强制每个属性单独一行，让 Prettier 自己判断
  "--no-single-attribute-per-line",

  -- Markdown 不强制重排段落换行
  "--prose-wrap",
  "preserve",

  -- 自动格式化嵌入语言，比如 Markdown 代码块、HTML 中的 CSS/JS
  "--embedded-language-formatting",
  "auto",
}

require("conform").setup({
  formatters_by_ft = {
    ["_"] = { "trim_whitespace", "trim_newlines" },

    lua = { "stylua" },

    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    vue = { "prettierd", "prettier", stop_after_first = true },

    json = { "prettierd", "prettier", stop_after_first = true },
    jsonc = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    scss = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    yaml = { "prettierd", "prettier", stop_after_first = true },
  },

  formatters = {
    prettier = {
      prepend_args = prettier_args,
    },
    prettierd = {
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/prettier-default.json",
      },
    },
  },
})

local map = vim.keymap.set
local function keymap_cfgs(desc)
  return { desc = desc, noremap = true, silent = true }
end

map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, keymap_cfgs("格式化当前 buffer"))

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(ev)
    require("conform").format({
      bufnr = ev.buf,
      lsp_format = "fallback",
    })
  end,
})
