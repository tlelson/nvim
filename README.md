# Neovim

Based on [TJ DeVries Kickstart config](https://github.com/nvim-lua/kickstart.nvim)

Most of this should remain fairly static. Files that might be edited more than most are:

- [pluggins](./lua/plugins.lua): Add/remove plug-ins
- [lsp servers](./lua/lsp/setup.lua): Add/remove lsp server
- [lsp server settings](./lua/lsp/serversettings): If lsp needs special config
- [null-ls overrides](./lua/lsp/null-ls.lua): Override LSP diagnostic or formatting. Don't forget to disable LSP at [lsp servers](./lua/user/lsp/handlers.lua#70)
