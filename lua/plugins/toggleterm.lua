return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<leader>tt", ":ToggleTerm<CR>", desc = "open terminal" },
      { "<leader>th", ":TermExec cmd='clear' dir='%:p:h'<CR>", desc = "open horiz term in cwd" },
      {
        "<leader>tv",
        ":TermExec cmd='clear' dir='%:p:h' direction=vertical size=100<CR>",
        desc = "open vert term in cwd",
      },
      { "<leader>tq", ":TermExec cmd='exit'<CR>", desc = "quit term" },
      {
        "<leader>tp",
        ":TermExec direction=vertical size=100 cmd='ipython --no-autoindent' dir='%:p:h'<CR>",
        desc = "python term",
      }, -- Convert to function :TermPython
      { "<leader>tr", ":ToggleTermSendCurrentLine<CR>", mode = { "n" }, desc = "send line to term" },
      { "<leader>tr", ":ToggleTermSendVisualLines<CR>", mode = { "v" }, desc = "send selection to term" },
      { "<leader>ta", ':TermExec cmd="!!"<CR>', desc = "run last command again" },
      { "<C-l>", ":TermExec cmd='clear'<CR>", desc = "clear term" }, -- 1. Clear term
    },
    opts = {
      tag = "*",
      autochdir = true,
      config = function()
        require("toggleterm").setup()
      end,
    },
  },
}
