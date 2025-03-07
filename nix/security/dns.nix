{ lib, ... }:

{
  # Use systemd-resolved
  services.resolved.enable = true;

  # Disable NetworkManager's internal DNS resolution
  networking.networkmanager.dns = lib.mkForce "none";

  # Configure DNS servers manually (this example uses Cloudflare and Google DNS)
  # IPv6 DNS servers can be used here as well.
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];
}
