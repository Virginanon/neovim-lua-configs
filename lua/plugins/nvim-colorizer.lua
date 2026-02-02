return {
    "NvChad/nvim-colorizer.lua", -- 推荐使用 NvChad 维护的这个 Fork 版本，更新更频繁
    config = function()
        require("colorizer").setup({
            filetypes = { "*" },
            user_default_options = {
                RGB = true,          -- #RGB hex codes
                RRGGBB = true,       -- #RRGGBB hex codes
                names = false,       -- "Name" codes like Blue or red
                RRGGBBAA = true,     -- #RRGGBBAA hex codes
                rgb_fn = true,       -- CSS rgb() and rgba() functions
                hsl_fn = true,       -- CSS hsl() and hsla() functions
                css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                mode = "background", -- 高亮模式: 'background', 'foreground', 'virtualtext'
                tailwind = true,
            },
        })
    end,
}
