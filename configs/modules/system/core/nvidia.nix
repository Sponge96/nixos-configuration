{ config, lib, pkgs-unstable, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelPackages = pkgs-unstable.linuxPackages;
  hardware.nvidia = {
    modesetting.enable = true;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    # package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    # package = pkgs-unstable.linuxPackages.nvidiaPackages.beta;
    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #   version = "555.58";
    #   sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
    #   sha256_aarch64 = lib.fakeSha256;
    #   openSha256 = lib.fakeSha256;
    #   settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
    #   persistencedSha256 = lib.fakeSha256;
    # };
    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #   version = "560.70";
    #   sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
    #   sha256_aarch64 = lib.fakeSha256;
    #   openSha256 = lib.fakeSha256;
    #   settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
    #   persistencedSha256 = lib.fakeSha256;
    # };
    package = pkgs-unstable.linuxPackages.nvidiaPackages.mkDriver {
      version = "565.57.01";
      sha256_64bit = "sha256-buvpTlheOF6IBPWnQVLfQUiHv4GcwhvZW3Ks0PsYLHo=";
      sha256_aarch64 = "sha256-aDVc3sNTG4O3y+vKW87mw+i9AqXCY29GVqEIUlsvYfE=";
      openSha256 = "sha256-/tM3n9huz1MTE6KKtTCBglBMBGGL/GOHi5ZSUag4zXA=";
      settingsSha256 = "sha256-H7uEe34LdmUFcMcS6bz7sbpYhg9zPCb/5AmZZFTx1QA=";
      persistencedSha256 =
        "sha256-hdszsACWNqkCh8G4VBNitDT85gk9gJe1BlQ8LdrYIkg=";
    };
    nvidiaSettings = true;
    open = false;
  };
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];
}
