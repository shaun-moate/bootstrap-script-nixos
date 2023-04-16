# -------------------------------------------------------------------------------------------------------------------
# hosts/phoenix/Home.nix - common packages for phoenix machine
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ pkgs, ... }:

{
  imports =
    [
      ../../modules/desktop/i3/home.nix  #Window Manager
    ];

  home = {                                  # Specific packages for desktop
    packages = with pkgs; [
      firefox
    ];
  };
}
