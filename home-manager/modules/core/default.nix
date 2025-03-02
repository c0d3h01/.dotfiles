{ config, pkgs, ... }:
{
  imports = [
    ./xdg.nix
  ];
  
  # Core configuration shared across all home-manager setups
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
    VISUAL = "nvim";
    PAGER = "less";
    LESS = "-R";
  };
}