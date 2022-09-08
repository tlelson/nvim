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
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--

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
keymap('n', '<leader>rg', ":execute 'RG ' . expand('<cword>')<CR>", opts)
keymap('n', '<leader>bl', ":execute 'BLines ' . expand('<cword>')<CR>", opts)
