function! GoFormat() abort
	" Save a view to restore afterwards
	let l:view = winsaveview()
	" Set a mark to return to
	normal mL

	silent execute '%!goimports'

	if v:shell_error
		execute 'undo'		
		execute 'lua vim.diagnostic.setloclist()'
	else
		" Return to previous location
		normal `L
	endif

	call winrestview(l:view)
endfunction

augroup go_autocmds
	autocmd!
	autocmd BufWritePre *.go call GoFormat()
augroup end
