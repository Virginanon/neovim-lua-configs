vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

local Snacks = require("snacks")
Snacks.setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false }, -- 关闭这个选项，因为没有安装 lazy，会报错
	explorer = { enabled = true, replace_netrw = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = {
		enabled = true,
		sources = {
			explorer = {
				hidden = true,
				ignored = true,
				win = {
					list = {
						keys = {
							["<C-j>"] = "list_scroll_down",
							["<C-k>"] = "list_scroll_up",
						},
					},
				},
			},
		},
	},
	notifier = {
		enabled = true,
		timeout = 8000,
		style = "fancy",
		top_down = true,
		gap = 1,
		width = { min = 40, max = 0.5 },
		height = { min = 1, max = 0.6 },
		keep = function(notif)
			return notif.level == "warn" or notif.level == "error"
		end,
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	terminal = {
		shell = "pwsh",
		win = {
			style = "terminal",
			position = "float",
			width = 0.8,
			height = 0.8,
			border = "rounded",

			keys = {
				hide_terminal = {
					"<leader>th",
					function(self)
						self:hide()
					end,
					mode = "n",
					desc = "隐藏当前终端",
				},
				show_terminal_info = {
					"<leader>ti",
					function(self)
						local ok_key, key = pcall(vim.api.nvim_buf_get_var, self.buf, "snacks_terminal_key")
						local ok_name, name = pcall(vim.api.nvim_buf_get_var, self.buf, "snacks_terminal_name")

						if not ok_key then
							key = "<no key>"
						end
						if not ok_name then
							name = "<no name>"
						end
						Snacks.notify(string.format("key : %d\nname: %s", key, name), { title = "Snacks" })
					end,
					mode = "n",
					desc = "显示当前终端名称和编号",
				},
			},
		},
	},

	styles = {
		border = "rounded",
		notification = {
			wo = { wrap = true },
		},
	},
})

local map = vim.keymap.set
local function keymap_cfgs(desc)
	return { desc = desc, noremap = true, silent = true }
end

-- buffer

map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, keymap_cfgs("关闭当前 buffer"))

map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, keymap_cfgs("关闭其他 buffer"))

map("n", "<leader>ba", function()
	Snacks.bufdelete.all()
end, keymap_cfgs("关闭所有 buffer"))

map("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, keymap_cfgs("查找 buffer"))

-- file

map("n", "<leader>ff", function()
	Snacks.picker.files()
end, keymap_cfgs("查找文件"))

map("n", "<leader>ee", function()
	Snacks.explorer()
end, keymap_cfgs("切换资源管理器"))

-- notification

map("n", "<leader>nl", function()
	Snacks.notifier.show_history()
end, keymap_cfgs("显示 notification 历史记录"))

map("n", "<leader>nh", function()
	Snacks.notifier.hide()
end, keymap_cfgs("隐藏所有 notification"))

-- terminal management

local TERM_KEY = 0
for _, term in ipairs(Snacks.terminal.list()) do
	if term.buf and vim.api.nvim_buf_is_valid(term.buf) then
		local ok, key = pcall(vim.api.nvim_buf_get_var, term.buf, "snacks_terminal_key")
		key = tonumber(key)
		if ok and key then
			TERM_KEY = math.max(TERM_KEY, key)
		end
	end
end

map("n", "<leader>tt", function()
	local terms = Snacks.terminal.list()
	local picker_items = {}

	for _, term in ipairs(terms) do
		if term.buf and vim.api.nvim_buf_is_valid(term.buf) then
			local ok1, name = pcall(vim.api.nvim_buf_get_var, term.buf, "snacks_terminal_name")
			local ok2, key = pcall(vim.api.nvim_buf_get_var, term.buf, "snacks_terminal_key")
			key = tonumber(key)

			if ok1 and ok2 and key then
				table.insert(picker_items, {
					key = key,
					text = string.format("%3d. %s", key, name),
				})
			end
		end
	end
	table.sort(picker_items, function(a, b)
		return a.key < b.key
	end)

	Snacks.picker({
		title = "Select Snacks Terminal",
		layout = "select",
		focus = "input",
		show_empty = true,

		items = picker_items,
		format = "text",

		confirm = function(picker, item)
			local filter = picker:filter()
			local pattern = vim.trim((filter and filter.pattern) or "")
			picker:close()

			vim.schedule(function()
				if item then
					for _, term in ipairs(Snacks.terminal.list()) do
						if term.buf and vim.api.nvim_buf_is_valid(term.buf) then
							local ok, key = pcall(vim.api.nvim_buf_get_var, term.buf, "snacks_terminal_key")
							if ok and key == item.key then
								term:show()
								term:focus()
								return
							end
						end
					end
					Snacks.notify("Terminal no longer exists", { title = "Snacks", level = "warn" })
					return
				end

				if #pattern == 0 then
					Snacks.notify("Terminal name is empty", { title = "Snacks", level = "warn" })
					return
				end

				TERM_KEY = TERM_KEY + 1
				local new_term = Snacks.terminal.open("pwsh", { count = TERM_KEY })
				if new_term and new_term.buf and vim.api.nvim_buf_is_valid(new_term.buf) then
					pcall(vim.api.nvim_buf_set_var, new_term.buf, "snacks_terminal_key", TERM_KEY)
					pcall(vim.api.nvim_buf_set_var, new_term.buf, "snacks_terminal_name", pattern)
				end
			end)
		end,
	})
end, keymap_cfgs("打开终端列表"))
