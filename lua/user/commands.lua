-- Not available until 0.7.0
-- vim.api.nvim_add_user_command(
--   "TestCmd",
--   function()
--     print("TestCmd has been called!")
--   end,
--   {},
-- )

-- vim.api.nvim_add_user_command('Upper', function() end, {})

-- Misc
vim.cmd [[ 
  command SudoWrite :execute ':silent w !sudo tee % > /dev/null' | :edit! 

  " JSON fixer
  function JSON()
    execute ":%!python -m json.tool --sort-keys"
  endfun
  command JSON call JSON()

  " Unfixer - Shrink all formated json to one line
  " and remove unnessesary spaces UNTESTED
  function JSONunpretty()
    %j 						" Remove linebreaks
    :%s/\v([{\[:,"]) /\1/g  " Space after
    :%s/\v ([}\]:,"])/\1/g  " Space before
  endfun

  " XML formatter
  function XML()
    %!python -c "import sys, xml.dom.minidom as x; print(x.parse(sys.stdin).toprettyxml())"
    g/^\s*$/d
    :execute "normal gg=G"
  endfunction
  command XML call XML()
]]


-- FZF
vim.cmd [[ 
  " By default it uses find and skips hidden files. This respects .ripgreprc
  let $FZF_DEFAULT_COMMAND = 'rg --files 2> /dev/null'

  " Have Ripgrep start from the current buffers git root, not the cwd of the
  " file first opened in vim. Think scenario when you jumped to a
  " library
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \ 	"rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
    \   {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)

  " For when you have no git root or when you want to search
  " outside it.  Open a file below which you want to search then
  " RgCWD
  command! -bang -nargs=* RgCWD
    \ call fzf#vim#grep(
    \ 	"rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
    \   {'dir': expand('%:p:h')}, <bang>0)
]]
