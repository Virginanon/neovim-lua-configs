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
                layout_strategy = 'flex',
                layout_config = {
                    flex = {
                        flip_columns = 100,
                    },
                    horizontal = {
                        preview_width = 0.6,
                        preview_cutoff = 0,
                    },
                    vertical = {
                        preview_height = 0.5,
                        preview_cutoff = 0,
                    },
                },

                -- 这里可以配置 UI 风格、搜索过滤等
                path_display = { "smart" },
                mappings = {
                    i = {
                        -- 在插入模式下，用 <C-j>/<C-k> 上下移动选中项
                        ["<C-p>"] = actions.move_selection_previous,
                        ["<C-n>"] = actions.move_selection_next,
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
