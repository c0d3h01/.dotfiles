{ config, pkgs, ... }:

{
  # -*- Allow unfree softwares -*-
  nixpkgs.config.allowUnfree = true;

  # -*- Allow Nix experimental-features enable -*-
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # -*- Gnome boxes settings -*-
  virtualisation.libvirtd.enable = true;
  users.extraGroups.libvirtd.members = [ "c0d3h01" ];

  # Enables nix-ld to run dynamically linked binaries outside the Nix store
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
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
    gnumake
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

    # -*- Terminal utilities -*-
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

    # -*- Individual nerd fonts -*-
    nerd-fonts.jetbrains-mono
    fira-code
  ];
}
