{ pkgs, lib, ... }: {
    imports = [
        ./desktop/gnome.nix
        ./desktop/kde.nix
        ./fonts.nix
    ];
}
