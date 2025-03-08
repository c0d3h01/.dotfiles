{ config, ... }:

{
  imports = [
    ./apps
    ./c0d3h01
    ./dev
    ./modules
    ./hardware.nix
  ];
}
