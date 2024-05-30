# iao NixOS home-manager configuration

{ pkgs, ... }:

let
      chatterino-iao = pkgs.callPackage ./packages/chatterino-iao {};
in
{
      imports = [
            ./modules/bash.nix
            ./modules/git.nix
            ./modules/xdg.nix
            ./modules/picom.nix
            ./modules/wine.nix
            ./modules/firefox.nix
            ./modules/chromium.nix
            ./modules/vscode.nix
            ./modules/odin.nix
      ];

      nixpkgs.config = {
            allowUnfree = true;
            permittedInsecurePackages = [ ];
      };

      home = {
            username = "miles";
            homeDirectory = "/home/miles";

            # This value determines the Home Manager release that your
            # configuration is compatible with. This helps avoid breakage
            # when a new Home Manager release introduces backwards
            # incompatible changes.
            #
            # You can update Home Manager without changing this value. See
            # the Home Manager release notes for a list of state version
            # changes in each release.
            stateVersion = "24.11";

            packages = with pkgs; [
                  ### Theme ###
                  gtk3
                  numix-sx-gtk-theme #GTK2 + GTK3

                  ### Shell ###
                  neofetch

                  ### System Utilities ###
                  cmst
                  copyq
                  #etcher
                  gparted
                  tor-browser-bundle-bin
                  #kdePackages.kate

                  ### Network ###
                  qbittorrent
                  soulseekqt
                  yt-dlp
                  freetube

                  ### Development ###
                  gimp
                  inkscape
                  blender
                  obs-studio
                  #lmms
                  #zettlr
                  #kdenlive

                  ### Multimedia ###
                  mpv
                  #easyeffects

                  ### Documents
                  #libreoffice-qt
                  #kgpg

                  ### Communication ###
                  webcord
                  chatterino-iao #chatterino2
            ];

            sessionVariables = {
                  EDITOR = "featherpad";
                  _JAVA_AWT_WM_NONREPARENTING = "1"; # Make Java Windows behave with bspwm
                  DE = "lxqt";
                  XDG_CURRENT_DESKTOP = "LXQt";
                  QT_QPA_FLATPAK_PLATFORMTHEME = "lxqt";
                  QT_QPA_PLATFORMTHEME = "lxqt";
                  GDK_SCALE = "1";
                  GTK_CSD = "0";
                  GTK_OVERLAY_SCROLLING = "0";
                  FPS = "170"; # Odyssey Neo G7
                  RADV_PERFTEST = "gpl";
                  MESA_SHADER_CACHE_DIR = "/opt/cache";
                  DXVK_CONFIG_FILE = "/home/miles/Configurations/dxvk.conf";
                  DXVK_HUD = "fps,scale=0.67";
                  DXVK_STATE_CACHE = "0";
                  DXVK_STATE_CACHE_PATH = "/opt/cache/dxvk_state_cache/";
            };
      };

      programs = {
            home-manager.enable = true; # Let home-manager manage itself.

            java.enable = true;
      };

      manual.manpages.enable = false;
}
