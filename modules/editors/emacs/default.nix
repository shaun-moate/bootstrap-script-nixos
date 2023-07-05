# -------------------------------------------------------------------------------------------------------------------
# modules/editors/emacs/Default.nix - preferred notes tool
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# 
# THIS CONFIGURATION IS NOT LEVERAGED; IS A PLACEHOLDER IF YOU WANT A MINIMAL INSTALLATION OF EMACS
# 
# -------------------------------------------------------------------------------------------------------------------

{ config, pkgs, ... }:

{
  services.emacs = {
    enable = true;
  };

  system.activationScripts = {
    emacs.text = ''
      source ${config.system.build.setEnvironment}
      CONFIG="/home/smoate/.emacs.d"

      if [ ! -d "$CONFIG" ]; then
        git clone git@github.com:shaun-moate/minimal-emacs.git $CONFIG
      fi
    '';

  };
}
