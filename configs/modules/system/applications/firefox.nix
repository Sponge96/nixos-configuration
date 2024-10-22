{ ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-GB" ];
    preferences = { "network.protocol-handler.external.mailto" = false; };
  };
}
