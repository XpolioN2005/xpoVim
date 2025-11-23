require("lazy").setup({
  spec = {
    require("plugins.colorscheme"),
    require("plugins.telescope"),
    require("plugins.treesitter"),
    require("plugins.nvimtree"),
    require("plugins.lualine"),
    require("plugins.alpha"),
    require("plugins.indent"),
  },
  install = { colorscheme = { "kanagawa" } },
  checker = { enabled = false },
})
