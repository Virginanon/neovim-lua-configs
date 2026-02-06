return {
    'akinsho/toggleterm.nvim',
    config = function()
        require("toggleterm").setup({
            -- 开启浮动模式
            direction = 'float',
            -- 浮动窗口样式
            float_opts = {
                border = 'single', -- 边框样式：'single' | 'double' | 'shadow' | 'curved'
                winblend = 3,      -- 窗口透明度
                width = function()
                    return math.ceil(vim.o.columns * 0.7)
                end,
                height = function()
                    return math.ceil(vim.o.lines * 0.8)
                end,
            },
            shell = "pwsh",
            -- 打开终端的快捷键
            open_mapping = [[<c-\>]],
        })

        -- 核心解决逻辑：在退出 Vim 前强制杀掉终端进程
        vim.api.nvim_create_autocmd("VimLeavePre", {
            callback = function()
                local terminals = require("toggleterm.terminal").get_all()
                for _, term in ipairs(terminals) do
                    if term.job_id then
                        local pid = vim.fn.jobpid(term.job_id)
                        vim.fn.system(string.format("taskkill /F /T /PID %d", pid))
                    end
                end
            end
        })
    end
}
