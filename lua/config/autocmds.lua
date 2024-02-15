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

local remove_whitespace = vim.api.nvim_create_augroup("RemoveWhitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = remove_whitespace,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
