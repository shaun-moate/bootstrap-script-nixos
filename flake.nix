# -------------------------------------------------------------------------------------------------------------------
# Flake.nix - my personal flake configuration
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{
  description = "My Personal NixOS System Flake Configuration";

# -------------------------------------------------------------------------------------------------------------------
# Flake Inputs
# ++ hint: all flake references used to build my NixOS setup. These are dependencies.
# -------------------------------------------------------------------------------------------------------------------
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";                  # NixPkgs -> unstable (live on the edge!)

      home-manager = {                                                      # Home Manager: user package management
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

    };

# -------------------------------------------------------------------------------------------------------------------
# Flake Outputs
# ++ hint: the flakes that we create using the above inputs
# -------------------------------------------------------------------------------------------------------------------
  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let                                                                     # Variables that can be used in the config files.
      user = "smoate";                                                      # set username - aka. /home/${user}
    in
    {
      nixosConfigurations = (
        import ./hosts {                                                    # imports ./hosts/default.nix
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user;
        }
      );
    };
}
