{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./git.nix
        ./nvim/neovim.nix
        ./nvim/neovide.nix
        ./nixvim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
