#!/usr/bin/env bash

# Default configuration
NIXOS_CONFIGURATION_DIR="$HOME/.config/nixos"
HOME_MANAGER_CONFIGURATION_DIR="$HOME/.config/home-manager"

# Helper functions
update_user() {
      pushd "$HOME_MANAGER_CONFIGURATION_DIR" || { echo "Error: $HOME_MANAGER_CONFIGURATION_DIR does not exist"; return 1; }
      nix flake update
      popd
}

update_os() {
      pushd "$NIXOS_CONFIGURATION_DIR" || { echo "Error: $NIXOS_CONFIGURATION_DIR does not exist"; return 1; }
      sudo nix flake update
      popd
}

upgrade_user() {
      pushd "$HOME_MANAGER_CONFIGURATION_DIR" || { echo "Error: $HOME_MANAGER_CONFIGURATION_DIR does not exist"; return 1; }
      nix flake update
      home-manager switch --flake .
      popd
}

upgrade_os() {
      pushd "$NIXOS_CONFIGURATION_DIR" || { echo "Error: $NIXOS_CONFIGURATION_DIR does not exist"; return 1; }
      sudo nix flake update
      sudo nixos-rebuild switch --flake .#
      popd
}

discard_user() {
      nix-collect-garbage
}

discard_os() {
      sudo nix-collect-garbage
}

niaox() {
      case $1 in
      update)
            case $2 in
            user)
                  update_user
                  ;;
            os)
                  update_os
                  ;;
            both|"")
                  update_user
                  update_os
                  ;;
            *)
                  echo "Usage: niaox update [user|os]"
                  return 1
                  ;;
            esac
            ;;
      upgrade)
            case $2 in
            user)
                  upgrade_user
                  ;;
            os)
                  upgrade_os
                  ;;
            both|"")
                  upgrade_user
                  upgrade_os
                  ;;
            *)
                  echo "Usage: niaox upgrade [user|os]"
                  return 1
                  ;;
            esac
            ;;
      discard)
            case $2 in
            user)
                  discard_user
                  ;;
            os)
                  discard_os
                  ;;
            both|"")
                  discard_user
                  discard_os
                  ;;
            *)
                  echo "Usage: niaox discard [user|os]"
                  return 1
                  ;;
            esac
            ;;
      -h|--help)
            echo "Usage: niaox {update|upgrade|discard} [user|os]"
            echo "Manage NixOS and home-manager configurations."
            echo ""
            echo "Subcommands:"
            echo "  update    Update flake inputs for user, system, or both"
            echo "  upgrade   Upgrade configurations for user, system, or both"
            echo "  discard   Discard old generations for user, system, or both"
            echo ""
            echo "Options:"
            echo "  user      Apply the action to the user configuration"
            echo "  os        Apply the action to the system configuration"
            echo "  both      Apply the action to both user and system configurations (default)"
            ;;
      *)
            echo "Usage: niaox {update|upgrade|discard} [user|os]"
            return 1
            ;;
      esac
}