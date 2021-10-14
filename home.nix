# iao NixOS home-manager configuration

{ config, pkgs, lib, ... }:

let
	unstable = import <nixos-unstable> {};
in
{
	imports = [];

	home = {
		username = "miles";
		homeDirectory = "/home/miles";

		# Install these packages for just this user.
		packages = with pkgs; [
			# Stable Packages
			pkgs.cmst
			pkgs.copyq
			pkgs.etcher
			pkgs.gimp
			pkgs.qbittorrent

			# Unstable Packages
			unstable.discord
			unstable.chatterino2
			unstable.spotify
			unstable.yt-dlp
		];

		sessionVariables = {};

		# This value determines the Home Manager release that your
		# configuration is compatible with. This helps avoid breakage
		# when a new Home Manager release introduces backwards
		# incompatible changes.
		#
		# You can update Home Manager without changing this value. See
		# the Home Manager release notes for a list of state version
		# changes in each release.
		stateVersion = "21.11";
	};

	programs = {
		# Let home-manager manage itself.
		home-manager = {
			enable = true;
		};

		bash = {
			enable = true;
			bashrcExtra = ''source ~/Configuration/bash/bashrc'';
			profileExtra = ''source ~/Configuration/bash/bash_profile'';
			shellOptions = [];
		};

		#gtk = {
		#	enable = true;
		#};

		qt = {
			enable = true;
		};

		git = {
			enable = true;
			userName  = "miaoles";
			userEmail = "iao_mm@pm.me";
		};

		firefox = {
			enable = true;
		};

		steam = {
			enable = true;
		};
	};

	services = {
		picom = {
			enable = true;
		};

		xsettingsd = {
			enable = true;
		};

		sxhkd = {
			enable = true;
		};
	};
}
