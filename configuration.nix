# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # -*- Allow unfree softwares -*-
  nixpkgs.config.allowUnfree = true;

  # -*- Allow Nix experimental-features enable -*-
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # -*- Gnome boxes settings -*-
  virtualisation.libvirtd.enable = true;
  users.extraGroups.libvirtd.members = [ "c0d3h01" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NixOS";

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

  # -*- Gnome "Exclude!" apps -*-
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
    jack.enable = true; # If you want to use JACK applications, uncomment this

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;

  # -*- Define a user account -*-
  users.users.c0d3h01 = {
    isNormalUser = true;
    home = "/home/c0d3h01";
    shell = pkgs.zsh;
    description = "c0d3h01";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" "video" "plugdev" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBe8fHUXMQJmuER2hFkeGAImJ40boFsXAfAgZslKeV4H c0d3h01@gmail.com" ];

    packages = with pkgs; [
    hello
    # -*- Desktop -*-
    vscode
    zoom-us
    slack
    anydesk
    github-desktop
    jetbrains.pycharm-community-bin
    jetbrains.webstorm
    universal-android-debloater
    postman
    vesktop
    telegram-desktop
    github-desktop
    vscode
    wine
    slack
    zoom-us
    anydesk
    libreoffice
    hunspell
    hunspellDicts.en_US
    ventoy
    element-desktop
    rhythmbox 
    tor-browser
    youtube-music
    transmission_4-gtk
    appimage-run
    docker
    docker-compose

    # -*- Development tools -*-
    curl
    wget
    tree
    ripgrep
    direnv
    nodejs_23
    zulu23 # java
    postman
    parallel-full # sql
    ruby_3_4
    jupyter-all
    rustup
    android-tools
    universal-android-debloater # uad-ng
    metasploit # msfconsole 
    clang
    cmake
    python312Packages.ninja
    python312Packages.pip
    python312Packages.virtualenv
    python312Packages.django
    python312Packages.flask
    python312Packages.fastapi
    python312Packages.jinja2

    # -*- Misc Packages -*-
    gnomeExtensions.gsconnect
    micro-full # text editor.
    gnome-tweaks
    gnome-boxes

    # Terminal utilities
    xclip
    bat
    eza
    fd
    ripgrep
    zoxide
    starship
    nix-zsh-completions
    fzf
    tmux
    fastfetch
    inxi
    nettools
    glances
    shc
    direnv
    git
    git-lfs
    gh
    gitui

    # Individual nerd fonts (coapple-color-emoji.nixrrect way to install them)
    nerd-fonts.jetbrains-mono
    fira-code
    ];
  };

  # -*- Automatic cleanup -*-
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  #nix.gc.options = "--delete-older-than 1d";
  nix.settings.auto-optimise-store = true;

  programs.nix-ld.enable = true;

  # -*- Enabled Zshell -*-
  programs.zsh.enable = true;

  # -*- Install firefox -*-
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
}
