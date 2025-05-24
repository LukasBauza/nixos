{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            # Makes sure that home-manager is the same version as nixpkgs.
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
            #lib = nixpkgs.lib;
        system = "x86_64-linux";
        username = "Lukas";
        name = "Lukas";
        pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
        pkgs-unstable = import nixpkgs-unstable { system = "x86_64-linux"; config.allowUnfree = true; };
    in {
        nixosConfigurations = {
            # nixos-pc is the hostname that is used on the system
            nixos-pc = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                        ./hosts/nixos-pc/configuration.nix
                        ./nixos-modules/default.nix
                    ];
                # This passes the variables into the modules.
                specialArgs = {
                    inherit username;
                    inherit name;
                    inherit pkgs-unstable;
                };
            };

            nixos-laptop = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                        ./hosts/nixos-laptop/configuration.nix
                        ./nixos-modules/default.nix
                    ];
                specialArgs = {
                    inherit username;
                    inherit name;
                    inherit pkgs-unstable;
                };
            };
        };

        homeConfigurations = {
            "lukas@nixos-pc" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                        ./hosts/nixos-pc/home.nix
                        ./home-manager-modules/default.nix
                    ];
                extraSpecialArgs = {
                    inherit username;
                    inherit name;
                    inherit pkgs-unstable;
                };
            };
            "lukas@nixos-laptop" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                        ./hosts/nixos-pc/home.nix
                        ./home-manager-modules/default.nix
                    ];
                extraSpecialArgs = {
                    inherit username;
                    inherit name;
                    inherit pkgs-unstable;
                };
            };
        };
    };
}
