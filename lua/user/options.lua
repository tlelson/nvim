local options = {
  autochdir = true, -- Changes working dir to current file.  Could be a nightmare. Testing only at this stage.
  backup = false,                          -- creates a backup file
  --clipboard = "unnamedplus",               -- deleting text will overwrite the system clipboard. set to reg "+ manually
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone" },		   -- for cmp: remove "noselect"
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  -- mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- case sensitive when an upper case char is used
  smartindent = false,                     -- This is apparently depricated in favor of cindent :help for deets
  splitbelow = false,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- This stuff is set by vim-sleuth
  --expandtab = false,                       -- convert tabs to spaces
  --shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 4 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications

  -- Mine
  wrapscan = false,                        -- If searching in a macro you don't want it repeating forever
  foldmethod = "indent",
  foldnestmax = 10,
  foldlevel = 1,
  scrollbind = false,
  cindent = false, 			   -- This should only be set for C files.  It jumps to 0 when you hit #
  autoindent = true,
  listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<",
  textwidth = 120			   -- Arbitary but practical for splitscreen vim on a laptop. Override in ftplugin files
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- My Config
local global_variables = {
  -- NETRW
  netrw_banner = 0,
  netrw_liststyle = 3,
  netrw_preview = 1, -- preview vertically
  netrw_winsize = 15,
  -- netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+', -- TODO: work out how to fix this
}

for k, v in pairs(global_variables) do
  vim.g[k] = v
end

-- Efficiency
vim.cmd [[ 
  " Auto paste toggle before and after paste - Never Remove!!
	  let &t_SI .= "\<Esc>[?2004h"
	  let &t_EI .= "\<Esc>[?2004l"
	  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
	  function! XTermPasteBegin()
	    set pastetoggle=<Esc>[201~
	    set paste " let &paste = 1
	    return ""
	  endfunction
]]
