-- 基础选项设置 --

local opts = vim.o

opts.number = true
opts.relativenumber = true
opts.wrap = false

if vim.g.neovide then
    opts.guifont = "Maple_Mono_NL_NF_CN:Regular:h12"

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_left = 0
    vim.g.neovide_padding_right = 0

    -- 透明度：0.0 到 1.0 之间
    vim.g.neovide_opacity = 0.9
    -- 模糊程度：数值越大越模糊
    vim.g.neovide_window_blurred = true
    vim.g.neovide_blur_amount_x = 12.0
    vim.g.neovide_blur_amount_y = 12.0

    -- 配合 Catppuccin 的高级感：隐藏不必要的窗口装饰
    vim.g.neovide_window_floating_opacity = 0.9
    vim.g.neovide_floating_blur_amount_x = 5.0
    vim.g.neovide_floating_blur_amount_y = 5.0
    vim.g.neovide_floating_shadow = true
end

opts.expandtab = true -- 制表符转换为空格
opts.tabstop = 4      -- 制表符的空格数
opts.shiftwidth = 4   -- 自动缩进(>>, <<, 自动换行)的空格数
opts.softtabstop = 4  -- 软制表符宽度

opts.cursorline = true

vim.cmd("filetype plugin indent on")

vim.diagnostic.config({
    signs = true,     -- 在侧边栏显示图标
    underline = true, -- 给错误代码加下划线
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- 窗口标题
vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')} - Neovide"
