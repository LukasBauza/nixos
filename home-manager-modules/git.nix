{ config, pkgs, lib, ... }:

{
    options = {
        git.enable = lib.mkEnableOption "enables git"
    };

    config = lib.mkIf config.git.enable {
        home.packages = [ pkgs.git ];
        programs.git.enable = true;
    };
}
