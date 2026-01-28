return {
    'echasnovski/mini.indentscope',
    version = false, -- 使用最新版
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        -- 符号设置
        symbol = "│",
        -- 作用域查找选项
        options = {
            -- 是否跨越空行，这能让它更像 VS Code
            border = "both",
            -- 即使光标在括号边缘也显示
            indent_at_cursor = true,
            -- 判定作用域的方式，'both' 意味着它会同时寻找起始和结束
            try_as_border = true,
        },
    },
    init = function()
        -- 禁用某些不需要显示的窗口类型
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {
                'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy',
                'mason', 'notify', 'toggleterm', 'lazyterm',
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
}
