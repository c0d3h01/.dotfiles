{ config, pkgs, ... }:

{
  # -*-[ Vitrtual Boxes settings ]-*-
  environment.systemPackages = with pkgs; [ qemu virt-manager ];
  virtualisation.libvirtd = {
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
    enable = true;
    qemu.runAsRoot = false;
  };
  # virtualisation.waydroid.enable = true; # Android with lineageOS
}
