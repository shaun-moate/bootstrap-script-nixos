" customise Files call to respect .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden}), <bang>0))

" customise AllFiles call all files regardless of .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore}), <bang>0))

" key maps for vim-fzf
nmap <leader>f :Files<cr>
nmap <leader>F :AllFiles<cr>
nmap <leader>bb :Buffers<cr>
nmap <leader>gb :GBranches<cr>
