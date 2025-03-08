{ pkgs, ... }:

{
  # -*-[ Bootloader Configuration ]-*-
  boot.loader = {
    systemd-boot.enable = true; # Enable systemd-boot (UEFI boot manager)
    efi.canTouchEfiVariables = true; # Allow modifying EFI variables (needed for UEFI booting)
  };

  # -*-[ Kernel ]-*-
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
