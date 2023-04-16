let g:airline_theme='gruvbox'

let g:airline#extension#tabline#enabled = 1
let g:airline#extension#tabline#formatter = 'unique_tail_improved'
let g:airline#extension#branch#enabled = 1

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
