{ pkgs, ... }:

{
  # -*- AMD -*-
  hardware.amdgpu.initrd.enable = true;
  hardware.amdgpu.amdvlk.enable = true;
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];

  fileSystems."/home/c0d3h01/Desktop/hdd" =
    {
      device = "/dev/disk/by-uuid/e478fdb0-5dd7-463e-b579-7c1b75ccb9cf";
      fsType = "ext4";
    };
}
