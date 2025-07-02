{ config, lib, pkgs-unstable, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelPackages = pkgs-unstable.linuxPackages;
  hardware.nvidia = {
    modesetting.enable = true;
    # package = config.boot.kernelPackages.nvidiaPackages.;
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
    package = pkgs-unstable.linuxPackages.nvidiaPackages.mkDriver {
      version = "570.86.16";
      sha256_64bit = "sha256-RWPqS7ZUJH9JEAWlfHLGdqrNlavhaR1xMyzs8lJhy9U=";
      sha256_aarch64 = "sha256-RiO2njJ+z0DYBo/1DKa9GmAjFgZFfQ1/1Ga+vXG87vA=";
      openSha256 = "sha256-DuVNA63+pJ8IB7Tw2gM4HbwlOh1bcDg2AN2mbEU9VPE=";
      settingsSha256 = "sha256-9rtqh64TyhDF5fFAYiWl3oDHzKJqyOW3abpcf2iNRT8=";
      persistencedSha256 =
        "sha256-3mp9X/oV8o2TH9720NnoXROxQ4g98nNee+DucXpQy3w=";
    };
    nvidiaSettings = true;
    open = false;
  };
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];
}
