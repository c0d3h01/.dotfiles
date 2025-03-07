{ config, pkgs, ... }:

{
  # -*-[ Vitrtual Boxes settings ]-*-
  environment.systemPackages = with pkgs; [ qemu ];
  # virtualisation.waydroid.enable = true; # Like Android with lineageOS system
}
