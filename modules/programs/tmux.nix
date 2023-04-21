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
    };
  };
}

