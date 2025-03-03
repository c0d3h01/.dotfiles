{ config, pkgs, ... }:
{
  environment.sessionVariables = {
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };

}
