setlocal textwidth=0
command! FixHTML execute ":%s/<[^>]*>/\r&\r/g" | execute ":%g/^$/d" | normal gg=G
