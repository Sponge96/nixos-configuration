{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ nixfmt black ];
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
        formatter.args = [ "-" "--quiet" "--line-length=79 " ];
      }
    ];
  };
}
