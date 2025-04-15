{ config, pkgs, ... }:

{
	home.packages = [ pkgs.neovim pkgs.wl-clipboard ];
	programs.neovim.enable = true;
}
