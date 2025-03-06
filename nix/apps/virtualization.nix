{ config, pkgs, ... }:

{
  # -*- Vitrtual Boxes settings -*-
  #virtualisation.libvirtd.enable = true;
  #users.extraGroups.libvirtd.members = [ "c0d3h01" ];

  environment.systemPackages = with pkgs; [ virt-manager distrobox ];
  virtualisation.libvirtd = {
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
    enable = true;
    qemu.runAsRoot = false;
  };
  virtualisation.waydroid.enable = true;
}
