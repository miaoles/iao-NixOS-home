# iao NixOS home-manager configuration

{ config, pkgs, lib, ... }:

let
      home-manager = import <home-manager/nixos> { };
      unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
      chatterino-iao = pkgs.callPackage ./packages/chatterino-iao { };
in
{
      imports = [
            ./modules/bash.nix
            ./modules/picom.nix
            ./modules/xdg.nix
            ./modules/vscode.nix
            ./modules/odin.nix
      ];

      home = {
            username = "miles";
            homeDirectory = "/home/miles";

            packages = with pkgs; [
                  # Theme
                  pkgs.gtk3
                  pkgs.numix-sx-gtk-theme #GTK2 + GTK3
                  #pkgs.picom-next

                  # Shell
                  pkgs.neofetch

                  # System Utilities
                  pkgs.cmst
                  pkgs.copyq
                  #pkgs.etcher
                  pkgs.gparted
                  pkgs.tor-browser-bundle-bin

                  # Wine
                  unstable.wineWowPackages.stagingFull
                  #unstable.wineWow64Packages.staging
                  #unstable.winePackages.stagingFull
                  unstable.winetricks
                  unstable.q4wine
                  unstable.dxvk
                  pkgs.icoutils
                  unstable.protontricks
                  unstable.protonup #proton-ge
                  #unstable.rare
                  #unstable.jdk8
                  #unstable.jre8
                  unstable.glibc
                  unstable.steamtinkerlaunch
                  unstable.unixtools.xxd
                  unstable.xorg.xwininfo
                  unstable.scanmem

                  # Network
                  pkgs.qbittorrent
                  pkgs.soulseekqt
                  unstable.yt-dlp
                  unstable.freetube

                  # Development
                  #unstable.kdePackages.kate
                  unstable.gimp
                  unstable.inkscape
                  unstable.blender
                  #unstable.godot_4
                  unstable.obs-studio
                  #unstable.lmms
                  #unstable.zettlr
                  #unstable.kdenlive

                  # Multimedia
                  #unstable.easyeffects
                  unstable.mpv

                  # Documents
                  #pkgs.libreoffice-qt
                  #pkgs.kgpg

                  # Communication
                  chatterino-iao #unstable.chatterino2
                  unstable.webcord
            ];

            sessionVariables = { };

            # This value determines the Home Manager release that your
            # configuration is compatible with. This helps avoid breakage
            # when a new Home Manager release introduces backwards
            # incompatible changes.
            #
            # You can update Home Manager without changing this value. See
            # the Home Manager release notes for a list of state version
            # changes in each release.
            stateVersion = "24.11";
      };

      programs = {
            # Let home-manager manage itself.
            home-manager.enable = true;

            java.enable = true;

            git = {
                  enable = true;
                  userName = "miaoles";
                  userEmail = "iao_mm@pm.me";
                  extraConfig = {
                        init.defaultBranch = "main";
                        credential.helper = "cache";
                  };
            };

            firefox = {
                  enable = true;
                  #package = unstable.firefox-devedition;
                  package = unstable.firefox;
            };

            chromium = {
                  enable = true;
                  package = pkgs.ungoogled-chromium;
                  extensions = [
                        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
                        "jhnleheckmknfcgijgkadoemagpecfol" # Auto Tab Discard
                        "bkdgflcldnnnapblkhphbgpggdiikppg" # DuckDuckGo Privacy Essentials
                        "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
                        "nlikaonifbagdlcjoepofomefchkahab" # Bandcamp Volume
                        "hhinaapppaileiechjoiifaancjggfjm" # Web Scrobbler
                        "hlepfoohegkhhmjieoechaddaejaokhf" # Refined GitHub
                        "ocgpenflpmgnfapjedencafcfakcekcd" # Redirector
                        "dejobinhdiimklegodgbmbifijpppopn" # Tab Reloader
                        "bpaoeijjlplfjbagceilcgbkcdjbomjd" # TTV LOL
                        "onlhphabpmijgblopkcjmphbbmeliagn" # UserTesting
                        "bhplkbgoehhhddaoolmakpocnenplmhf" # Alternate Player for Twitch.tv
                        "gkojfkhlekighikafcpjkiklfbnlmeio" # Hola VPN - The Website Unblocker
                  ];
            };
      };

      nixpkgs.config = {
            allowUnfree = true;
            permittedInsecurePackages = [ ];
      };

      manual.manpages.enable = false;
}
