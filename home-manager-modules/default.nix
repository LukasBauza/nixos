{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./discord.nix
        ./git.nix
        ./nvim/nvim.nix
        ./nvim/neovide.nix
        ./nixvim.nix
        ./helix.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
