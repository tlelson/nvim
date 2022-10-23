-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'E501' },
          maxLineLength = 100
        },
        pylsp_mypy = {
            enabled = true,
            live_mode = true,
            strict = true,
        }
      }
    }
  }
}
