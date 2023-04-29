let g:vimwiki_list = [{'path': '~/personal/notes/', 'syntax': 'markdown', 'ext': '.md'},
                        \ {'path': '~/personal/work-notes/aws', 'syntax': 'markdown', 'ext': '.md'},
                      \ {'path': '~/personal/work-notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'
au FileType vimwiki setlocal wrap noexpandtab
