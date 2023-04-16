# -------------------------------------------------------------------------------------------------------------------
# modules/desktop/i3/Home.nix - i3 configuration
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ config, lib, pkgs, host, ... }:

{
  xsession = {
    enable = true;
    windowManager = {
      i3 = {
        enable = true;
        config = {
          terminal = "alacritty";
        };
      };
    };
  };
}
