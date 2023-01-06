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
  command! -bang -nargs=* RG
    \ call fzf#vim#grep(
    \ 	"rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({
    \     'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2],
    \     'options': ['--prompt', 'RG> '],
    \   }),
    \   <bang>0)

  " FZF for all vim runtime files
  command! VimRuntime call fzf#run(fzf#wrap({
    \ 'source': split(substitute(execute('scriptnames'), ' *\d*: ', '', 'g'), "\n"),
    \ 'options': ['--prompt', 'Vim> ', '--nth=1'],
    \ }))
]]

-- Modified version from: https://gist.github.com/davidmh/f35fba1f9cde176d1ec9b4919769653a#file-quickfix-fzf-vim
-- Significant changes to allow previewing. The `column` and `options` are taken from fzf#grep command.
vim.cmd [[
  function! s:format_qf_line(line)
    let parts = split(a:line, ':')
    return { 'filename': parts[0]
           \,'lnum': parts[1]
           \,'col': parts[2]
           \,'text': join(parts[3:], ':')
           \ }
  endfunction

  " This basically turns the quickfix list into the output format of vimgrep
  " ref: rg --vimgrep
  function! s:qf_to_fzf(key, line) abort
    let l:filepath = expand('#' . a:line.bufnr)
    return l:filepath . ':' . a:line.lnum . ':' . a:line.col . ':' . a:line.text
  endfunction

  function! s:fzf_to_qf(filtered_list) abort
    let list = map(a:filtered_list, 's:format_qf_line(v:val)')
    if len(list) > 0
      call setqflist(list)
      copen
    endif
  endfunction

  command! FzfQF call fzf#run(fzf#wrap(fzf#vim#with_preview({
        \ 'source': map(getqflist(), function('<sid>qf_to_fzf')),
        \ 'sink*':   function('<sid>fzf_to_qf'),
        \ 'column':  1,
        \ 'options': ['--ansi', '--prompt', 'FzfQF> ',
        \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
        \             '--delimiter', ':', '--preview-window', '+{2}-/2']
        \ })))

  "FZF Buffer Delete
  " https://www.reddit.com/r/neovim/comments/mlqyca/fzf_buffer_delete/
  function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
  endfunction

  function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
  endfunction

  command! BuffersDelete call fzf#run(fzf#wrap(fzf#vim#with_preview({
    \ 'source': s:list_buffers(),
    \ 'sink*': { lines -> s:delete_buffers(lines) },
    \ 'column':  1,
    \ 'options': ['--multi', '--reverse', '--bind', 'ctrl-a:select-all+accept',
    \             '--preview-window', '+{2}-/2']
  \ })))
]]

vim.cmd [[
function! s:format_qf_line(line)
  let parts = split(a:line, ':')
  return { 'filename': parts[0]
         \,'lnum': parts[1]
         \,'col': parts[2]
         \,'text': join(parts[3:], ':')
         \ }
endfunction

function! s:qf_to_fzf(key, line) abort
  let l:filepath = expand('#' . a:line.bufnr . ':p')
  return l:filepath . ':' . a:line.lnum . ':' . a:line.col . ':' . a:line.text
endfunction

function! s:fzf_to_qf(filtered_list) abort
  let list = map(a:filtered_list, 's:format_qf_line(v:val)')
  if len(list) > 0
    call setqflist(list)
    copen
  endif
endfunction

command! FzfQF call fzf#run({
      \ 'source': map(getqflist(), function('<sid>qf_to_fzf')),
      \ 'down':   '20',
      \ 'sink*':   function('<sid>fzf_to_qf'),
      \ 'options': '--reverse --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all --prompt "quickfix> "',
      \ })
]]
