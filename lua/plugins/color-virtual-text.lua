vim.pack.add({
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/uga-rosa/ccc.nvim" },
})

vim.o.termguicolors = true

require("nvim-highlight-colors").setup({
	-- 渲染方式，virtual / background / foreground
	render = "virtual",
	-- 当 render = "virtualtext" 时，使用这个符号作为虚拟文本显示颜色
	virtual_symbol = "⬛", -- ■
	-- virtual_symbol_position 可以是 "inline"，"eol" 和 "eow"，分别表示在行内，行尾或单词尾显示虚拟文本
	virtual_symbol_position = "inline",
	-- 色块前后间距
	virtual_symbol_prefix = "",
	virtual_symbol_suffix = "",

	-- 基础颜色格式
	enable_hex = true,
	enable_short_hex = true,
	enable_rgb = true,
	enable_hsl = true,

	-- CSS 变量，例如 var(--primary-color)
	enable_var_usage = true,

	-- 命名颜色，例如 red / blue / green
	enable_named_colors = false,

	-- 如果写 Tailwind，可以打开；否则建议关掉，避免多余扫描
	enable_tailwind = false,
})

require("ccc").setup({
	highlighter = {},
})

local map = vim.keymap.set
local function keymap_cfgs(desc)
	return { desc = desc, noremap = true, silent = true }
end

map("n", "<leader>cs", "<cmd>CccPick<cr>", keymap_cfgs("Color: 打开调色板"))
map("n", "<leader>ct", "<cmd>HighlightColors Toggle<cr>", keymap_cfgs("Color: 切换颜色虚拟文本"))
