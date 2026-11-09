{ pkgs, inputs, ... }:

{
  imports = [ inputs.charmbracelet-nur.homeModules.crush ];

  programs.crush = {
    enable = true;
    settings = {
      lsp = {
        gopls = {
          command = "${pkgs.gopls}/bin/gopls";
        };
        pyright = {
          command = "${pkgs.pyright}/bin/pyright-langserver";
          args = [ "--stdio" ];
        };
        typescript = {
          command = "${pkgs.typescript-language-server}/bin/typescript-language-server";
          args = [ "--stdio" ];
        };
      };
    };
  };
}
