{ pkgs, ... }:
{
  imports = [
    ./modules
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "c0d3h01";
  home.homeDirectory = "/home/c0d3h01";

  # This value determines the Home Manager release that your configuration is
  home.stateVersion = "24.11";

  # Enable firefox coustom modules
  modules.firefox.enable = true;

  # home.file.".modules/shell/.zshrc".source = ./modules/zsh/.zshrc;

  # Core configuration for $home
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
    PAGER = "less";
    LESS = "-R";
  };

  # Install home-manager pkgs
  home.packages = with pkgs; [
    home-manager
    fastfetch
    glances
    tmux
    xclip
    curl
    wget
    eza
    bat
    inxi
    fd
    direnv
    ripgrep
    dust
    procs
    git
    git-lfs
    gh
    gitui
    nix-output-monitor
    diff-so-fancy
    nix-prefetch-github
    tree
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    lua-language-server
    rust-analyzer
    nil
    appimage-run
    asar
    fuse
    dos2unix
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
      #NPM_CONFIG_PREFIX = "$HOME/.npm-global";
      #PATH = "$HOME/.npm-global/bin:$PATH";
    };
  };
}
