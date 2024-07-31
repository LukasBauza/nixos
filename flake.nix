{
    description = "My first flake!";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            #url = "github:nix-community/home-manager/master";
            # Makes sure that home-manager is the same version as nixpkgs.
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        username = "Lukas";
        name = "Lukas";
        #pkgs = nixpkgs.legacyPackages.${system};
        #pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
        pkgs-unstable = import nixpkgs-unstable { system = "x86_64-linux"; config.allowUnfree = true; };
    in {
        nixosConfigurations = {
            nixos = lib.nixosSystem {
                inherit system;
                modules = [ ./configuration.nix ];
                specialArgs = {
                    inherit username;
                    inherit name;
                    inherit pkgs-unstable;
                };
            };
        };

        homeConfigurations = {
            lukas = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./home.nix ];
                extraSpecialArgs = {
                    inherit username;
                    inherit name;
                    inherit pkgs-unstable;
                };
            };
        };
    };

}
