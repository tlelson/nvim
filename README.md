# Neovim config 

This is based on [LazyVim](https://github.com/LazyVim/LazyVim). It makes a lot of nice UI configurations that would take me too long to work out.

## Linters 

Configure them [here](./lua/plugins/lint.lua).  Don't forget to add the linter to the list of [automatically installed executables](./lua/plugins/lsp.lua)

## Keymaps 

[Delete LazyVim Keymaps](https://github.com/tlelson/nvim/blob/7746897bea8df019cc09c4204e53181331b7bd67/lua/config/keymaps.lua#L5-L8)
To delete plugin keymaps do it at the plugin itself [like so](https://github.com/tlelson/nvim/blob/7746897bea8df019cc09c4204e53181331b7bd67/lua/plugins/core.lua#L12-L17)
