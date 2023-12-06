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
}
