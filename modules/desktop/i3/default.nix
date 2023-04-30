# -------------------------------------------------------------------------------------------------------------------
# hosts/modules/i3/Default.nix - i3 configuration
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ config, lib, pkgs, host, ... }:

let
  monitor = with host;
    if hostName == "phoenix" then
      "${pkgs.xorg.xrandr}/bin/xrandr --mode 1920x1080 --pos 0x0 --rotate normal"
    else false;
in
{
  programs.dconf.enable = true;

  services = {
    xserver = {
      enable = true;

      layout = "us";                              # Keyboard layout
      exportConfiguration = true;                 # Keyboard layout

      displayManager = {                          # Display Manager
        defaultSession = "none+i3";               # none+i3 -> no real display manager
        lightdm = {
          enable = true;                          # Wallpaper and GTK theme
          greeters = {
            slick = {
              enable = true;
              theme.name = "Adwaita";
            };
          };
        };
      };

      windowManager = {
        i3 = {                                    # Window Manager
          enable = true;
        };
      };

      resolutions = [
        { x = 2880; y = 1800; }
      ];
    };
  };

  programs.zsh.enable = true;                     # Weirdly needs to be added to have default user on lightdm

  environment.systemPackages = with pkgs; [       # Packages installed
    xorg.xrandr
  ];

}
