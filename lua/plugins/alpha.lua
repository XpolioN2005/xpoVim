return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local home = vim.fn.stdpath("config")  -- Neovim config directory

    -- ASCII header
    dashboard.section.header.val = { 
      "███╗    ██╗  ██╗██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗    ███╗",
      "██╔╝    ╚██╗██╔╝██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║    ╚██║",
      "██║      ╚███╔╝ ██████╔╝██║   ██║██║   ██║██║██╔████╔██║     ██║",
      "██║      ██╔██╗ ██╔═══╝ ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ██║",
      "███╗    ██╔╝ ██╗██║     ╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ███║",
      "╚══╝    ╚═╝  ╚═╝╚═╝      ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚══╝",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("r", " Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("f", " Open file", ":lua require('config.drive').select_drive_popup()<CR>"),
      dashboard.button("n", " New file", ":ene<CR>"),
      dashboard.button("l", " Open Lazy", ":Lazy<CR>"),
      dashboard.button("c", " Open Config", ":Telescope find_files cwd=" .. home .. "<CR>"),  -- NEW
      dashboard.button("q", " Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)
  end
}
