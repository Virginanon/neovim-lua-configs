return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
        { "<leader>ee", "<cmd>NvimTreeToggle<CR>",   desc = "Toggle NvimTree" },
        { "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "Find File" },
        { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse All Dir" },
        { "<leader>er", "<cmd>NvimTreeRefresh<CR>",  desc = "Refresh Work Tree" },
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = function()
                    local percentage = 0.23;
                    return math.floor(vim.opt.columns:get() * percentage)
                end,
                adaptive_size = true,
            },
            update_focused_file = {
                enable = true,
                update_root = false,
                ignore_list = {},
            },
            renderer = {
                highlight_opened_files = "all",
                highlight_git = true,
            },
            filesystem_watchers = {
                enable = true,
                debounce_delay = 50,
                ignore_dirs = {
                    "target",
                    "node_modules",
                    "build",
                    "%.git",
                },
            },
            filters = {
                custom = { "^.git$" },
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")
                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.del("n", "<C-k>", { buffer = bufnr })
                vim.keymap.set("n", "I", api.node.show_info_popup,
                    { desc = "nvim-tree: File Info", silent = true, noremap = true, nowait = true, buffer = bufnr })
            end
        })
    end
}
