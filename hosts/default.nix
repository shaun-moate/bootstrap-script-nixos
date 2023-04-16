# -------------------------------------------------------------------------------------------------------------------
# hosts/Default.nix - the different profiles that can be used when building NixOS.
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ lib, inputs, nixpkgs, home-manager, user, ... }:

let
  system = "x86_64-linux";                                  # System architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                              # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  virtual-machine = lib.nixosSystem {                       # base profile for virtual-machine, "phoenix"
    inherit system;
    specialArgs = {
      inherit inputs user;
      host = {
        hostName = "phoenix";
        mainMonitor = "Virtual-1";
      };
    };
    modules = [
      ./virtual-machine
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host = {
            hostName = "phoenix";
            mainMonitor = "Virtual-1";
          };
        };
        home-manager.users.${user} = {
          imports = [(import ./home.nix)] ++ [(import ./virtual-machine/home.nix)];
        };
      }
    ];
  };
}
