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
            vim-gitgutter                                 # highlight uncommitted changes
	    vim-floaterm                                  # floating terminal support
           ];
        };
        customRC = ''
          set number
	  set relativenumber

	  " vim-floaterm config
          let g:floaterm_keymap_toggle = '<C-t>'
	  let g:floaterm_gitcommit='floaterm'
	  let g:floaterm_autoinsert=1
	  let g:floaterm_width=0.8
	  let g:floaterm_height=0.8
	  let g:floaterm_wintitle=0
	  let g:floaterm_autoclose=1
	  
        '';
      };
    };
  };
}
