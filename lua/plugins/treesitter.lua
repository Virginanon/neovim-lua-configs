return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.config",
    -- 重点：在最新版中，你不需要写 config 函数手动 require
    -- 直接把配置写在 opts 里，lazy 会自动调用正确的加载逻辑
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
                scope_decremental = "<TAB>",
            },
        },
        indent = { enable = true },
    },
}
