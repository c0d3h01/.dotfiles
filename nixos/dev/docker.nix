{ config, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
}

