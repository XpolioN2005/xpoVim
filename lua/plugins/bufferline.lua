return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "v4.*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      show_buffer_close_icons = true,     -- show close icon per buffer
      show_close_icon = true,             -- show main close icon
      indicator = {
        style = "underline",              -- underline active buffer
      },
      show_tab_indicators = false,        -- disable italic-style tab indicators
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    local map = vim.keymap.set
    -- Switch buffers
    map('n', '<leader>h', ':BufferLineCyclePrev<CR>', { desc = "Previous Buffer" })
    map('n', '<leader>l', ':BufferLineCycleNext<CR>', { desc = "Next Buffer" })

    -- Close current buffer
    map('n', '<leader>q', ':bdelete!<CR>', { desc = "Close Buffer" })
  end,
}
