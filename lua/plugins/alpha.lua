return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local drive = require("config.drive")

    dashboard.section.header.val = { 
                "███╗    ██╗  ██╗██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗    ███╗",
                "██╔╝    ╚██╗██╔╝██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║    ╚██║",
                "██║      ╚███╔╝ ██████╔╝██║   ██║██║   ██║██║██╔████╔██║     ██║",
                "██║      ██╔██╗ ██╔═══╝ ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ██║",
                "███╗    ██╔╝ ██╗██║     ╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ███║",
                "╚══╝    ╚═╝  ╚═╝╚═╝      ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚══╝",}
    dashboard.section.buttons.val = {
      dashboard.button("r", " Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("f", " Open file", ":lua require('config.drive').select_drive_popup()<CR>"),
      dashboard.button("e", " New file", ":ene<CR>"),
      dashboard.button("q", " Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)
  end
}
