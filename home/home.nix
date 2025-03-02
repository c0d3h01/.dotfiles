{ config, pkgs, inputs, ... }:
{
  imports = [
  ./config/git
  ./config/kitty
  ./config/shell
  ./config/neovim
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
  home.packages = with pkgs; [
  ];

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

    # Configure mimeapps
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = "nvim.desktop";
        "application/pdf" = "org.gnome.Evince.desktop";
        "image/png" = "org.gnome.eog.desktop";
        "image/jpeg" = "org.gnome.eog.desktop";
      };
    };
  };

  # Core configuration for $home
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
    PAGER = "less";
    LESS = "-R";
  };
}
