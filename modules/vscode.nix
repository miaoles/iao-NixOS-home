{ config, pkgs, lib, ... }:

let
      unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
      nixpkgs-fmt-iao = pkgs.callPackage ../packages/nixpkgs-fmt-iao { };
in
{
      home = {
            packages = with pkgs; [
                  unstable.nodePackages.vscode-json-languageserver
                  unstable.nixd
                  nixpkgs-fmt-iao #pkgs.nixpkgs-fmt
            ];
      };

      programs = {
            vscode = {
                  enable = true;
                  package = unstable.vscodium;
                  userSettings = {
                        "workbench.colorTheme" = "Visual Studio Dark";
                        "editor.fontFamily" = "'Roboto Mono'";
                        "editor.fontSize" = 12;
                        "debug.console.fontSize" = 12;
                        "markdown.preview.fontSize" = 12;
                        "terminal.integrated.fontSize" = 12;
                        "chat.editor.fontSize" = 12;
                        "editor.tabSize" = 6;
                        "editor.insertSpaces" = false;
                        "workbench.statusBar.visible" = true;
                        "files.trimTrailingWhitespace" = true;
                        "editor.detectIndentation" = false;
                        "window.menuBarVisibility" = "toggle";
                        "workbench.activityBar.visible" = true;
                        "apc.activityBar" = {
                              "position" = "top";
                              "size" = 24;
                              "itemSize" = 24;
                              "itemMargin" = 6;
                        };
                        "nix.enableLanguageServer" = true;
                        "nix.serverPath" = "${unstable.nixd}/bin/nixd";
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
