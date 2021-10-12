# iao NixOS home-manager configuration

{ config, pkgs, lib, ... }:

{
	imports = [];

	# Allow unfree packages.
	nixpkgs.config.allowUnfree = true;

	home = {
		username = "miles";
		homeDirectory = "/home/miles";

		# Install these packages for just this user.
		packages = with pkgs; [
			cmst
			chatterino2
			copyq
			discord
			firefox
			gimp
			picom
			qbittorrent
			tint2
			yt-dlp
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
		stateVersion = "21.05";
	};

	programs = {
		# Let home-manager manage itself.
		home-manager.enable = true;

		bash = {
			enable = true;
			bashrcExtra = ''
				sh ~/Configuration/bash/bashrc
			'';
		};

		git = {
			enable = true;
			userName  = "miaoles";
			userEmail = "iao_mm@pm.me";
		};

		steam.enable = true;
	};

	services.picom.enable = true;

	# Allow unfree packages.
	nixpkgs.config.allowUnfree = true;
}
