-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--[[ Highlight on yank ]]
--See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Hack until I can work out why these are added
-- Fix Puts that end up with \r\n after them for who-knows-what reason
--local group = vim.api.nvim_create_augroup("dos-line-ending-remover", { clear = true })
--vim.api.nvim_create_autocmd("BufWritePre", { command = "%s/\r//g", group = group })
--vim.api.nvim_create_autocmd("BufWritePre", { command = ":%g/^\r\n/d | :%s/\r//g", group = group })
--
--local line_ending_grp = vim.api.nvim_create_augroup("LineEndingGroup", opts?)
--vim.api.nvim_create_autocmd("BufReadPost", {
--callback = function()
--vim.cmd([[
--if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
--\   let b:reload_dos = 1 |
--\   e ++ff=dos |
--\ endif
--]])
--end,
----group = highlight_group,
--nested = true,
--pattern = "*",
--})
