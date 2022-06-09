local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>dh", ":lua vim.diagnostic.hide(nil, 0)<CR>", opts)
keymap("n", "<leader>ds", ":lua vim.diagnostic.show(nil, 0)<CR>", opts)
