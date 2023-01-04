self: super:
{
#	godot = super.godot.overrideAttrs (oldAttrs: rec {
#		version = "4.0";
#		src = super.fetchzip {
#			url = "https://downloads.tuxfamily.org/godotengine/4.0/beta1/godot-4.0-beta1.tar.xz";
#			sha256 = "sha256-1P5Xz7feNJjC8/ACkvLQNJ/lLwZKbr0DWlWXu6BAtRQ=";
#		};
#		patches = [ ./godot/pkg_config_additions_dont_clobber_env.patch ];
#	});
}
