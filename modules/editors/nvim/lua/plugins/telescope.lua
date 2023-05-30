require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '.gitignore'
    },
  },
}

vim.api.nvim_set_keymap("n", "fb", "<cmd>Telescope buffers<cr>", {})
vim.api.nvim_set_keymap("n", "fc", "<cmd>Telescope commands<cr>", {})
vim.api.nvim_set_keymap("n", "fd", "<cmd>Telescope lsp_definitions<cr>", {})
vim.api.nvim_set_keymap("n", "ff", "<cmd>Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "fg", "<cmd>Telescope live_grep<cr>", {})
vim.api.nvim_set_keymap("n", "fh", "<cmd>Telescope help_tags<cr>", {})
vim.api.nvim_set_keymap("n", "fk", "<cmd>Telescope keymaps<cr>", {})
vim.api.nvim_set_keymap("n", "fm", "<cmd>Telescope man_pages<cr>", {})
vim.api.nvim_set_keymap("n", "fr", "<cmd>Telescope lsp_references<cr>", {})
