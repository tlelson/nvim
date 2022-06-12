# Neovim 

Based on [LunarVim's config](https://github.com/LunarVim/Neovim-from-scratch)

Most of this should remain fairly static. Files that might be edited more than most are:

- [pluggins](./lua/user/plugins.lua): Add/remove plug-ins
- [lsp servers](./lua/user/lsp/configs.lua#10): Add/remove lsp server
- [lsp server settings](./lua/user/lsp/settings): If lsp needs special config
- [null-ls overrides](./lua/user/lsp/null-ls.lua): Override LSP diagnostic or formatting. Don't forget to disable LSP at [lsp servers](./lua/user/lsp/handlers.lua#70)
