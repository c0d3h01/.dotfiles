{ config, pkgs, inputs, ... }:
{
  imports = [
    # Core modules
    ./modules/core

    # Main modules
    ./modules/shell
    ./modules/neovim
    ./modules/kitty
    ./modules/languages
    ./modules/tools
  ];

  # Home Manager basics
  home = {
    username = "c0d3h01";
    homeDirectory = "/home/c0d3h01";
    stateVersion = "24.11";

    # ".config/some-app/config".source = ./config/some-app/config;
    file = { };

    # Basic packages available to user
    #   packages = with pkgs; [
    #   ];
    # };

    # Let Home Manager install and manage itself
    programs.home-manager.enable = true;

    # Enable fontconfig for custom fonts
    fonts.fontconfig.enable = true;

    # Create XDG directories
    xdg = {
      enable = true;
      userDirs.enable = true;
      userDirs.createDirectories = true;
    };
  };
}
