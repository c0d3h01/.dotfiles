{ lib, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      dejavu_fonts
      hack-font
    ];

    fontconfig = {
      defaultFonts = {
        serif = lib.mkForce [ "DejaVu Serif" ];
        sansSerif = lib.mkForce [ "DejaVu Sans" ];
        monospace = lib.mkForce [ "Hack" ];
      };
    };
  };
}
