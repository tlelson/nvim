let @i = "import ipdb; ipdb.set_trace()"
setlocal textwidth=98

augroup py_autocmds
	autocmd!
	autocmd BufWritePre *.py execute 'Format'
augroup end
