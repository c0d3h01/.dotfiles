{ config, pkgs, inputs, ... }:
{
  imports = [
    # Core modules
    ./modules/core

    # Main modules
    ./modules/shell
    ./modules/neovim
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

  # ".config/some-app/config".source = ./config/some-app/config;
  home.file = { };

  # Basic packages available to user
  # packages = with pkgs; [
  # ];

  # Create XDG directories
  xdg = {
    enable = true;
    userDirs.enable = true;
    userDirs.createDirectories = true;
  };
}
