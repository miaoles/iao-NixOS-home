{ pkgs, ... }:


{
      home = {
            packages = with pkgs; [
                  wineWowPackages.stagingFull
                  #wineWow64Packages.staging
                  #winePackages.stagingFull
                  winetricks
                  q4wine
                  dxvk
                  icoutils
                  #protontricks
                  #protonup #proton-ge
                  #rare
                  #jdk8
                  #jre8
                  glibc
                  steamtinkerlaunch
                  unixtools.xxd
                  xorg.xwininfo
                  scanmem
            ];
            sessionVariables = {
                  WINEESYNC="0";
                  WINEFSYNC="1";
                  PROTON_NVAPI_DISABLE = "1";
                  PROTON_WINEDBG_DISABLE = "1";
            };
      };
}
