{ config, pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.fira-code
      pkgs.liberation_ttf
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Liberation Serif" ];
        sansSerif = [ "Liberation Sans" ];
        monospace = [ "JetBrainsMono Nerd Font" "Fira Code" ];
      };
    };
  };
}
