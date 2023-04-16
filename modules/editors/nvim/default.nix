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
        customRC = ''
          set number
        '';
        packages.myVimPackages = with pkgs.vimPlugins; {
          start = [
            vim-gitgutter
           ];
        };
      };
    };
  };
}
