{ pkgs, ... }:

let
      odin-iao = pkgs.callPackage ../packages/odin-iao { };
      ols-iao = pkgs.callPackage ../packages/ols-iao { };
in
{
      home = {
            packages = with pkgs; [
                  odin-iao #pkgs.odin
                  ols-iao #pkgs.ols
                  llvm
                  clang
                  SDL2
                  glfw
                  raylib
                  renderdoc
                  vulkan-tools
                  vulkan-headers
                  vulkan-loader
                  vulkan-extension-layer
                  vulkan-validation-layers
                  vulkan-utility-libraries
                  glm
                  glibc
                  shaderc
            ];
            sessionVariables = {
                  odin = "ODIN_ROOT=${odin-iao}/share odin";
            };
      };

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
                  #odin = "ODIN_ROOT=${odin-iao}/share odin";
            };
      };
}
