return {
  {
    "junegunn/fzf",
    --build = "./install --all"
    build = function()
      vim.cmd("call fzf#install()")
    end,
  },
  {
    "junegunn/fzf.vim",
    dependecies = { "junegunn/fzf" },
    lazy = false,
    keys = {
      { "q/", ":History:<CR>", desc = "command history override (fzf)" },
      { "<leader>rg", "<cmd>execute 'Rg ' . expand('<cword>')<CR>", desc = "ripgrep (fzf)" },
      { "<leader>bl", "<cmd>execute 'BLines ' . expand('<cword>')<CR>", desc = "grep current bugger (fzf)" },
    },
  },
}
