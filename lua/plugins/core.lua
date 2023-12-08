-- LazyVim Core Plugin config
return {
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
}
