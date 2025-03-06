{ ... }:

{
  # Firewall
  networking.firewall.enable = true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22000 21027 1716 ]; # syncthing, gsconnect
  networking.firewall.allowedUDPPorts = [ 22000 21027 1716 ]; # syncthing, gsconnect
}
