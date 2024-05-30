{ config, pkgs, lib, home, ... }:

{
	services = {
		picom.enable = true;
		picom.settings = {
			daemon = true;
			vsync = false;
			dbe = false;

			backend = "glx";
			glx-no-stencil = true;
			glx-no-rebind-pixmap = false;
			glx-use-copysubbuffermesa = false;

			unredir-if-possible = true;
			use-damage = true;
			mark-wmwin-focused = true;
			mark-ovredir-focused = true;
			use-ewmh-active-win = true;
			detect-client-opacity = true;
			detect-transient = true;
			detect-client-leader = true;

			shadow = false;
			fading = false;

			inactive-opacity = 0.75;
			active-opacity = 1.0;
			frame-opacity = 0.5;

			wintypes = {
				tooltip = {
					opacity = 1.0;
					focus = true;
				};
				popup_menu = {
					opacity = 1.0;
				};
				dropdown_menu = {
					opacity = 1.0;
				};
			};

			opacity-rule = [
				"50:class_g = 'Bspwm'"
				"50:class_i = 'presel_feedback'"
			];

			blur = {
				method = "dual_kawase";
				strength = 6;
			};

			blur-background-exclude = [
				"class_i = 'presel_feedback'"
				"window_type = 'dock'"
				"window_type = 'desktop'"
				"window_type = 'menu'"
				"window_type = 'dropdown_menu'"
				"window_type = 'popup_menu'"
				"window_type = 'tooltip'"
			];
		};
	};
}
