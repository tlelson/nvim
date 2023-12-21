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
      { "<leader>rg", "<cmd>execute 'Rg '<CR>", desc = "ripgrep (fzf)" },
      { "<leader>rgw", "<cmd>execute 'Rg ' . expand('<cword>')<CR>", desc = "ripgrep for word cusor is on (fzf)" },
      { "<leader>bl", "<cmd>execute 'BLines '<CR>", desc = "grep current buffer (fzf)" },
      {
        "<leader>blw",
        "<cmd>execute 'BLines ' . expand('<cword>')<CR>",
        desc = "grep current buffer for word cursor is on (fzf)",
      },
    },
    init = function()
      vim.cmd([[
        " By default it uses find and skips hidden files. This respects .ripgreprc
        let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore 2> /dev/null'

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
      ]])

      -- Modified version from: https://gist.github.com/davidmh/f35fba1f9cde176d1ec9b4919769653a#file-quickfix-fzf-vim
      -- Significant changes to allow previewing. The `column` and `options` are taken from fzf#grep command.
      vim.cmd([[
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
      ]])

      vim.cmd([[
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
      ]])
    end,
  },
}
