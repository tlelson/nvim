require "plugins"
require "options"
require "keymaps"
require "autocommands"
require "commands"
require "lsp"

-- OS specific settings
local uname = vim.loop.os_uname()
if string.find(uname.release, "WSL") then
	print("OS: WSL ...")
	require "wsl"
end
