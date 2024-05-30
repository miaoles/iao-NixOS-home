{ pkgs, ... }:

{
      programs.firefox = {
            enable = true;
            #package = firefox-devedition;
            package = pkgs.firefox;
      };
}
