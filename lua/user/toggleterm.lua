local Terminal  = require('toggleterm.terminal').Terminal
local ipython = Terminal:new({
  cmd = "ipython --no-autoindent",
  hidden = true,
  direction = "vertical", -- the layout for the terminal, same as the main config options
  dir = '%:p:h', -- the directory for the terminal
  size = 100,
  close_on_exit = true, -- close the terminal window when the process exits
  --highlights = table -- a table with highlights
  --env = table -- key:value table with environmental variables passed to jobstart()
  --clear_env = bool -- use only environmental variables from `env`, passed to jobstart()
  --on_open = fun(t: Terminal) -- function to run when the terminal opens
  --on_close = fun(t: Terminal) -- function to run when the terminal closes
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- callbacks for processing the output
  --on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
  --on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
  --on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
})
vim.api.nvim_create_user_command("TermIpython", function()
  ipython:toggle()
end, {})

local htop = Terminal:new({
  cmd = "btm",
  --hidden = true,
  direction = "float",
  on_open = function(term)
    vim.cmd("startinsert!")
    --vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})

vim.api.nvim_create_user_command("Htop", function()
  htop:toggle()
end, {})

