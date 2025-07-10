{ pkgs, lib, ... }: {
    imports = [
	./android-studio.nix
        ./doom-emacs.nix
        #./discord.nix
        ./git.nix
        ./nvim/neovide.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
