return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-web-devicons").setup { default = true }
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      update_cwd = true,
      hijack_cursor = true,
      view = { width = 30, side = "left" },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = { enable = true },
        icons = { show = { file=true, folder=true, folder_arrow=true, git=true } },
      },
    })
  end,
}
