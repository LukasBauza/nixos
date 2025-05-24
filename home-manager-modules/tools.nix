{ config, pkgs, lib, ... }:

{
    options = {
        tools.enable = lib.mkEnableOption "enables programming tools like gcc etc.";
    };

    config = lib.mkIf config.git.enable {
        home.packages = with pkgs; [
            cmake
            coreutils
            clang
            gnumake
            libtool
            distrobox
            #podman
            arduino-ide
        ];
    };
}
