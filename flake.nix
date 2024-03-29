{
	description = "My first flake!";

	inputs = {
		#nixpkgs = {
		#	url = "github:NixOS/nixpkgs/nixos-unstable";
		#};
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
                url = "github:nix-community/home-manager/master";
		        # Makes sure that home-manager is the same version as nixpkgs.
                inputs.nixpkgs.follows = "nixpkgs";
            };
        hyprland.url = "github:hyprwm/Hyprland";
	};

	outputs = { self, nixpkgs, home-manager, hyprland, ... }: 
		let
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
			nixosConfigurations = {
				nixos = lib.nixosSystem {
					inherit system;
					modules = [
                    ./configuration.nix
                    hyprland.nixosModules.default
                    { programs.hyprland.enable = true; }
                    ];
				};
			};

			homeConfigurations = {
				lukas = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
					modules = [
                    ./home.nix
                    #hyprland.homeManagerModules.default
                    #{ wayland.windowManager.hyprland.enable = true; }
                    ];
				};
			};
		};
}
