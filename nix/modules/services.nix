{ userSettings, ... }:

{
  # -*- Automount -*-
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # -*- GPG -*-
  # Some programs need SUID wrappers, can be configured further or are
  # programs.mtr.enable = true;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # -*- SSH -*-
  services.sshd.enable = true;
  # Enable incoming ssh
  services.openssh.enable = true;
  services.openssh.openFirewall = true;
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.PermitRootLogin = "no";

  # -*- Systemd logs -*-
  services.journald.extraConfig = "SystemMaxUse=100M\nSystemMaxFiles=5";
  services.journald.rateLimitBurst = 1000;
  services.journald.rateLimitInterval = "30s";
}
