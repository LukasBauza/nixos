{ config, pkgs, lib, ... }:

{
    options = {
        tools.enable = lib.mkEnableOption "enables programming tools like gcc etc.";
    };

    config = lib.mkIf config.tools.enable {
        home.packages = with pkgs; [
            cmake
            coreutils
            clang
            gnumake
            libtool
            distrobox
            arduino-ide
            zed-editor
        ];
    };
}
