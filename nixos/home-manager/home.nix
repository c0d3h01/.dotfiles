{ config, pkgs, inputs, lib ? pkgs.lib, ... }:

{
  imports = [
    # -*- Modules -*-
    ./modules/git
    ./modules/shell
    ./modules/editor
    ./modules/kitty
    ./modules/firefox
    #./modules/notion-app-enhanced
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "c0d3h01";
  home.homeDirectory = "/home/c0d3h01";

  # This value determines the Home Manager release that your configuration is
  # compatible with.
  home.stateVersion = "24.11";

  # Enable fontconfig for custom fonts
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
    # Terminal utilities
    htop
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

    # Individual nerd fonts (correct way to install them)
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

  # Let Home Manager install and manage itself.
  #programs.home-manager.enable = true;
}
