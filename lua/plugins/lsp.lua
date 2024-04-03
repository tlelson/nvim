return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "mypy",
        "cfn-lint",
        "golangci-lint",
        "bash-language-server",
        "actionlint",
        "dhall-lsp",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- Cusomise the keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      --keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
      -- disable a keymap
      keys[#keys + 1] = { "<C-k>", mode = { "i" }, false }
      -- add a keymap
      --keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,
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
