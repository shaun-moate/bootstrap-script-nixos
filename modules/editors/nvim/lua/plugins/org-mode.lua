-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {'org'},
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'},
}

require('orgmode').setup({
  org_default_notes_file = '~/personal/notes/zettelkasten/*',
})
