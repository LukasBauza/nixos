{ config, pkgs, ... }:

{
	home.packages = with pkgs; [ 
		# Required dependencies
		emacs
		ripgrep
		findutils
		# Optional dependencies
		fd
	];
}
