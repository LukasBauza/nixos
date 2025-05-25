{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./git.nix
        ./neovim/neovim.nix
        ./neovim/neovide.nix
        ./nixvim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
