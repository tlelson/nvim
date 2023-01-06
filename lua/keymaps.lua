-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
-- Neovim uses different navigation keys to normal vim. Resore:
keymap("t", "<C-w>h", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-w>j", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-w>k", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-w>l", "<C-\\><C-N><C-w>l", term_opts)
-- try these ones out
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- need clear bash command
keymap("t", "<C-l>", "<C-l>", term_opts)

-- Spell checking: Ctrl-f moves to the next error and chooses the first suggestion
keymap("i", "<c-f>", "<c-g>u<Esc>]s1z=`]a<c-g>u", opts)
keymap("n", "<c-f>", "]s1z=<c-o>", opts)

keymap("n", ";", ":", opts) -- who needs semi-colon
keymap("n", "<leader>nu", ":set nu!<CR>", opts)
keymap("n", "Q", "@q", opts) -- Make replaying macros faster

-- Split resizing
keymap("n", "<C-w>+", ":resize +10<CR>", opts)
keymap("n", "<C-w>-", ":resize -10<CR>", opts)
keymap("n", "<C-w>>", ":vert resize +10<CR>", opts)
keymap("n", "<C-w><", ":vert resize -10<CR>", opts)
keymap("n", "<C-w>]", ":vsplit +tag <C-r><C-w><CR>", opts) -- TODO: Test. The an escape \ has been removed

-- Plugin: FZF
keymap('n', 'q/', ':History:<CR>', opts)
keymap('n', '<leader>rg', ":execute 'Rg ' . expand('<cword>')<CR>", opts)
keymap('n', '<leader>bl', ":execute 'BLines ' . expand('<cword>')<CR>", opts)

-- Plugin: ToggleTerm 
keymap('n', '<leader>tt', ":ToggleTerm<CR>", opts)
keymap('n', '<leader>th', ":TermExec cmd='clear' dir='%:p:h'<CR>", opts)
keymap('n', '<leader>tv', ":TermExec cmd='clear' dir='%:p:h' direction=vertical size=100<CR>", opts)
keymap('n', '<leader>tq', ":TermExec cmd='exit'<CR>", opts)
-- Convert to function :TermPython
keymap('n', '<leader>tp',
  ":TermExec direction=vertical size=100 cmd='ipython --no-autoindent' dir='%:p:h'<CR>", opts)
keymap('n', '<leader>tr', ':ToggleTermSendCurrentLine<CR>', opts)
keymap('v', '<leader>tr', ':ToggleTermSendVisualSelection<CR>', opts)
keymap('n', '<leader>ta', ':TermExec cmd="!!"<CR>', opts)
-- 1. Clear term 
keymap('n', '<C-l>', ":TermExec cmd='clear'<CR>", opts)

-- Plugin: Fugitive
keymap("n", "<leader>gs", ":Git<CR>", opts)
keymap("n", "<leader>gl", ":Gclog<CR>", opts)
keymap("n", "<leader>ge", ":Gedit<CR>", opts)
keymap("n", "<leader>gb", ":Git blame<CR>", opts)

-- Plugin: Nerdcommenter
vim.api.nvim_set_keymap("n", "<C-_>",  "<leader>c<Space>", {})
vim.api.nvim_set_keymap("v", "<C-_>",  "<leader>c<Space>", {})
