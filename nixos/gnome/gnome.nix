{ config
, pkgs
, ...
}:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;

  # -*- Gnome "Exclude!" apps -*-
  environment.gnome.excludePackages = with pkgs.gnome; [
    pkgs.gnome-weather
    pkgs.gnome-contacts
    pkgs.gnome-music
    pkgs.yelp
    pkgs.epiphany
    pkgs.baobab
    pkgs.gnome-tour
    pkgs.gnome-system-monitor
    pkgs.gnome-characters
    pkgs.gnome-connections
    pkgs.gnome-font-viewer
    pkgs.geary
    pkgs.gnome-text-editor
  ];
}
