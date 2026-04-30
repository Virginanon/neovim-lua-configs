---------------------------------------------------------
-- options
---------------------------------------------------------

local opts = vim.o

opts.number = true
opts.relativenumber = true

opts.wrap = false

-- 缩进宽度
opts.tabstop = 2
opts.softtabstop = 2

-- 换行和 < / > / << / >>
opts.shiftwidth = 2
opts.shiftround = true
opts.breakindent = true

-- tab 行为
opts.expandtab = true
opts.smarttab = true
opts.list = true

-- 自动缩进
opts.autoindent = true
opts.smartindent = true

-- 窗口边框
opts.winborder = "rounded"

if vim.g.neovide then
	opts.guifont = "Maple Mono NF CN:h10"

	vim.g.neovide_opacity = 0.98
	vim.g.neovide_normal_opacity = 0.95
	vim.g.neovide_window_blurred = true
end

-- split window
opts.splitbelow = true
opts.splitright = true

opts.cursorline = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "css", "scss", "less" },
	callback = function()
		vim.opt_local.formatoptions:remove({ "o", "r" })
	end,
})
