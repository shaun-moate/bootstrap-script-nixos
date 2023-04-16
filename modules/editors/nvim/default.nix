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

	        # Quality of Life
            vim-fugitive                                  # git wrapper similar to magit
            vim-gitgutter                                 # highlight uncommitted changes
	        vim-floaterm                                  # floating terminal support
            fzf-vim                                       # fuzzy finding in vim
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

          " key maps
          let mapleader="\<space>"

          nnoremap <C-c> "+y                           " copy to system clipboard
          map <C-y> "+p                                " paste from system clipboard
          map gf :edit <cfile><cr>                     " jump to file

          " plugins
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/fugitive.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/floaterm.vim
          source ~/code/bootstrap-script/modules/editors/nvim/plugins/fzf.vim
        '';
      };
    };
  };
}
