{ pkgs, ... }:

{

  home.packages = with pkgs; [
    # Nix
    nixfmt-classic
    # Python
    black
    pyright
    # Go
    gopls
    # PowerShell
    powershell
    powershell-editor-services
    # JS / HTML
    typescript-language-server
    prettier
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "dracula";
      editor = {
        line-number = "relative";
        mouse = false;
        bufferline = "always";
      };
      editor.cursor-shape = {
        insert = "bar";
        select = "underline";
      };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "nixfmt";
      }
      {
        name = "python";
        auto-format = true;
        formatter.command = "black";
        formatter.args = [
          "-"
          "--quiet"
          "--line-length=79 "
        ];
        language-servers = [ "pyright" ];
      }
      {
        name = "go";
        auto-format = true;
        formatter.command = "go fmt";
      }
      {
        name = "powershell";
        auto-format = true;
        language-servers = [ "powershell-editor-services" ];
      }
      {
        name = "javascript";
        auto-format = true;
        formatter.command = "prettier";
        formatter.args = [
          "--parser"
          "babel"
        ];
        language-servers = [ "typescript-language-server" ];
      }
      {
        name = "html";
        auto-format = true;
        formatter.command = "prettier";
        formatter.args = [
          "--parser"
          "html"
        ];
        language-servers = [ "vscode-html-language-server" ];
      }
    ];
    languages.language-server."powershell-editor-services" = {
      command = "powershell-editor-services";
      args = [ "start" ];
    };
  };
}
