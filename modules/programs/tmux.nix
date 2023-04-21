# -------------------------------------------------------------------------------------------------------------------
# modules/programs/Tmux.nix - workspace management
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      keyMode = "vi";
      baseIndex = 1;
      shell = "/run/current-system/sw/bin/zsh";
      disableConfirmationPrompt = true;
      extraConfig = ''
        bind-key Tab display-menu -T "#[align=centre]tmux(ler)" \
          "'... your friendly tmux helper ...'" "" "" \
          "" \
          "New Session"             a 'send-keys tn Enter' \
          "" \
          "Switch Session (detail)" s 'choose-tree -Zw' \
          "Switch Session"          S 'choose-session -Zw' \
          "Last Session"            l 'switch-client -l' \
          "" \
          "Exit"                    q 'detach' \
      '';
    };
  };
}

