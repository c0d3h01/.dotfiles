{ config, pkgs, ... }:

{
  # -*- Allow unfree softwares -*-
  nixpkgs.config.allowUnfree = true;

  # -*- Allow Nix experimental-features enable -*-
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # -*- Automatic cleanup -*-
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 1d";
  nix.settings.auto-optimise-store = true;

  # -*- Vitrtual Boxes settings -*-
  virtualisation.libvirtd.enable = true;
  users.extraGroups.libvirtd.members = [ "c0d3h01" ];

  # Enables nix-ld to run dynamically linked binaries outside the Nix store
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    # -*- Desktop GUI Apps -*-
    vscode
    zoom-us
    slack
    anydesk
    github-desktop
    jetbrains.pycharm-community-bin
    jetbrains.webstorm
    postman
    vesktop
    telegram-desktop
    github-desktop
    vscode
    slack
    zoom-us
    anydesk
    libreoffice
    element-desktop
    rhythmbox
    tor-browser
    youtube-music
    transmission_4-gtk

    # -*- Development tools -*-
    nodejs_23 # v23
    postman
    parallel-full # sql
    ruby_3_4
    metasploit # msfconsole 
    nmap
    clang
    gnumake
    cmake
    ninja

    # -*- Terminal basic utilities -*-
    android-tools
    appimage-run
    universal-android-debloater # uad-ng
    wine
    tree
    ventoy
    curl
    wget
    xclip
    bat
    tmux
    fastfetch
    inxi
    glances
    shc
    git
    git-lfs
    gh
    gitui
  ];
}

