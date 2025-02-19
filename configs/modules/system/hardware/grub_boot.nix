{ profile, ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      timeoutStyle = "hidden";
      default = if profile == "work" then 2 else 0;
    };
  };
}
