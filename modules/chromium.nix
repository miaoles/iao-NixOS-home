{ pkgs, ... }:

{
      programs.chromium = {
            enable = true;
            package = pkgs.ungoogled-chromium;
            extensions = [
                  "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
                  "jhnleheckmknfcgijgkadoemagpecfol" # Auto Tab Discard
                  "bkdgflcldnnnapblkhphbgpggdiikppg" # DuckDuckGo Privacy Essentials
                  "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
                  "nlikaonifbagdlcjoepofomefchkahab" # Bandcamp Volume
                  "hhinaapppaileiechjoiifaancjggfjm" # Web Scrobbler
                  "hlepfoohegkhhmjieoechaddaejaokhf" # Refined GitHub
                  "ocgpenflpmgnfapjedencafcfakcekcd" # Redirector
                  "dejobinhdiimklegodgbmbifijpppopn" # Tab Reloader
                  "bpaoeijjlplfjbagceilcgbkcdjbomjd" # TTV LOL
                  "onlhphabpmijgblopkcjmphbbmeliagn" # UserTesting
                  "bhplkbgoehhhddaoolmakpocnenplmhf" # Alternate Player for Twitch.tv
                  "gkojfkhlekighikafcpjkiklfbnlmeio" # Hola VPN - The Website Unblocker
            ];
      };
}

