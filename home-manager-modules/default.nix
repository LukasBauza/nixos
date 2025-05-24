{ pkgs, lib, ... }: {
    imports = [
        ./doom_emacs.nix
        ./git.nix
        ./neovim.nix
        ./tools.nix
        ./wezterm.nix
    ];
}
