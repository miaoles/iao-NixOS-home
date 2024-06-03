{ pkgs, lib, config, ... }:

with lib;

let
      cfg = config.programs.niaox;
in {
      options.programs.niaox = {
            enable = mkEnableOption "Niaox";
            nixosConfigurationDir = mkOption {
                  type = types.str;
                  default = "$HOME/.config/nixos";
                  description = "The directory containing the NixOS configuration flake.";
            };
            homeManagerConfigurationDir = mkOption {
                  type = types.str;
                  default = "$HOME/.config/home-manager";
                  description = "The directory containing the home-manager configuration flake.";
            };
      };

      config = mkIf cfg.enable {
            home.packages = with pkgs; [
                  # Add any packages required by Niaox
            ];

            programs.bash = {
                  enable = true;
                  shellAliases = {
                        # Add any aliases related to Niaox
                  };
                  initExtra = ''
                        export NIXOS_CONFIGURATION_DIR="${cfg.nixosConfigurationDir}"
                        export HOME_MANAGER_CONFIGURATION_DIR="${cfg.homeManagerConfigurationDir}"

                        # Load the niaox function
                        source ${./niaox.bash}

                        # Load Bash completion for niaox
                        source ${./completions.bash}
                  '';
            };
      };
}