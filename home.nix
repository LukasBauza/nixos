{ config, pkgs, pkgs-unstable, ... }:

{

  programs.home-manager.enable = true;

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  imports = [
	./development/git.nix
	./development/doom_emacs.nix
	# ./development/wezterm.nix
	./system/font.nix
	./development/tools.nix
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.
	
	nixpkgs.config.allowUnfree = true;

	# Fonts
	fonts.fontconfig.enable = true;

  home.packages = 
	(with pkgs; [
		brave
		protonvpn-gui
		syncthing
		zotero
        python3
        pandoc
        texliveBasic
        standardnotes
        ciscoPacketTracer8
        virt-manager
  	])
	++
	(with pkgs-unstable; [
		neovim
		zed-editor
	]);

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
}
