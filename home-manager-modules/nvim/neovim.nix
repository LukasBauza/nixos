{ config, pkgs, pkgs-unstable, lib, ... }:

{
    options = {
        neovim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.neovim.enable {
	home.packages = with pkgs-unstable; [
			neovim
		];
        # programs.neovim = {
        #     enable = true;
        #     package = pkgs-unstable.neovim;
        # };
    };
}
