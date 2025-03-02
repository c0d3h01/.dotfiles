{ config, pkgs, ... }:

{
  # -*- Automatic cleanup -*-
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 1d";
  nix.settings.auto-optimise-store = true;
}
