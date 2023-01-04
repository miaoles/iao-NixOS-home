{ appimageTools, fetchurl }:

appimageTools.wrapType1 { # or wrapType1
  name = "chatterino2";
  src = fetchurl {
    url = "https://github.com/Chatterino/chatterino2/releases/download/v2.4.0/Chatterino-x86_64.AppImage";
    sha256 = "sha256-Z7iwkKwAuQqTkbImT9RdED7W6HslLeEdxY/8nrLsFRk=";
  };
  extraPkgs = pkgs: with pkgs; [ ];
}
