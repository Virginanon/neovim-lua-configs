return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")

        telescope.setup({
            defaults = {
                sorting_strategy = "ascending", -- 结果从上往下排
                layout_strategy = "horizontal", -- 横向布局
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                layout_config = {
                    horizontal = {
                        prompt_position = "top", -- 输入框在上方
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                -- UI 装饰
                prompt_prefix = " 🔍 ", -- 搜索符号
                selection_caret = "  ", -- 选中项的前缀
                entry_prefix = "  ",

                -- 搜索过滤
                path_display = { "smart" },
                file_ignore_patterns = {
                    "node_modules",
                    "%.git/",
                    "target/",
                    "vendor/",
                    "%.exe",
                    "%.lock",
                    "__pycache__/*",
                    "dist/",
                },

                mappings = {
                    i = {
                        -- 在插入模式下，用 <C-p>/<C-n> 上下移动选中项
                        ["<C-p>"] = actions.move_selection_previous,
                        ["<C-n>"] = actions.move_selection_next,
                        -- 在插入模式下，用 <C-j>/<C-k> 上下滚动预览
                        ["<C-j>"] = actions.preview_scrolling_down,
                        ["<C-k>"] = actions.preview_scrolling_up,
                        ["<C-h>"] = actions.preview_scrolling_left,
                        ["<C-l>"] = actions.preview_scrolling_right,

                        ["<C-d>"] = actions.delete_buffer,
                        ["<C-f>"] = action_layout.toggle_preview,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                        ["p"] = action_layout.toggle_preview,
                    },
                },
            },
        })

        -- 加载 fzf 扩展
        pcall(telescope.load_extension, "fzf")
    end,
    -- 使用 keys 属性可以实现“按需加载”（只有按下快捷键时才加载插件）
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "全局搜索 (Grep)" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "查找 Buffer" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "查看帮助文档" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "查看最近打开的文件" },
    },
}
