{
  description = "NixOS configuration with Home Manager";

  inputs = {
    # Package sources
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Hardware configuration
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    
    # NUR (Nix User Repository)
    nur.url = "github:nix-community/NUR";
    
    # Systems definitions
    systems.url = "github:nix-systems/default";
    
    # Snap packages
    nix-snapd.url = "github:nix-community/nix-snapd";
    nix-snapd.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, nix-snapd, home-manager, nixos-hardware, nur, systems, ... }:
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
        nur.overlay
        (final: prev: {
          # Package overrides can be added here
          stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        })
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
          # Host-specific configuration
          ./configuration.nix
          ./hardware-configuration.nix

          nix-snapd.nixosModules.default
        {
          services.snap.enable = true;
        }
          
          # Home Manager configuration
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              users.c0d3h01 = import ./home-manager/home.nix;
            };
          }
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
          ];
        };
      }
    );
    
    # Formatter configuration
    formatter = forEachSystem (system: (pkgsFor system).nixpkgs-fmt);
  };
}
