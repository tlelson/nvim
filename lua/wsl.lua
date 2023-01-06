-- Fixes clipboard buffer +
vim.cmd [[
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
]]
