return {
  { "tpope/vim-unimpaired" },
  { "tpope/vim-sensible" },
  { "tpope/vim-surround" },
  { "tpope/vim-endwise" },
  { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically },
  { "tpope/vim-abolish" },
  { "lunarvim/darkplus.nvim" },

  -- Configure LazyVim to use darkplus
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darkplus",
    },
  },
}
