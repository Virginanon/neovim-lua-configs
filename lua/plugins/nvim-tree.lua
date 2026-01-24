return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    config = function ()
        require("nvim-tree").setup({
            view = {
                width = 35,
            },
            on_attach = function (bufnr)
                local api = require("nvim-tree.api")
                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.del("n", "<C-k>", { buffer = bufnr })
                vim.keymap.set("n", "I", api.node.show_info_popup, { desc = "nvim-tree: File Info", silent = true, noremap = true, nowait = true, buffer = bufnr })
            end
        })
    end
}
