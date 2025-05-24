{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./git.nix
        ./neovim.nix
        ./nixvim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
