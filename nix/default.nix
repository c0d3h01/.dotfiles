{ config, pkgs, ... }:

{
  # [ Import External Configurations ]
  # These files contain additional configurations and settings.
  imports = [
    ./c0d3h01
    ./dev
    ./modules
    ./apps
    ./security
  ];

  # [ System Configuration ]
  system.stateVersion = "24.11";

  # [ Set the hostname of the system (used for networking and system identification). ]
  networking.hostName = "NixOS";

  # [ Bootloader Configuration ]
  boot.loader = {
    systemd-boot.enable = true; # Enable systemd-boot (UEFI boot manager)
    efi.canTouchEfiVariables = true; # Allow modifying EFI variables (needed for UEFI booting)
  };

  # [ X Server System Services ]
  services = {
    xserver = {
      # libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
      enable = true; # X11 Window System Configuration
      videoDrivers = [ "amdgpu" ];
      xkb.layout = "us";
    };
  };
}
