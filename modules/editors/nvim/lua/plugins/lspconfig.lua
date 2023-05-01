-- MASON.nvim
require("mason").setup()

-- MASON-LSPCONFIG.nvim
require("mason-lspconfig").setup({
    ensure_installed = { "tsserver", "pyright", "tailwindcss" },
      -- FIX: lua-language-server is manually installed as mason appraoch causes error ('rpc file not found') -> see nixos configurations for fix
    automatic_installation = false
    }
)

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LUA-LSPCONFIG
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  filetypes = { "lua" },
}

require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
}

require'lspconfig'.tailwindcss.setup{
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
}

require "lspconfig".pyright.setup{
  capabilities = capabilities,
  filetypes = { "python" }
}

