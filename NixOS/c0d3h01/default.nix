{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.11";
  networking.hostName = "NixOS";

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # -*- Define a user account -*-
  users.users.c0d3h01 = {
    isNormalUser = true;
    home = "/home/c0d3h01";
    shell = pkgs.zsh;
    description = "c0d3h01";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" "video" "plugdev" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINcq9uTCVusCJRWgHTj8u4sdvvuXfPZcinAYTbNZW+eI c0d3h01@gmail.com" ];
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # Enable SSH service
    openssh = {
      enable = true;
    };
  };

  # -*- Enabled Zshell -*-
  programs.zsh.enable = true;

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

