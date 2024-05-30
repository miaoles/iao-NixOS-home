# iao NixOS home-manager configuration

{
	# Allow unfree packages.
	allowUnfree = true;

	permittedInsecurePackages = [
		"electron-12.2.3"
		"electron-22.3.27"
		"qtwebkit-5.212.0-alpha4"
		"qtwebkit-5.212.0-alpha4"
	];

	packageOverrides = pkgs: {
		discord = pkgs.discord.override { nss = pkgs.nss_3_96_1; };
		#discord = pkgs.discord.override { nss = nss_latest; };
	};
}
