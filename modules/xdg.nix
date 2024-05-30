{ config, pkgs, lib, home, ... }:

{
	xdg.mimeApps = {
		enable = false;
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
}
