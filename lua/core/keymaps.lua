local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<C-b>", "<cmd>Telescope buffers<CR>", opts)
vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>e", function()
  vim.cmd("silent! NvimTreeToggle")
end, { desc = "Toggle NvimTree" })
