self: super:
{
	yt-dlp = super.yt-dlp.overrideAttrs (oldAttrs: rec {
		pname = "yt-dlp";
		version = "2023.05.27";
		src = super.fetchPypi {
			inherit pname version;
			sha256 = "mvkt5e/8GTvbUSFtnr8oh02WGA0gL651Kw2fKmM4Dzo=";
		};
	});
}