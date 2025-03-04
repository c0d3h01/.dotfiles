{ config, pkgs, inputs, ... }:
{
  imports = [
    ./modules/git
    ./modules/shell
    ./modules/editor
    ./modules/terminal
    ./modules/firefox
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "c0d3h01";
  home.homeDirectory = "/home/c0d3h01";

  # This value determines the Home Manager release that your configuration is
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable firefox coustom modules
  modules.firefox.enable = true;

  # ".config/some-app/config".source = ./config/some-app/config;
  home.file = { };

  # Core configuration for $home
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
    PAGER = "less";
    LESS = "-R";
  };

  # XDG Base Directory specification
  xdg = {
    enable = true;

    # Define standard directories
    userDirs = {
      enable = true;
      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      templates = "$HOME/Templates";
      publicShare = "$HOME/Public";
    };
  };
}
