{ config, lib, pkgs-unstable, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelPackages = pkgs-unstable.linuxPackages;
  hardware.nvidia = {
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    # package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    # package = pkgs-unstable.linuxPackages.nvidiaPackages.beta;
    # package = pkgs-unstable.linuxPackages.nvidiaPackages.mkDriver {
    #   version = "560.35.03";
    #   sha256_64bit = "sha256-8pMskvrdQ8WyNBvkU/xPc/CtcYXCa7ekP73oGuKfH+M=";
    #   sha256_aarch64 = "sha256-s8ZAVKvRNXpjxRYqM3E5oss5FdqW+tv1qQC2pDjfG+s=";
    #   openSha256 = "sha256-/32Zf0dKrofTmPZ3Ratw4vDM7B+OgpC4p7s+RHUjCrg=";
    #   settingsSha256 = "sha256-kQsvDgnxis9ANFmwIwB7HX5MkIAcpEEAHc8IBOLdXvk=";
    #   persistencedSha256 =
    #     "sha256-E2J2wYYyRu7Kc3MMZz/8ZIemcZg68rkzvqEwFAL3fFs=";
    # };
    nvidiaSettings = true;
    open = false;
  };
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];
}
