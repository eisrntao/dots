-- Unhighlight on esc
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>", { noremap = true })

-- Focus previous buffer
vim.keymap.set("n", "<tab>", "<C-6>", { noremap = true, desc = "Focus previous buffer" })

-- Toggle relative numbers
vim.keymap.set("n", "<leader>ur", "<cmd>set relativenumber!<CR>", { desc = " Toggle relative numbers" })

-- Browserlike controls
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = " Delete buffer" })
vim.keymap.set("n", "<leader>bs", "<cmd>w<CR>", { desc = "󰆓 Save buffer" })
