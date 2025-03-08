{ lib, pkgs, ... }:

{
  # Enables wireless support via wpa_supplicant (uncomment if needed)
  # networking.wireless.enable = true;
  # Configure network proxy if necessary (uncomment and modify if needed)
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  systemd.network.wait-online.enable = false;
  # -*- Network manager configurations -*-
  networking.networkmanager = {
    enable = true;
    settings = {
      connection = {
        "wifi.powersave" = 2;
      };
    };
  };

  # -*- DNS -*-
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

  # -*- Firewall -*-
  networking.firewall.enable = true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 1716 ]; # gsconnect
  networking.firewall.allowedUDPPorts = [ 1716 ]; # gsconnect
}
