-- 4. lsp cnofigs

vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})
require("mason").setup()

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "Snacks" } },
			workspace = { library = { vim.env.VIMRUNTIME } },
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.config("vtsls", {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
	},
})
vim.lsp.enable({ "vtsls", "vue_ls" })
vim.lsp.enable("html")
vim.lsp.enable("cssls")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
	callback = function(ev)
		local bufnr = ev.buf

		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true, desc = desc, buffer = bufnr })
		end

		map("n", "<leader>k", function()
			vim.lsp.buf.hover({ max_width = 80, max_height = 20 })
		end, "Lsp: 打开悬浮文档")
		map({ "n" }, "<leader>s", function()
			vim.lsp.buf.signature_help({ max_width = 80, max_height = 12 })
		end, "Lsp: 函数签名帮助")
		map({ "i" }, "<C-s>", vim.lsp.buf.signature_help, "Lsp: 函数签名帮助")
		map("n", "<leader>gd", Snacks.picker.lsp_definitions, "Lsp: 跳转到定义")
		map("n", "<leader>gD", Snacks.picker.lsp_declarations, "LSP: 跳转到声明")
		map("n", "<leader>gi", Snacks.picker.lsp_implementations, "LSP: 跳转到实现")
		map("n", "<leader>gt", Snacks.picker.lsp_type_definitions, "LSP: 跳转到类型定义")
		map("n", "<leader>gr", Snacks.picker.lsp_references, "LSP: 查找引用")
		map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: 重命名")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code Ation")
	end,
})
