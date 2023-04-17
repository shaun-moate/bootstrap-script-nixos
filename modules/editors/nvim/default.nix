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

          nnoremap <C-c> "+y                           " copy to system clipboard
          map <C-y> "+p                                " paste from system clipboard
          map gf :edit <cfile><cr>                     " jump to file

          nmap <leader>bk :bd<cr>                      " delete buffer

          " plugins
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/fugitive.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/floaterm.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/fzf.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/airline.vim
        '';
      };
    };
  };
}
