# iao NixOS home-manager configuration

{ config, pkgs, lib, ... }:

{
	home = {
		username = "miles";
		homeDirectory = "/home/miles";

		# Install these packages for just this user.
		packages = with pkgs; [
			# Theme
				pkgs.numix-sx-gtk-theme #GTK2 + GTK3
				
			# Shell
				pkgs.neofetch
				
			# System Utilities
				pkgs.cmst
				pkgs.copyq
				pkgs.etcher
				
			# Wine
				pkgs.wineWowPackages.staging
				#(pkgs.winetricks.override { wine = wineWowPackages.staging; })
				#pkgs.q4wine #Not working yet
				pkgs.icoutils
				pkgs.protontricks
				pkgs.protonup #proton-ge
				
			# Network Utilities
				pkgs.qbittorrent
				pkgs.soulseekqt
				pkgs.yt-dlp
				
			# Multimedia
				pkgs.mpv
				pkgs.spotify
				
			# Documents
				pkgs.libreoffice-qt
				
			# Communication
				pkgs.discord
				pkgs.betterdiscordctl
				#pkgs.chatterino2 #Using AppImage
				#pkgs.zoom-us #Broken
				
			# Production
				pkgs.gimp
				pkgs.godot
				pkgs.obs-studio
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

		git = {
			enable = true;
			userName  = "miaoles";
			userEmail = "iao_mm@pm.me";
			extraConfig = {
				init.defaultBranch = "main";
				credential.helper = "cache";
			};
		};
		
		firefox = {
			enable = true;
		};
	};

	services = {
		xsettingsd = {
			enable = true;
		};

		#sxhkd = {
		#	enable = true;
		#};
		
		picom = {
			enable = true;
			package = pkgs.picom.overrideAttrs(o: {
				src = pkgs.fetchFromGitHub {
					repo = "picom";
					owner = "yshui";
					rev = "ad18d129cc549e4e00a0499df7de87f249a3a71f";
					sha256 = "06s1s1zyg2aqggml0q02fn642rh1l38g8aj38qjg8gq7gwsa69vs";
				};
			});
		};
	};

	#gtk = {
	#	enable = true;
	#	
	#	font = {
	#		name = "Roboto";
	#		size = 8;
	#	};
	#	
	#	theme = {
	#		name = "Numix-SX-Light";
	#		package = pkgs.numix-sx-gtk-theme;
	#	};
	#	
	#	gtk2 = {
	#		
	#	};
	#
	#	gtk3 = {
	#		
	#	};
	#};

	#qt = {
	#	enable = true;
	#};
}
