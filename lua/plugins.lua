---------------------------------------------------------
-- plugin manager
---------------------------------------------------------

require("plugins.theme")
require("plugins.snacks")
require("plugins.lsp")
require("plugins.diagnostic")
require("plugins.treesitter")
require("plugins.completion")
require("plugins.live-preview")
require("plugins.formatter")
require("plugins.color-virtual-text")

------------------------------------------------------------
--- 在悬浮窗口中显示插件列表
------------------------------------------------------------

vim.api.nvim_create_user_command("PackList", function()
	local plugins = vim.pack.get()
	local lines = {}

	for _, plugin in ipairs(plugins) do
		local status = plugin.active and "[✔ active]" or "[✘ inactive]"
		local name = plugin.spec.name or "<unknown>"
		local path = vim.fn.fnamemodify(plugin.path or "", ":~:.")

		table.insert(lines, string.format("%-12s %-30s %s", status, name, path))
	end

	if #plugins == 0 then
		table.insert(lines, "No plugins found.")
	end

	local max_width = 0
	for _, line in ipairs(lines) do
		max_width = math.max(max_width, vim.fn.strdisplaywidth(line))
	end

	local width = math.min(max_width + 4, math.floor(vim.o.columns * 0.85))
	table.insert(lines, 1, string.rep("-", width))
	table.insert(lines, 1, "vim.pack plugins:")
	local height = math.min(#lines, math.floor(vim.o.lines * 0.7))

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].swapfile = false
	vim.bo[buf].modifiable = false
	vim.bo[buf].filetype = "packlist"

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
		title = " vim.pack plugins ",
		title_pos = "center",
	})

	vim.wo[win].wrap = false
	vim.wo[win].cursorline = true
end, {})

------------------------------------------------------------
--- 更新所有插件
------------------------------------------------------------

vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, {})

------------------------------------------------------------
--- 清理所有未激活的插件
------------------------------------------------------------

vim.api.nvim_create_user_command("PackClean", function()
	local inactive_plugins = vim.iter(vim.pack.get())
		:filter(function(plugin)
			return not plugin.active
		end)
		:map(function(plugin)
			return plugin.spec.name
		end)
		:totable()

	if #inactive_plugins == 0 then
		Snacks.notify("No inactive plugins to clean.", { title = "PackClean", level = "info" })
		return
	end

	local ok, err = pcall(vim.pack.del, inactive_plugins)
	if not ok then
		Snacks.notify("Failed to clean inactive plugins:\n" .. tostring(err), {
			title = "PackClean",
			level = "error",
		})
	else
		Snacks.notify("Cleaned inactive plugins:\n" .. table.concat(inactive_plugins, "\n"), {
			title = "PackClean",
			level = "info",
		})
	end
end, {})
