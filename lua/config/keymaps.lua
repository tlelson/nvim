-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DELETE LazyVim Maps
--vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")
--vim.keymap.del({ "n" }, "<C-_>")
vim.keymap.del({ "t" }, "<C-k>") -- Disable in terminal as this is a bash combination

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
-- Set in LazyVim already ??
--vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
--vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
--vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
--vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist)

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
-- Neovim uses different navigation keys to normal vim. Resore:
keymap("t", "<C-w>h", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-w>j", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-w>k", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-w>l", "<C-\\><C-N><C-w>l", term_opts)
-- need clear bash command
keymap("t", "<C-l>", "<C-l>", term_opts)

-- Spell checking: Ctrl-f moves to the next error and chooses the first suggestion
keymap("i", "<c-f>", "<c-g>u<Esc>]s1z=`]a<c-g>u", opts)
keymap("n", "<c-f>", "]s1z=<c-o>", opts)

keymap("n", ";", ":", opts) -- who needs semi-colon
keymap("n", "<leader>nu", ":set nu!<CR>", opts)
keymap("n", "Q", "@q", opts) -- Make replaying macros faster

-- Plugin: Nerdcommenter
-- Tried to set these in the plugin itself but wouldn't work
keymap("n", "<C-_>", "<leader>c<Space>", {})
keymap("v", "<C-_>", "<leader>c<Space>", {})

-- Efficiency
keymap("n", "<leader>sr", ":%s#<C-R><C-W>#", {})
keymap("v", "<leader>sr", '"py | :%s#<C-R>p#', {})
