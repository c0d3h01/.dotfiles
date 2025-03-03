{ config
, pkgs
, ...
}:

{
  # Configure firewall settings
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 1716 ];
    allowedUDPPorts = [ 1716 ];
  };

  # Enables wireless support via wpa_supplicant (uncomment if needed)
  # networking.wireless.enable = true;

  # Configure network proxy if necessary (uncomment and modify if needed)
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager = {
    enable = true;
    settings = {
      connection = {
        "wifi.powersave" = 2;
      };
    };
  };
}

