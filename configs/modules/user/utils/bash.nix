{ ... }:

{
  programs.bash.shellAliases = {
    rebuild =
      "sudo nixos-rebuild switch --flake ~/nixos-configuration/#default";
    ns = "nix-shell";
    gor = "go run .";
    kal = "khal interactive";
    ayon-start = "z ayon-docker ; sudo docker compose up -d --build";
    ayon-stop =
      "sudo docker stop ayon-docker-server-1 ; sudo docker stop ayon-docker-postgres-1 ; sudo docker stop ayon-docker-redis-1";
  };
}
