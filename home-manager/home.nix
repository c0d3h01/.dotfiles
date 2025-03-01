{ config, pkgs, inputs, lib ? pkgs.lib, ... }:

{
  imports = [
    # -*- Modules -*-
    ./modules/git
    ./modules/shell
    ./modules/editor
    ./modules/kitty
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

  xdg.enable = true;

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
