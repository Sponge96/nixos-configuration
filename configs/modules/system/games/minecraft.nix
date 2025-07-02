{ config, pkgs, lib, ... }:

{
  # Minecraft server settings
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.fabric = {
      enable = true;

      # Specify the custom minecraft server package
      package = pkgs.fabricServers.fabric-1_21_1.override {
        loaderVersion = "0.16.10";
      }; # Specific fabric loader version

      symlinks = {
        mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
          Fabric-API = pkgs.fetchurl {
            url =
              "https://cdn.modrinth.com/data/P7dR8mSH/versions/9YVrKY0Z/fabric-api-0.115.0%2B1.21.1.jar";
            sha512 =
              "sha512-5fPDQxuWsoEwDdEY7lIzef9qd0wOhk6rjRWa8y5UJckV+GZLHNV28gJ16Lr5leAWxZcf6nR4yMsEM6g2Y/KuqA==";
          };
          Backpacks = pkgs.fetchurl {
            url =
              "https://cdn.modrinth.com/data/MGcd6kTf/versions/Ci0F49X1/1.2.1-backpacks_mod-1.21.2-1.21.3.jar";
            sha512 =
              "sha512-bvz/Xe0XLUad3yuxZEG2yN5TN8xiO2y1eel1zxh68LeSkbkaNzmabmfaB1jA4OIUcoHnoZUQ+PIfpqnBQZOoiw==";
          };
        });
      };
    };
  };
}
