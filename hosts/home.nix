# -------------------------------------------------------------------------------------------------------------------
# hosts/Home.nix - common packages across all hosts
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ config, lib, pkgs, user, ... }:

{
  imports =                                   # import all packages
    (import ../modules/programs) ++
    (import ../modules/services);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      firefox           # Browser
    ];

    stateVersion = "22.05";
  };

  programs = {
    home-manager.enable = true;
  };

}
