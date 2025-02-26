{ config, pkgs, inputs, ... }:

{
  imports = [
    # Import modules
    ./modules/shell
    ./modules/editor
    ./modules/git
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "c0d3h01";
  home.homeDirectory = "/home/c0d3h01";

  # This value determines the Home Manager release that your configuration is
  # compatible with.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Enable fontconfig for custom fonts
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
    # Development tools
    git
    curl
    wget
    tree
    ripgrep
    fd
    jq
    direnv

    # Terminal utilities
    htop
    bat
    exa
    fzf
    tmux

    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles
  home.file = {
    # You can add dotfiles here if needed
    # ".config/some-app/config".source = ./config/some-app/config;
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
