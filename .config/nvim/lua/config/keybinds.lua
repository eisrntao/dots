-- Unhighlight on esc
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>", { noremap = true })

-- Focus previous buffer
vim.keymap.set("n", "<tab>", "<C-6>", { noremap = true, desc = "Focus last buffer" })
vim.keymap.set("n", "<leader>m", "<cmd>bp<CR>", { noremap = true, desc = "󰮲 Focus previous buffer" })
vim.keymap.set("n", "<leader>i", "<cmd>bn<CR>", { noremap = true, desc = "󰮰 Focus next buffer" })

-- Toggle relative numbers
vim.keymap.set("n", "<leader>ur", "<cmd>set relativenumber!<CR>", { desc = " Toggle relative numbers" })

-- Buffer ops
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = " Delete buffer" })
vim.keymap.set("n", "<leader>bs", "<cmd>w<CR>", { desc = "󰆓 Save buffer" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "󰆓 Save buffer" })

-- Paste
vim.keymap.set("n", "<C-p>", "<cmd>pu<CR>")
