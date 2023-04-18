# -------------------------------------------------------------------------------------------------------------------
# modules/programs/Picom.nix - get me some transparency/opacity
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ config, lib, pkgs, ... }:

{
  services = {
    picom = {
      enable = true;
      opacityRules = [                                # Opacity rules if transparency is prefered
          "95:class_i *= 'Alacritty'"
      ];                                              # Find with $ xprop | grep "WM_CLASS"
    };
  };
}
