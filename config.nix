# iao NixOS home-manager configuration

{
	# Allow unfree packages.
	allowUnfree = true;
	                                                                                                                                                                   
	permittedInsecurePackages = [
		"electron-12.2.3"
		"qtwebkit-5.212.0-alpha4"
	];
	
	#packageOverrides = pkgs: {
	#	discord = pkgs.discord.override { nss = nss_latest; };
	#};
}
