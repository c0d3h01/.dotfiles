# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # -*- Allow unfree softwares -*-
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Gnome boxes settings.
  virtualisation.libvirtd.enable = true;
  users.extraGroups.libvirtd.members = [ "c0d3h01" ];

  # -*- Gnome exclude apps -*-
  environment.gnome.excludePackages = with pkgs.gnome; [
    pkgs.gnome-weather
    pkgs.gnome-contacts
    pkgs.gnome-music
    pkgs.yelp
    pkgs.epiphany
    pkgs.baobab
    pkgs.gnome-tour
    pkgs.gnome-system-monitor
    pkgs.gnome-characters
    pkgs.gnome-connections
    pkgs.gnome-font-viewer
    pkgs.geary
    pkgs.gnome-text-editor
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NixOS";
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # -*- Configure network proxy if necessary -*-
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.settings = {
  connection = {
    "wifi.powersave" = 2;
  };
};

  # Enable networking.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

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

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.c0d3h01 = {
    isNormalUser = true;
    home = "/home/c0d3h01";
    shell = pkgs.zsh;
    description = "c0d3h01";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" "video" "plugdev" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBe8fHUXMQJmuER2hFkeGAImJ40boFsXAfAgZslKeV4H c0d3h01@gmail.com" ];
    packages = with pkgs; [
    ];
  };

  # Enabled Zshell
  programs.zsh.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  environment.sessionVariables = {
  NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # -*- List services that you want to enable -*- :

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 1716 ];
  networking.firewall.allowedUDPPorts = [ 1716 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11";

  fileSystems."/home/c0d3h01/Desktop/hdd" =
  { device = "/dev/disk/by-uuid/e478fdb0-5dd7-463e-b579-7c1b75ccb9cf";
    fsType = "ext4";
  };
}
