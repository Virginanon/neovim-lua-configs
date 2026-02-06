return {
    -- 右下角浮窗
    "j-hui/fidget.nvim",
    opts = {
        notification = {
            poll_rate = 10,
            window = {
                normal_hl = "Comment",
                winblend = 5,
                border = "single",
            },
        },
    },
}
