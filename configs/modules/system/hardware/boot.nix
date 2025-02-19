{ profile, ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    # used previously when hitting bug with grub bootload and GC
    # systemd-boot.configurationLimit = 300;
  };
}
