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
          window = {
            titlebar = false;
          };
          fonts = {
            names = [ "JetBrains\ Mono" ];
            style = "Regular";
            size = 10.0;
          };
          bars = [
            {
              mode = "hide";
            }
          ];
          startup = [
            {
              command =
                "${pkgs.feh}/bin/feh --bg-fill ~/code/bootstrap-script/modules/themes/wallpaper/01.jpg";
              always = true;
              notification = false;
            }
            {
              command =
                "polybar";
              always = false;
              notification = false;
            }
          ];
        };
      };
    };
  };
}
