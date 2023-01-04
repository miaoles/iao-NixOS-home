# iao NixOS home-manager configuration

{ config, pkgs, lib, ... }:

let
	unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
	spotify = pkgs.callPackage ./modules/spotify {};
	godot4 = pkgs.callPackage ./modules/godot4 {};
	#chatterino = pkgs.callPackage ./modules/chatterino {};
in	
{
	home = {
		username = "miles";
		homeDirectory = "/home/miles";

		# Install these packages for just this user.
		packages = with pkgs; [
			# Theme
				pkgs.gtk3
				pkgs.numix-sx-gtk-theme #GTK2 + GTK3
				unstable.picom-next
				
			# Shell
				pkgs.neofetch
					
			# System Utilities
				pkgs.cmst
				pkgs.copyq
				pkgs.etcher
				pkgs.gparted
				
			# Wine
				unstable.wineWowPackages.staging
				unstable.winetricks
				unstable.q4wine
				unstable.dxvk
				pkgs.icoutils
				unstable.protontricks
				unstable.protonup #proton-ge
				#unstable.rare
				
			# Network
				pkgs.qbittorrent
				pkgs.soulseekqt
				unstable.yt-dlp
				
			# Multimedia
				#unstable.easyeffects
				unstable.mpv
				spotify
				
			# Documents
				pkgs.libreoffice-qt
				#pkgs.kgpg
				
			# Communication
				unstable.discord-canary
				unstable.betterdiscordctl
				unstable.chatterino2 #overlayed to chatterino7
				#chatterino
				#pkgs.zoom-us #broken
				
			# Production
				unstable.git-cola
				unstable.gimp
				unstable.inkscape
				unstable.blender
				unstable.godot
				unstable.obs-studio
				unstable.lmms
				#unstable.zettlr
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
		home-manager = {
			enable = true;
		};

		bash = {
			enable = true;
			bashrcExtra = ''source ~/Configuration/bash/bashrc'';
			profileExtra = ''source ~/Configuration/bash/bash_profile'';
			shellOptions = [];
		};
		
		zsh = {
			enable = true;
			enableAutosuggestions = true;
			enableCompletion = true;
			#enableSyntaxHighlighting = true;
			dotDir = "Configuration/zhrc";
			initExtraFirst = "";
			initExtra = ''source ~/Configuration/zsh/extra.zshrc'';
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
				"ofbbahodfeppoklmgjiokgfdgcndngjm" # TTV LOL
			];
		};
	};

	services = {
		#xsettingsd = {
		#	enable = true;
		#};
	};
	
	xdg.mimeApps = {
		enable = true;
		#associations.added = {
		#	"" = [ "" ];
		#};
		defaultApplications = {
			"inode/directory" = [ "pcmanfm-qt.desktop" ];
			"text/html" = [ "firefox.desktop" ];
			"scheme-handler/http" = [ "firefox.desktop" ];
			"scheme-handler/https" = [ "firefox.desktop" ];
			"x-scheme-handler/http" = [ "firefox.desktop" ];
			"x-scheme-handler/https" = [ "firefox.desktop" ];
			"x-scheme-handler/chrome" = [ "firefox.desktop" ];
			"application/x-extension-htm" = [ "firefox.desktop" ];
			"application/x-extension-html" = [ "firefox.desktop" ];
			"application/x-extension-shtml" = [ "firefox.desktop" ];
			"application/xhtml+xml" = [ "firefox.desktop" ];
			"application/x-extension-xhtml" = [ "firefox.desktop" ];
			"application/x-extension-xht" = [ "firefox.desktop" ];
		};
	};
	
	manual.manpages.enable = false;
}
