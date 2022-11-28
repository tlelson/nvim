require "user.options"
require "user.keymaps"
require "user.commands"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.treesitter"
require "user.fugitive"
require "user.nerdcommenter"
require "user.autopairs"
require "user.rainbow_csv"
require "user.lualine"
require "user.toggleterm"

-- OS specific settings
local uname = vim.loop.os_uname()
if string.find(uname.release, "WSL") then
	print("OS: WSL ...")
	require "user.wsl"
end
