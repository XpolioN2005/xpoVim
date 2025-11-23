return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  opts = {
    ensure_installed = { "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls" },
  },
  dependencies = {
    { "williamboman/mason.nvim", event = "VeryLazy", opts = {} },
    { "neovim/nvim-lspconfig", event = "LspAttach" },
  },

  config = function(_, opts)
    require("mason-lspconfig").setup(opts)

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local buf = ev.buf
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
        end

        -- Safe wrappers
        map("n", "<leader>r", function() vim.lsp.buf.rename() end, "Rename")
        map("n", "K", function() vim.lsp.buf.hover() end, "Hover")
        map("i", "<C-k>", function() vim.lsp.buf.signature_help() end, "Signature Help")
        map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, "Code Actions")
      end,
    })
  end,
}
