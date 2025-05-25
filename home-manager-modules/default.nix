{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./git.nix
        ./nvim/nvim.nix
        ./nvim/neovide.nix
        ./helix.nix
        ./nixvim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
