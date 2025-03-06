{
  description = "c0d3h01 dotfiles";

  inputs = {
    # Package sources
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware configuration
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    # Systems definitions
    systems.url = "github:nix-systems/default";

    # NUR (Nix User Repository)
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Pre-commit hooks
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, home-manager, nixos-hardware, nur, pre-commit-hooks, systems, ... }:
    let
      # Helper function to generate system configurations for each supported system
      forEachSystem = nixpkgs.lib.genAttrs (import systems);

      # System specific configuration
      system = "x86_64-linux";

      # Generate specialized pkgs with needed configuration
      pkgsFor = system: import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [ ];
        };
        overlays = [
          (final: prev: {
            # Package overrides can be added here
            stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
          })
          #(import ./overlays/default.nix) 
        ];
      };

      lib = nixpkgs.lib;

      # Shared special arguments to pass to all modules
      specialArgs = {
        inherit inputs system;
      };
    in
    {
      nixosConfigurations = {
        NixOS = lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            # Host, user, modules configurations
            ./nix

            # Home Manager configuration
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.c0d3h01 = import ./home/home.nix;
              };
            }

            # Adds the NUR overlay
            nur.modules.nixos.default
          ];
        };
      };

      # Development shells for this flake
      devShells = forEachSystem (system:
        let pkgs = pkgsFor system; in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nixpkgs-fmt
              nil
              git
              python3
              nodejs
              rustc
              cargo
            ];
          };
        }
      );

      # Pre-commit hooks for linting and formatting
      checks = forEachSystem (system: {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixpkgs-fmt.enable = true;
            statix.enable = true;
            deadnix.enable = true;
          };
        };
      });

      # Formatter configuration
      formatter = forEachSystem (system: (pkgsFor system).nixpkgs-fmt);
    };
}
