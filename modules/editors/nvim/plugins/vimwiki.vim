let g:vimwiki_list = [{'path': '~/code/notes/', 'syntax': 'markdown', 'ext': '.md'},
                        \ {'path': '~/code/work-notes/aws', 'syntax': 'markdown', 'ext': '.md'},
                      \ {'path': '~/code/work-notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'
au FileType vimwiki setlocal wrap noexpandtab
