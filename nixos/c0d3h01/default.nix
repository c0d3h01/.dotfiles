{ config, pkgs, ... }:

{
  imports = [
    ./audio
    ./desktop
    ./fonts
    ./networking
    ./pkgs
  ];

    # Set your time zone.
    time.timeZone = "Asia/Kolkata";

  # -*- Define a user account -*-
  users.users.c0d3h01 = {
    description = "=> Harshal Sawant (c0d3h01) <=";
    isNormalUser = true;
    home = "/home/c0d3h01";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" "video" "plugdev" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINcq9uTCVusCJRWgHTj8u4sdvvuXfPZcinAYTbNZW+eI c0d3h01@gmail.com" ];
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };
}

