{ config, pkgs, lib, ... }:

let
      unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
      odin-iao = pkgs.callPackage ../packages/odin-iao { };
      ols-iao = pkgs.callPackage ../packages/ols-iao { };
in
{
      home.packages = with pkgs; [
            odin-iao #pkgs.odin
            ols-iao #pkgs.ols
            unstable.llvm
            unstable.clang
            unstable.SDL2
            unstable.glfw
            unstable.raylib
            unstable.renderdoc
            unstable.vulkan-tools
            unstable.vulkan-headers
            unstable.vulkan-loader
            unstable.vulkan-extension-layer
            unstable.vulkan-validation-layers
            unstable.vulkan-utility-libraries
            unstable.glm
            #unstable.sublime4
            unstable.glibc
            unstable.shaderc
      ];

      programs = {
            vscode = {
                  userSettings = {
                        "ols.server.path" = "${ols-iao}/bin/ols";
                        "[odin]" = {
                              "$schema" = "https://raw.githubusercontent.com/DanielGavin/ols/master/misc/ols.schema.json";
                              "collections" = [
                                    {
                                          "name" = "core";
                                          "path" = "${odin-iao}/share/core";
                                    }
                                    {
                                          "name" = "vendor";
                                          "path" = "${odin-iao}/share/vendor";
                                    }
                              ];
                              "enable_format" = true;
                              "enable_semantic_tokens" = true;
                              "enable_document_symbols" = true;
                              "enable_hover" = true;
                              "enable_snippets" = true;
                              "enable_inlay_hints" = true;
                        };
                        "[odinfmt]" = {
                              "$schema" = "https://raw.githubusercontent.com/DanielGavin/ols/master/misc/odinfmt.schema.json";
                              "character_width" = 150;
                              "tabs" = true;
                              "tabs_width" = 6;
                              "newline_limit" = 1;
                              "sort_imports" = true;
                              "exp_multiline_composite_literals" = true;
                              "indent_cases" = true;
                        };
                  };
            };
            bash.shellAliases = {
                  odin = "ODIN_ROOT=${odin-iao}/share odin";
            };
      };
}
