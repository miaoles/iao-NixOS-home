{ pkgs, ... }:

let
      nixpkgs-fmt-iao = pkgs.callPackage ../packages/nixpkgs-fmt-iao {};
in
{
      home = {
            packages = with pkgs; [
                  nodePackages.vscode-json-languageserver
                  nixd
                  nixpkgs-fmt-iao #pkgs.nixpkgs-fmt
            ];
      };

      programs = {
            vscode = {
                  enable = true;
                  package = pkgs.vscodium;
                  userSettings = {
                        ### Theming ###
                        "workbench.colorTheme" = "Visual Studio Dark";
                        "workbench.activityBar.visible" = true;
                        "window.menuBarVisibility" = "toggle";
                        "workbench.statusBar.visible" = false;
                        "editor.fontFamily" = "'Roboto Mono'";
                        "editor.fontSize" = 12;
                        "debug.console.fontSize" = 12;
                        "markdown.preview.fontSize" = 12;
                        "terminal.integrated.fontSize" = 12;
                        "chat.editor.fontSize" = 12;

                        ### Editing ###
                        "editor.tabSize" = 6;
                        "editor.insertSpaces" = false;
                        "files.trimTrailingWhitespace" = true;
                        "editor.detectIndentation" = false;
                        "apc.activityBar" = {
                              "position" = "top";
                              "size" = 24;
                              "itemSize" = 24;
                              "itemMargin" = 6;
                        };

                        ### Nix IDE ###
                        "nix.enableLanguageServer" = true;
                        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
                        "nix.formatterPath" = "${nixpkgs-fmt-iao}/bin/nixpkgs-fmt";
                        "nix.serverSettings" = {
                              "nixd" = {
                                    "formatting" = {
                                          "command" = "nixpkgs-fmt";
                                    };
                                    "options" = {
                                          "enable" = true;
                                    };
                              };
                        };
                        "[nix]" = {
                              "editor.tabSize" = 6;
                              "editor.insertSpaces" = true;
                        };
                  };
            };
      };
}
