let @i = "import ipdb; ipdb.set_trace()"
setlocal textwidth=98

"Not working at the moment. Where does Format come from? One of the LSPs?
"augroup py_autocmds
	"autocmd!
	"autocmd BufWritePre *.py execute 'Format'
"augroup end
