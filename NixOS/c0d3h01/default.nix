{ config, pkgs, ... }:

{
  # 
  system.stateVersion = "24.11";

  networking.hostName = "NixOS";

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # -*- Define a user account -*-
  users.users.c0d3h01 = {
    isNormalUser = true;
    home = "/home/c0d3h01";
    shell = pkgs.zsh;
    description = "c0d3h01";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" "video" "plugdev" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBe8fHUXMQJmuER2hFkeGAImJ40boFsXAfAgZslKeV4H c0d3h01@gmail.com" ];
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # -*- Enabled Zshell -*-
  programs.zsh.enable = true;

  # -*- Install firefox -*-
  programs.firefox.enable = true;
}

