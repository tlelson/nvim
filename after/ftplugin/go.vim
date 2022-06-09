augroup go_autocmds
	autocmd!
	autocmd BufWritePre <buffer> Format
	" Add one for !goimports too
augroup end
