{ config, ... }:

{
  # [ Import External Configurations ]
  # These files contain additional configurations and settings.
  imports = [
    ./apps
    ./c0d3h01
    ./dev
    ./modules
    ./hardware-configuration.nix
  ];

  # [ System Configuration ]
  system.stateVersion = "24.11";

  # [ Set the hostname of the system (used for networking and system identification). ]
  networking.hostName = "NixOS";
}
