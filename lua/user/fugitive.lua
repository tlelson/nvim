local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gl", ":Gclog<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ge", ":Gedit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", opts)
