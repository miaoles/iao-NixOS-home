self: super:
{
#	chatterino2 = super.chatterino2.overrideAttrs (oldAttrs: rec {
#		version = "7.4.0";
#		name = "chatterino2";
#		pname = "chatterino2";
#		src = super.fetchFromGitHub {
#			owner = "SevenTV";
#			repo = pname;
#			rev = "v${version}";
#			sha256 = "sha256-F0Cs115C/N9Ul5L992e6Jwe976Pk2Qy6ZKIUA4RVgDg=";
#			fetchSubmodules = true;
#		};
#	});
}

#		version = "2.4.0";
#		pname = "chatterino2";
#		src = super.fetchFromGitHub {
#			owner = "Chatterino";
#			repo = pname;
#			rev = "907554124d549e78313a4c09003ce00c9f492efc";
#			sha256 = "sha256-F0Cs115C/N9Ul5L992e6Jwe976Pk2Qy6ZKIUA4RVgDg=";
#			fetchSubmodules = true;
#		};

#		dontUseQmakeConfigure = true;
