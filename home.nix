# iao NixOS home-manager configuration

{ config, pkgs, lib }:

{
  # Imports
  imports = [

  ];

  # Let home-manager manage itself.
  programs.home-manager.enable = true;
  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Install these packages for just this user.
  home.packages = with pkgs; [];

  # Include man-pages.
  manual.manpages.enable = true;

  # Environment variables.
  systemd.user.sessionVariables = {};

  home.sessionVariables = {};

  services = {};

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
