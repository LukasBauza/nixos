{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./git.nix
        ./neovim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
