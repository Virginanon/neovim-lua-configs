vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
})

require("catppuccin").setup({ flavour = "auto" })
vim.cmd.colorscheme("catppuccin-nvim")

local MiniIcons = require("mini.icons")
MiniIcons.setup({})
MiniIcons.mock_nvim_web_devicons()
