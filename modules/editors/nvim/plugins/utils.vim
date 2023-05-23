if !exists('*utils#save_and_exec()')
  function! utils#save_and_exec() abort
    if &filetype == 'lua'
      :silent! write
      :luafile %
    elseif &filetype == 'vim'
      :silent! write
      :source %
    endif

    return
  endfunction
endif

