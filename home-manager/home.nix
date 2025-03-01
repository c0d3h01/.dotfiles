{ config, pkgs, inputs, lib ? pkgs.lib, ... }:

{
  imports = [
    # -*- Modules -*-
    ./modules/git
    ./modules/shell
    ./modules/editor
    ./modules/kitty
    #./modules/notion-app-enhanced
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "c0d3h01";
  home.homeDirectory = "/home/c0d3h01";

  # This value determines the Home Manager release that your configuration is
  # compatible with.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable fontconfig for custom fonts
  fonts.fontconfig.enable = true;

  # Make GUI desk app visible.
  xdg.enable = true;

  home.sessionVariables = {
    PATH = "$HOME/.nix-profile/bin:$PATH";
  };

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
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
    notion-app-enhanced

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
    libgcc
    gdb
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
    yaru-theme

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

  # Home Manager is pretty good at managing dotfiles
  home.file = {
    # You can add dotfiles here if needed
    # ".config/some-app/config".source = ./config/some-app/config;
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
  };
}
