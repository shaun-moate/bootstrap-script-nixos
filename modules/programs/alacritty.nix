# -------------------------------------------------------------------------------------------------------------------
# modules/programs/Alacritty.nix - preferred terminal emulator
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;

      settings = {
        window = {
          padding = {
            x = 6;
            y = 6;
          };
          opacity = 0.95;
        };

        scrolling = {
          history = 10000;
        };

        font = {
          size = 16.0;
          normal = {
            family = "JetBrains\ Mono";
            style = "Regular";
          };
          bold = {
            family = "JetBrains\ Mono";
            style = "Bold";
          };
          italic = {
            family = "JetBrains\ Mono";
            style = "Italic";
          };
        };

        offset = {
          x = 6;
          y = 6;
        };
      };
    };
  };
}
