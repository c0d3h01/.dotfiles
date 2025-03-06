{ pkgs
, lib
, ...
}:

{
  fonts.enableDefaultPackages = false;

  fonts.packages = with pkgs; [
    dejavu_fonts
    gyre-fonts
    hack-font
    liberation_ttf
    monocraft
    twitter-color-emoji
    unifont
  ];

  fonts.fontconfig.defaultFonts = {
    serif = lib.mkForce [ "DejaVu Serif" ];
    sansSerif = lib.mkForce [ "DejaVu Sans" ];
    monospace = lib.mkForce [ "Hack" ];
    emoji = lib.mkForce [ "Twitter Color Emoji" ];
  };
}
