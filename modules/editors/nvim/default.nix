# -------------------------------------------------------------------------------------------------------------------
# modules/editors/nvim/Default.nix - preferred text editor
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true; 
      viAlias = true;
      vimAlias = true;

      configure = {
        packages.myVimPackages = with pkgs.vimPlugins; {
          start = [
            # Syntax Highlighting
            vim-nix
	        vim-markdown

	        # Git Workflow
            vim-fugitive                                  # git wrapper similar to magit
            vim-gitgutter                                 # highlight uncommitted changes

            # Terminal
	        vim-floaterm                                  # floating terminal support

            # Development
            nvim-lspconfig                                # native lsp for neovim
            mason-nvim                                    # lsp install helper
            mason-lspconfig-nvim                          # recommended lsp support for mason
            nvim-dap                                      # debug adaptor protocol
            nvim-lint                                     # linter
            formatter-nvim                                # formatter

            # Theme'ing
            vim-airline                                   # go to status and tablines
            vim-airline-themes                            # theme airline
            gruvbox                                       # colour scheme

            # File Navigation
            fzf-vim                                       # fuzzy finding in vim

            # Quality of Life
            vim-surround                                  # change parenthesis' quickly
            vim-commentary                                # comment out stuff quickly with `gcc`
           ];
        };
        customRC = ''
          " general settings
          set hidden
          set title
          set number
          set relativenumber
          set expandtab
          set shiftwidth=4
          set tabstop=4
          set nowrap

          " Theme(ing)
          colorscheme gruvbox
          set background=dark
          set laststatus=3                             " enforce global status bar (for window splits)

          " key maps
          let mapleader="\<space>"
          map gf :edit <cfile><cr>                     " jump to file
          nmap <leader>bk :bd<cr>                      " delete buffer
          nmap <leader>om :Mason<cr>                   " open mason

          vnoremap  <leader>y  "*y                     " copy(ing) to system clipboard
          nnoremap  <leader>Y  "*yg_
          nnoremap  <leader>y  "*y
          nnoremap  <leader>yy  "*yy

          nnoremap <leader>p "+p                       " paste(ing) to system clipboard
          nnoremap <leader>P "+P
          vnoremap <leader>p "+p
          vnoremap <leader>P "+P

          " plugins
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/fugitive.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/floaterm.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/fzf.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/airline.vim

          " language servers
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/mason.lua
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/mason-lspconfig.lua
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/lsp/pyright.lua
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/lsp/tsserver.lua
        '';
      };
    };
  };
}
