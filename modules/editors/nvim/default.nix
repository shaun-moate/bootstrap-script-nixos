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

            # Preview Tools
            markdown-preview-nvim                         

            # Git Workflow
            vim-fugitive                                  # git wrapper similar to magit
            vim-gitgutter                                 # highlight uncommitted changes

            # Terminal
	          vim-floaterm                                  # floating terminal support

            # Coding (LSP, linting, formatting)
            nvim-lspconfig                                # native lsp for neovim
            mason-nvim                                    # lsp install helper
            mason-lspconfig-nvim                          # recommended lsp support for mason
            nvim-cmp                                      # autocompletion
            cmp-nvim-lsp                                  # engine to pass completions to cmp
            luasnip                                       # engine to pass snippets to cmp

            # Theme'ing
            vim-airline                                   # go to status and tablines
            vim-airline-themes                            # theme airline
            gruvbox                                       # colour scheme

            # File Navigation
            #fzf-vim                                       # fuzzy finding in vim
            telescope-nvim                                # fuzzy finding across vim
            minimap-vim                                   # blazingly fast minimap
            nvim-tree-lua                                 # blazingly fast file navigation
            nvim-web-devicons                             # required tree icons 

            # Quality of Life
            vim-surround                                  # change parenthesis' quickly
            vim-commentary                                # comment out stuff quickly with `gcc`

            # Note-taking
            vimwiki                                       # simple note-taking plugin
           ];
        };
        customRC = ''
          " general settings
          set hidden
          set title
          set number
          set relativenumber
          set expandtab
          set shiftwidth=2
          set tabstop=2
          set nowrap

          " VimWiki
          set nocompatible
          filetype plugin on
          syntax on

          " Theme(ing)
          colorscheme gruvbox
          set guifont=Hack:12
          set laststatus=3                             " enforce global status bar (for window splits)

          " key maps
          let mapleader="\<space>"
          nnoremap <leader>x :call utils#save_and_exec()<cr>
          map gf :edit <cfile><cr>                     " jump to file
          nmap <leader>bk :bd<cr>                      " delete buffer
          nmap <leader>ol :Mason<cr>                   " open mason
          nmap <leader>of :NvimTreeToggle<cr>          " open nvim-tree
          nmap <leader>tn :FloatermNew tmux-sessionizer<cr>

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
          "source ~/code/bootstrap-script/modules/editors/nvim/plugins/fzf.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/telescope.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/airline.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/vimwiki.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/minimap.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/markdown-preview.vim

          " language servers
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/plugins/lspconfig.lua
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/plugins/completions.lua

          " file Navigation
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/plugins/nvim-web-devicons.lua
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/plugins/telescope.lua
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/plugins/nvim-tree.lua

          " local plugin development
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/utils.vim
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/plugins/globals.lua
          luafile ~/code/bootstrap-script/modules/editors/nvim/lua/plugins/nvim-agenda.lua

         '';
        };
      };
    };
  }
