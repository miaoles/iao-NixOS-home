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
            programs.bash = {
                  enable = true;
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