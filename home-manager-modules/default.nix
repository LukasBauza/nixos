{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        #./discord.nix
        ./git.nix
        ./nvim/default.nix
        ./nvim/neovide.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
