{ pkgs, ... }:

{
  imports = [
    ./printing.nix
    ./tlp.nix
    ./virtualization.nix
  ];

  # -*- Allow unfree softwares -*-
  nixpkgs.config.allowUnfree = true;

  # -*- Allow Nix experimental-features enable -*-
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # -*- Automatic cleanup -*-
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 1d";
  nix.settings.auto-optimise-store = true;

  # Enables nix-ld to run dynamically linked binaries outside the Nix store
  programs.nix-ld.enable = true;

  # flatpak Apps
  #services.flatpak.enable = true;
  #xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    # Notion fix patch
    (pkgs.callPackage ./notion-app-enhanced { })
    notion-app-enhanced # Notion Desktop

    # -*- Desktop GUI Apps -*-
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
    vscodium-fhs
    slack
    zoom-us
    anydesk
    libreoffice
    element-desktop
    tor-browser
    youtube-music
    spotify
    transmission_4-gtk

    # -*- Development tools -*-
    postman
    parallel # sql
    ruby
    metasploit # msfconsole 
    nmap
    yarn
    clang
    gnumake
    cmake
    ninja
    glib
    glfw
    glew
    glm

    # -*- Misc utilities -*-
    android-tools
    appimage-run
    universal-android-debloater # uad-ng
    wine
    ventoy
    shc
  ];
}

