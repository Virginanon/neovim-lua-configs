return {
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup({
      -- 开启浮动模式
      direction = 'float',
      -- 浮动窗口样式
      float_opts = {
        border = 'curved', -- 边框样式：'single' | 'double' | 'shadow' | 'curved'
        winblend = 3,      -- 窗口透明度
      },
      shell = "pwsh",
      -- 打开终端的快捷键
      open_mapping = [[<c-\>]],
    })
  end
}
