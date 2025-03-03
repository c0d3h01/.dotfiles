{ config
, pkgs
, lib
, modulesPath
, ...
}:
{
  # Updated option names for OpenGL configuration
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    amdvlk
  ];

  # verify that OpenCL is correctly setup.
  environment.systemPackages = with pkgs; [
    clinfo
  ];
}
