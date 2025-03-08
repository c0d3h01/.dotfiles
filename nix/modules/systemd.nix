{ ... }:

{
  services.journald.extraConfig = "SystemMaxUse=200M\nSystemMaxFiles=10";
  services.journald.rateLimitBurst = 1000;
  services.journald.rateLimitInterval = "60s";
}
