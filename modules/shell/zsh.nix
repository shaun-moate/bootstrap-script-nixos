# -------------------------------------------------------------------------------------------------------------------
# modules/shell/Zsh.nix - oh-my-zsh
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;                             # auto suggest options and highlights syntax, searches in history for options
      syntaxHighlighting.enable = true;
      enableCompletion = true;

      shellAliases = {
        ll = "ls -al";                                           # list all line items with details
        tn = "tmux-sessionizer";                                 # create new project in tmux
        ww = "vim index.md";                                     # when in VimWiki directory open the index file (mimics VimWiki key bind <leader>ww)
      };

      ohMyZsh = {
        enable = true;                                           # install and implement oh-my-zsh
      };

      histSize = 10000;                                          # max size of 10,000 lines in history

      shellInit = ''                                             # set spaceship as theme
        PATH="$PATH:$HOME/code/bootstrap-script/bin"

        source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
        autoload -U promptinit; promptinit
      '';

    };
  };
}
