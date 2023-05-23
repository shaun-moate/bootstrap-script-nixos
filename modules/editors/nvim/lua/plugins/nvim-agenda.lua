vim.opt.runtimepath:append("/home/smoate/code/nvim-agenda")

require'nvim-agenda'.setup({
  keywords = {
    SUSPEND = { icon = "󱍥 ", color = "AgendaRed" },
    TODO = { icon = " ", color = "AgendaYellow" },
    FOCUS = { icon = "󰈸 ", color = "AgendaOrange" },
    DONE = { icon = " ", color = "AgendaGreen" },
  },
  theme = "gruvbox",
  find_lines_keywords = { "SUSPEND", "TODO", "FOCUS" }
})

vim.api.nvim_set_keymap("n", "ft", ":AgendaTelescope<CR>", {})
