# Neovim

Based on [TJ DeVries Kickstart config](https://github.com/nvim-lua/kickstart.nvim)

## Regular Updates
```vim
:PackerUpdate
:MasonUpdateAll					" Updates mason mananged packages
```

## Config Principals - (things you need to understand to manage config)

**Packer** installs plugins 
**Mason** installs 3rd party tools that are used by plugins. Just adding them to the nvim config will not necessarily install them. Add required ones to the list at `MasonInstallAll`

## Custom Linters
use nvim-lint.  See cfn-lint for an example

Most of this should remain fairly static. Files that might be edited more than most are:

- [pluggins](./lua/plugins.lua): Add/remove plug-ins
- [lsp servers](./lua/lsp/setup.lua): Add/remove lsp server
- [lsp server settings](./lua/lsp/serversettings): If lsp needs special config
- Text color/highlighting: add to `ensure_installed` in [treesitter.configs](./lua/plugins.lua)


## Debuging
  :checkhealth                                " Reports missing dependecies etc 

### Minimal config:
https://github.com/neovim/nvim-lspconfig/blob/master/test/minimal_init.lua

`vim --clean -u minimal_init.lua temp.py`

