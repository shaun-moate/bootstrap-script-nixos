# -------------------------------------------------------------------------------------------------------------------
# hosts/configuration.nix - main system configuration
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{ config, lib, pkgs, inputs, user, ... }:

{
  imports =
    (import ../modules/editors) ++
    (import ../modules/shell) ++
    (import ../modules/cli);

# -------------------------------------------------------------------------------------------------------------------
# Users
# -------------------------------------------------------------------------------------------------------------------
  users.users.${user} = {                   # System User
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "password";
    shell = pkgs.zsh;                       # Default shell
  };
  security.sudo.wheelNeedsPassword = false; # User does not need to give password when using sudo.

# -------------------------------------------------------------------------------------------------------------------
# Internationalisation
# -------------------------------------------------------------------------------------------------------------------
  time.timeZone = "Europe/London";          # Time zone and internationalisation
  i18n = {
    defaultLocale = "en_GB.UTF-8";
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";                          # or us/azerty/etc
  };

# -------------------------------------------------------------------------------------------------------------------
# Environment Variables
# -------------------------------------------------------------------------------------------------------------------
  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

# -------------------------------------------------------------------------------------------------------------------
# System Packages (for all users)
# -------------------------------------------------------------------------------------------------------------------
  environment = {
    systemPackages = with pkgs; [               
      ansible                                   # ansible: automation scripting
      gnumake                                   # make: ability to run Makefile's
      ripgrep                                   # ripgrep: improved grep
      fzf                                       # fzf: the fuzzy finder
      #vim
      #git
    ];
  };

# -------------------------------------------------------------------------------------------------------------------
# Font Management
# -------------------------------------------------------------------------------------------------------------------
  fonts.fonts = with pkgs; [
    jetbrains-mono                              # niiiiiice
    font-awesome                                # font pack for icons
    source-code-pro                             # default fonts for spacemacs
    powerline                                   # powerline: status line fonts
  ];

# -------------------------------------------------------------------------------------------------------------------
# Networking
# -------------------------------------------------------------------------------------------------------------------
  networking = {
    firewall = {
      enable = false;                           # open all ports as on virtual machine for quality-of-life
    };
  };
  services.openssh = {
    enable = true;                              # enable ssh... because ssh is good
    settings = {
      passwordAuthentication = true;            # whether password authentication is allowed.
      permitRootLogin = "yes";                  # allow root user to ssh into system
    };
  };

  nix = {                                   # Nix Package Manager settings
# -------------------------------------------------------------------------------------------------------------------
# Garbage Collection
# -------------------------------------------------------------------------------------------------------------------
    settings ={
      auto-optimise-store = true;           # Optimise syslinks
    };
    gc = {                                  # Automatic garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };

# -------------------------------------------------------------------------------------------------------------------
# Flakes
# -------------------------------------------------------------------------------------------------------------------
    package = pkgs.nixVersions.unstable;    # Enable nixFlakes on system
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;        # Allow proprietary software.


# -------------------------------------------------------------------------------------------------------------------
# System Upgrades
# -------------------------------------------------------------------------------------------------------------------
  system = {                                # NixOS settings
    autoUpgrade = {                         # Allow auto update (not useful in flakes)
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };

# -------------------------------------------------------------------------------------------------------------------
# Custom Scripts
# ++ FIX: home-manager unable to find profile directory so need to create it (vm-only issue)
# ++ FIX: add $HOME/.zshrc to remove initial error when opening a shell demanding presence of this file
# -------------------------------------------------------------------------------------------------------------------
    activationScripts = {
      base-dirs = {
        text = ''
          mkdir -p /nix/var/nix/profiles/per-user/smoate
        '';
        deps = [ ];
      };
      zsh-config = {
        text = ''
          echo "# FIX: remove init of zsh to not show 'config not available'" > /home/smoate/.zshrc
        '';
        deps = [ ];
      };
    };

# ------------------------------------------------------------------------------------------------------------------
# Nix Version
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
# -------------------------------------------------------------------------------------------------------------------
    stateVersion = "22.05";
  };
}
