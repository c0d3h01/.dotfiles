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
  home.stateVersion = "24.11";

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
    eza
    fzf
    tmux

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
  programs.home-manager.enable = true;

  # Configure Kitty terminal
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "JetBrainsMono Nerd Font Bold";
      italic_font = "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
      font_size = 12;
      
      # Window settings
      window_padding_width = 4;
      hide_window_decorations = "no";
      confirm_os_window_close = 0;
      
      # Color scheme - One Dark
      foreground = "#abb2bf";
      background = "#282c34";
      selection_foreground = "#282c34";
      selection_background = "#979eab";
      cursor = "#cccccc";
      
      # Black
      color0 = "#282c34";
      color8 = "#545862";
      # Red
      color1 = "#e06c75";
      color9 = "#e06c75";
      # Green
      color2 = "#98c379";
      color10 = "#98c379";
      # Yellow
      color3 = "#e5c07b";
      color11 = "#e5c07b";
      # Blue
      color4 = "#61afef";
      color12 = "#61afef";
      # Magenta
      color5 = "#c678dd";
      color13 = "#c678dd";
      # Cyan
      color6 = "#56b6c2";
      color14 = "#56b6c2";
      # White
      color7 = "#abb2bf";
      color15 = "#c8ccd4";
      
      # Tab bar
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      active_tab_foreground = "#282c34";
      active_tab_background = "#61afef";
      inactive_tab_foreground = "#abb2bf";
      inactive_tab_background = "#353b45";
    };
    
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+up" = "increase_font_size";
      "ctrl+shift+down" = "decrease_font_size";
      "ctrl+shift+home" = "restore_font_size";
    };
  };
}
