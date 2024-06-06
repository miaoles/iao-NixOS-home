{ pkgs, ... }:

# Eventually this will contain default configuration files

let
      chatterino-iao = pkgs.callPackage ../packages/chatterino-iao { };
in
{
      home = {
            packages = [
                  chatterino-iao
            ];

            #file.".config/chatterino/Settings/settings.json" = '' '';
      };
}
