return {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x', -- 推荐使用稳定分支
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- 推荐安装 fzf 扩展以提升搜索性能
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                -- 这里可以配置 UI 风格、搜索过滤等
                path_display = { "smart" },
                mappings = {
                    i = {
                        -- 在插入模式下，用 <C-j>/<C-k> 上下移动选中项
                        ["<C-p>"] = require("telescope.actions").move_selection_previous,
                        ["<C-n>"] = require("telescope.actions").move_selection_next,
                        ["<C-d>"] = require("telescope.actions").delete_buffer,
                    },
                    n = {
                        ["dd"] = require("telescope.actions").delete_buffer,
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
