-- Save log
--vim.o.verbose = 3
--vim.o.verbosefile = vim.fn.stdpath("config") .. "/error_log"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
