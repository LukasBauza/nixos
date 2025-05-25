{ config, pkgs, lib, ... }:

{
    options = {
        zed.enable = lib.mkEnableOption "enables zed";
    };

    config = lib.mkIf config.zed.enable {
        programs.zed.enable = true;
    };
}
