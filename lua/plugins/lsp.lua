return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "mypy",
        "cfn-lint",
        "golangci-lint",
        "bash-language-server",
        "actionlint",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- servers bellow will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        gopls = {},
        --golangci_lint_langserver = {},
      },
    },
  },
}
