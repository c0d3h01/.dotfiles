{ config
, pkgs
, ...
}:

{
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 1716 ];
  networking.firewall.allowedUDPPorts = [ 1716 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Enables wireless support via wpa_supplicant
  #networking.wireless.enable = true;

  # -*- Configure network proxy if necessary -*-
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
