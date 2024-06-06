{
      description = "iao Home Manager configuration";

      inputs = {
            nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

            home-manager = {
                  url = "github:nix-community/home-manager";
                  inputs.nixpkgs.follows = "nixpkgs";
            };
      };

      outputs = { nixpkgs, home-manager, ... }:
            let
                  system = rec {
                        system = "x86_64-linux";
                        hostname = "iao";
                        packages = nixpkgs.legacyPackages.${system};
                        timezone = "America/New York";
                        locale = "en_US.UTF-8";
                        dotsPerInch = "96"; # 96 for standard font scaling
                        framesPerSecond = "170"; # Samsung Odyssey Neo G7
                        monitors = [
                              "DisplayPort-0"
                              "DisplayPort-1"
                        ];
                  };

                  user = {
                        username = "miles";
                        name = "Miles";
                        email = "iao_mm@pm.me";
                        desktopEnvironment = "lxqt";
                        windowManager = "bspwm";
                        terminal = "qterminal";
                        editor = "emacsclient";
                        webBrowser = "firefox";
                        font = "Roboto";
                  };
            in
            {
                  homeConfigurations."miles" = home-manager.lib.homeManagerConfiguration {
                        inherit system;
                        inherit user;

                        modules = [ ./home.nix ];
                  };
            };
}
