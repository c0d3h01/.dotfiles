{ userSettings, ... }:

{
  # -*- Automount -*-
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # -*- GPG -*-
  # Some programs need SUID wrappers, can be configured further or are
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # -*- X Server System Services -*-
  services = {
    xserver = {
      # libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
      enable = true; # X11 Window System Configuration
      videoDrivers = [ "amdgpu" ];
      xkb.layout = "us";
    };
  };

  # -*- SSH -*-
  services.sshd.enable = true;
  # Enable incoming ssh
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
