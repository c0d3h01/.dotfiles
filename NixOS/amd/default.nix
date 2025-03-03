{ config
, pkgs
, lib
, modulesPath
, ...
}:
{
  # Make the kernel use the correct driver early.
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Updated option names for OpenGL configuration
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    amdvlk
  ];

  hardware.graphics.enable32Bit = true;

  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  # verify that OpenCL is correctly setup.
  environment.systemPackages = with pkgs; [
    clinfo
  ];
}
