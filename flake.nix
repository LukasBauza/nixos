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
	};

	outputs = { self, nixpkgs, home-manager, ... }: 
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
                    ];
				};
			};

			homeConfigurations = {
				lukas = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
					modules = [
                    ./home.nix
                    ];
				};
			};
		};
}
