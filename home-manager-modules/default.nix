{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./git.nix
        ./neovim/neovim.nix
        ./neovim/neovide.nix
        ./neovim/nixvim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
