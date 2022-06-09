vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
" Reset the background to the normal one in the terminal
highlight Normal guibg=none guifg=none
]]
