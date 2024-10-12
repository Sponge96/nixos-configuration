{
  programs.ssh = {
    enable = true;
    keys = { "id_ed25519" = /home/sponge/.ssh/id_ed25519; };
    extraConfig = ''
      Host github.com
      	user git
      	IdentityFile ~/.ssh/id_ed25519
    '';
  };
}
