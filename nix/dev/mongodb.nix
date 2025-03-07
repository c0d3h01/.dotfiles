{ config, pkgs, ... }:
{
  services.mongodb = {
    enable = true;
    enableAuth = true;
    initialRootPasswordFile = "/run/secrets/mongodb-root-pass";
    bind_ip = "10.5.0.2";
  };
}
