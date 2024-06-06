{ stdenv, fetchFromGitHub, makeBinaryWrapper, lib, pkgs }:

let
      odin-iao = pkgs.callPackage ./../odin-iao { };
in
stdenv.mkDerivation {
      version = "0-unstable-2024-06-04";
      name = "ols";
      pname = "ols";
      src = fetchFromGitHub {
            owner = "DanielGavin";
            repo = "ols";
            rev = "b7abe27c51968d0a77f3eaf899de63e4c38bc129";
            hash = "sha256-fHCSPqeN24QbCzwMCLtvK5YnR0ExveDvXRuWL2nHt8M=";
            fetchSubmodules = true;
      };

      nativeBuildInputs = [
            makeBinaryWrapper
      ];

      buildInputs = [
            odin-iao
      ];

      postPatch = ''
            patchShebangs build.sh
      '';

      buildPhase = ''
            runHook preBuild

            ./build.sh

            runHook postBuild
      '';

      installPhase = ''
            runHook preInstall

            install -Dm755 ols -t $out/bin/
            wrapProgram $out/bin/ols --set-default ODIN_ROOT ${odin-iao}/share

            runHook postInstall
      '';

      meta = with lib; {
            inherit (odin-iao.meta) platforms;
            description = "Language server for the Odin programming language";
            mainProgram = "ols";
            homepage = "https://github.com/DanielGavin/ols";
            license = licenses.mit;
            maintainers = with maintainers; [ astavie znaniye ];
      };
}
