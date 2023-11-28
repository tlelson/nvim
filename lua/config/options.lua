-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
vim.opt.mouse = ""

-- OS specific settings
local uname = vim.loop.os_uname()
if string.find(uname.release, "WSL") then
  print("OS: WSL ...")
  -- Fix up clipboard settings
  vim.cmd([[
    let g:clipboard = {
    \   'name': 'myClipboard',
    \   'copy': {
    \      '+': ['clip.exe'],
    \      '*': ['clip.exe'],
    \    },
    \   'paste': {
    \      '+': ['powershell.exe', 'Get-Clipboard'],
    \      '*': ['powershell.exe', 'Get-Clipboard'],
    \   },
    \   'cache_enabled': 1,
    \ }
  ]])
end
