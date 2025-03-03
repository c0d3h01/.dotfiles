{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.docker;
in
{
  options.modules.docker = {
    enable = mkEnableOption "Docker setup";

    user = mkOption {
      type = types.str;
      default = "";
      description = "User to add to the docker group";
    };

    composeEnable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Docker Compose";
    };

    autoPrune = mkOption {
      type = types.bool;
      default = true;
      description = "Automatically clean up unused Docker resources";
    };

    enableBuildx = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Docker Buildx for multi-architecture builds";
    };
  };

  config = mkIf cfg.enable {
    # Basic Docker daemon configuration
    virtualisation.docker = {
      enable = true;

      # Auto prune configuration
      autoPrune = mkIf cfg.autoPrune {
        enable = true;
        dates = "weekly";
        flags = [ "--all" "--volumes" ];
      };
    };

    # Add user to docker group
    users.groups.docker.members =
      if cfg.user != "" then [ cfg.user ] else [ ];

    # Install essential Docker-related packages
    environment.systemPackages = with pkgs; [
      docker-client
    ]
    ++ (if cfg.composeEnable then [ docker-compose ] else [ ])
    ++ (if cfg.enableBuildx then [ docker-buildx ] else [ ]);

    programs.zsh.shellAliases = mkIf config.programs.zsh.enable
      {
        d = "docker";
        dps = "docker ps";
        di = "docker images";
        dprune = "docker system prune -af";
      } // (if cfg.composeEnable then {
      dc = "docker-compose";
      dcu = "docker-compose up -d";
      dcd = "docker-compose down";
    } else { });
  };
}
