local opts = { noremap = true, silent = true }

-- Telescope
vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<C-b>", "<cmd>Telescope buffers<CR>", opts)
vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<C-h>", "<cmd>Telescope commands<CR>", opts)

-- NeoTree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
vim.keymap.set("n", "<leader>fe", "<cmd>Neotree focus filesystem<CR>", { desc = "Focus NeoTree filesystem" })

-- Common editor commands
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opts)          -- Save
vim.keymap.set("n", "<C-z>", "<cmd>undo<CR>", opts)       -- Undo
vim.keymap.set("n", "<C-y>", "<cmd>redo<CR>", opts)       -- Redo (VS Code style)

-- Text selection like VS Code
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all text" })

-- Navigation (VS Code style)
vim.keymap.set("n", "<C-Left>", "b", opts)              -- Previous word
vim.keymap.set("n", "<C-Right>", "w", opts)             -- Next word

-- Copy/Cut/Paste (VS Code style)
vim.keymap.set("v", "<C-c>", '"+y', opts)               -- Copy selection to system clipboard
vim.keymap.set("v", "<C-x>", '"+d', opts)               -- Cut selection to system clipboard
vim.keymap.set("n", "<C-v>", '"+P', opts)               -- Paste before cursor
vim.keymap.set("v", "<C-v>", '"+P', opts)               -- Paste in visual mode

