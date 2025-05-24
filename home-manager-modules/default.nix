{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./git.nix
        ./neovim.nix
        ./neovide.nix
        ./nixvim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
