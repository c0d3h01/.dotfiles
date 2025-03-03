{ config
, pkgs
, ...
}:

{

  # Enables wireless support via wpa_supplicant (uncomment if needed)
  # networking.wireless.enable = true;

  # Configure network proxy if necessary (uncomment and modify if needed)
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Configure firewall settings.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 1716 ];
    allowedUDPPorts = [ 1716 ];
  };

  # Network manager configurations.
  networking.networkmanager = {
    enable = true;
    
    settings = {
      connection = {
        "wifi.powersave" = 2;
      };
    };
  };

  systemd.network.wait-online.enable = false;

  services.sshd.enable = true;

  # Use systemd-resolved
  services.resolved.enable = true;

  # Use systemd-networkd
  systemd.network.enable = true;
  networking.useNetworkd = true;
}

