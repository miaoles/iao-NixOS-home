# iao NixOS home-manager configuration

{ config, pkgs, lib, ... }:

{
	imports = [];

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
			picom
			tint2
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
	}

	# Let home-manager manage itself.
	programs.home-manager.enable = true;
	# Allow unfree packages.
	nixpkgs.config.allowUnfree = true;

	services.picom.enable = true;

}
