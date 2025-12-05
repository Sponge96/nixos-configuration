{ pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];
  programs.git = {
    enable = true;
    settings.user = {
      name = "Sponge";
      email = "Jackp.bcot@gmail.com";
    };
    settings.extraConfig = { safe.directory = "/etc/nixos"; };
  };
  programs.bash.shellAliases = { lz = "lazygit"; };
}
