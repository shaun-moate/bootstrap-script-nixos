# -------------------------------------------------------------------------------------------------------------------
# Makefile - scripted actions (make <insert command below>)
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------------------------------------
# Local Variables
# ++ action: export NIXADDR <insert vm ip address>
# ++++ hint: run `ip addr` on VM to access ip address
# -------------------------------------------------------------------------------------------------------------------
NIXUSER ?= smoate
NIXADDR ?= unset
NIXPORT ?= 22
NIXHOST ?= phoenix
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

# -------------------------------------------------------------------------------------------------------------------
# vm/Bootstrap-Minimal - base install of NixOS
# ++ action: ensure hard disk on virtual machine set to NVME
# -------------------------------------------------------------------------------------------------------------------
vm/00-bootstrap-minimal:
	ssh -o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
		-p${NIXPORT} root@${NIXADDR} " \
			parted /dev/nvme0n1 -- mklabel gpt; \
			parted /dev/nvme0n1 -- mkpart primary 600MiB -8GiB; \
			parted /dev/nvme0n1 -- mkpart primary linux-swap -8GiB 100\%; \
			parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 600MiB; \
			parted /dev/nvme0n1 -- set 3 esp on; \
			sleep 1; \
			mkfs.ext4 -L nixos /dev/nvme0n1p1; \
			mkswap -L swap /dev/nvme0n1p2; \
			mkfs.fat -F 32 -n boot /dev/nvme0n1p3; \
			sleep 1; \
			mount /dev/disk/by-label/nixos /mnt; \
			mkdir -p /mnt/boot; \
			mount /dev/disk/by-label/boot /mnt/boot; \
			sleep 1; \
			nixos-generate-config --root /mnt; \
			sed --in-place '/system\.stateVersion = .*/a \
						nix.package = pkgs.nixUnstable;\n \
						nix.extraOptions = \"experimental-features = nix-command flakes\";\n \
						services.openssh.enable = true;\n \
						services.openssh.passwordAuthentication = true;\n \
						services.openssh.permitRootLogin = \"yes\";\n \
						users.users.root.initialPassword = \"root\";\n \
						environment.systemPackages = [ pkgs.git ];\n \
			' /mnt/etc/nixos/configuration.nix; \
			nixos-install --no-root-passwd; \
			reboot; \
		"

# -------------------------------------------------------------------------------------------------------------------
# vm/Bootstrap-Copy - copy nix configuration
# -------------------------------------------------------------------------------------------------------------------
vm/01-bootstrap-copy:
	rsync -av -e 'ssh -p$(NIXPORT) -o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' \
        --exclude='.git/' \
		$(MAKEFILE_DIR) $(NIXUSER)@$(NIXADDR):/etc/nixos;

# -------------------------------------------------------------------------------------------------------------------
# vm/SSH - copy ssh keys to virtual machine
# ++ TODO: replace this with Ansible and Ansible Vault!!!!!!!!
# -------------------------------------------------------------------------------------------------------------------
# vm/02-bootstrap-ssh:
#	rsync -av -e 'ssh -o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' \
#		--exclude='environment' \
#		$(HOME)/.ssh/ $(NIXUSER)@$(NIXADDR):~/.ssh

# -------------------------------------------------------------------------------------------------------------------
# Test - test nix configuration
# ++ TODO: move bootstrap-script to /home/smoate/code and change below.
# -------------------------------------------------------------------------------------------------------------------
#test:
#	sudo nixos-rebuild test --flake /etc/nixos/bootstrap-script#$(NIXHOST)

# -------------------------------------------------------------------------------------------------------------------
# Build - build (but don't switch to) nix configuration
# ++ TODO: move bootstrap-script to /home/smoate/code and change below.
# -------------------------------------------------------------------------------------------------------------------
#build:
#	sudo nixos-rebuild build --flake /etc/nixos/bootstrap-script#$(NIXHOST)

# -------------------------------------------------------------------------------------------------------------------
# Switch - update nix configuration
# ++ TODO: move bootstrap-script to /home/smoate/code and change below.
# -------------------------------------------------------------------------------------------------------------------
#switch:
#	sudo nixos-rebuild switch --flake /etc/nixos/bootstrap-script#$(NIXHOST)
