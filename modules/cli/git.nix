# -------------------------------------------------------------------------------------------------------------------
# modules/cli/Git.nix - version control
# -------------------------------------------------------------------------------------------------------------------
# Author: Shaun Moate
# Inspired by: https://github.com/mitchellh/nixos-config
# -------------------------------------------------------------------------------------------------------------------

{
  programs = {
    git = {
      enable = true;
      config = {
	    user = {
	      name = "shaun-moate";                  # declare user name
	      email = "shaun.moate@gmail.com";       # declare email
	    };
        init = {
          defaultBranch = "main";                # set `main` as default branch on `git init`
        };
      };
    };
  };
}
