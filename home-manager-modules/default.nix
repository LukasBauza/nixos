{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        #./discord.nix
        ./git.nix
        ./nvim/neovide.nix
	./nvim/neovim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
