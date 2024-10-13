{ pkgs, ... }:

{
  # This allows VIA package to find keyboard
  services.udev.packages = with pkgs; [ via ];
}
