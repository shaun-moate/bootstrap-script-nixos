vim.opt.runtimepath:append("/home/smoate/code/nvim-agenda")

require'nvim-agenda'.setup({
  keywords = {
    SUSPEND = { icon = "󱍥 ", color = "AgendaRed", telescope_color = "AgendaRedTransparentBg" },
    TODO = { icon = " ", color = "AgendaYellow", telescope_color = "AgendaYellowTransparentBg" },
    FOCUS = { icon = "󰈸 ", color = "AgendaOrange", telescope_color = "AgendaOrangeTransparentBg" },
    DONE = { icon = " ", color = "AgendaGreen", telescope_color = "AgendaGreenTransparentBg" },
  },
  telescope_keywords = { "SUSPEND", "TODO", "FOCUS" },
  theme = "gruvbox",
})

vim.api.nvim_set_keymap("n", "ft", ":AgendaTelescope<CR>", {})
