return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "LspAttach", -- 在 LSP 启动时加载
        priority = 1000,     -- 确保优先级够高
        config = function()
            -- 1. 必须关闭原生虚拟文本
            vim.diagnostic.config({ virtual_text = false })

            -- 2. 初始化插件
            require('tiny-inline-diagnostic').setup({
                preset = "classic", -- 风格预设: modern, classic, minimal 等
                options = {
                    -- 这里的设置决定了它是否显示在行下
                    show_source = true,                       -- 显示报错来源（如 lua_ls）
                    multiple_diagnostics_under_cursor = true, -- 重点：多条错误时全部显示
                    multilines = true,                        -- 允许跨行显示
                }
            })
        end
    }
}
