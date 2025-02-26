{
  description = "c0d3h01's NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # This is the correct attribute path that home-manager looks for
      homeConfigurations = {
        "c0d3h01" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          
          # Specify your home configuration modules here
          modules = [
            ./home.nix
          ];
          
          # Pass arguments to the modules
          extraSpecialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
