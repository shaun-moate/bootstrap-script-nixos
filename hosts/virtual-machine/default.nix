# -------------------------------------------------------------------------------------------------------------------
# hosts/phoenix/Default.nix - packages for phoenix system
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ config, pkgs, ... }:

{
  imports =  [                                  # For now, if applying to other system, swap files
    ./hardware-configuration.nix                # Current system hardware config @ /etc/nixos/hardware-configuration.nix
    ../../modules/desktop/i3/default.nix        # Window Manager
  ];

# -------------------------------------------------------------------------------------------------------------------
# Boot Loader
# -------------------------------------------------------------------------------------------------------------------
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

# -------------------------------------------------------------------------------------------------------------------
# Screen Resolutions
# -------------------------------------------------------------------------------------------------------------------
  services = {
    xserver = {
      resolutions = [
        { x = 1920; y = 1080; }
      ];
    };
  };
}
