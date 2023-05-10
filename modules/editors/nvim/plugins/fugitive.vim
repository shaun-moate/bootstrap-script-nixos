" key map fugitive
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gb :Git branch<space>
nnoremap <space>gc :Git commit -v -q<CR>
nnoremap <space>gd :Git diff<CR>
nnoremap <space>ge :Git edit<CR>
nnoremap <space>gg :G<cr>
nnoremap <space>gl :silent! Git log<CR>:bot copen<CR>
nnoremap <space>gm :Git move<space>
nnoremap <space>go :Git checkout<space>
nnoremap <space>gp :Git grep<space>
nnoremap <space>gps :Git push<CR>
nnoremap <space>gpl :Git pull<CR>
nnoremap <space>gr :Git read<CR>
nnoremap <space>gs :Git status<CR>
nnoremap <space>gt :Git commit -v -q %:p<CR>
nnoremap <space>gw :Git write<CR><CR>
