" python.vim: settings for Python files

setlocal formatoptions=croql
setlocal nowrap

setlocal makeprg=python3\ %
setlocal errorformat=
  \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
  \%C\ \ \ \ %.%#,
  \%+Z%.%#Error\:\ %.%#,
  \%A\ \ File\ \"%f\"\\\,\ line\ %l,
  \%+C\ \ %.%#,
  \%-C%p^,
  \%Z%m,
  \%-G%.%#


if !exists("*s:run_file")
  function s:run_file()
    let l:cmd = " python3 " . expand("%") . "\<CR>"
    let l:bn = term_start(&shell, {'term_finish': 'close'})
    sleep 200m
    call term_sendkeys(l:bn, l:cmd)
  endfunction
endif

" run the current buffer
nnoremap <buffer> <silent>  <F9>          :<C-U>make<CR>
nnoremap <buffer> <silent>  <leader><F9>  :<C-U>call <SID>run_file()<CR>
