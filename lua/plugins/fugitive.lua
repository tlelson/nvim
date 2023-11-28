return {
  { "tpope/vim-rhubarb" }, -- Provides github linking for GBrowse! fugitive command },
  { "tommcdo/vim-fubitive" }, -- Bitbucket linking for GBrowse! },
  { "shumphrey/fugitive-gitlab.vim" }, -- Gitlab linking for GBrowse },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "git status" },
      { "<leader>gl", "<cmd>Gclog<CR>", desc = "git log" },
      { "<leader>ge", "<cmd>Gedit<CR>", desc = "switch to editable local version of file" },
      { "<leader>gb", "<cmd>Git blame<CR>", desc = "git blame" },
    },
  },
}
