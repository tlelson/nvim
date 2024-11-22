-- LazyVim Core Plugin config
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  { "mini.nvim", enabled = false },
  { "flash.nvim", enabled = false },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    --keys = {
    --{ "<leader>bl", false }, -- using this for :BLines (Ref: ./lua/plugins/fzf.lua)
    --},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ge", false }, -- use this for fugitive :Gedit. For now
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>hs", mode = { "n", "v" }, ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
      { "<leader>hr", mode = { "n", "v" }, ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      top_down = false,
      timeout = 1,
      stages = "fade",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "dhall",
        "typescript",
      })
    end,
  },
}
