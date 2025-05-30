{ config, pkgs, lib, ... }:

{
    options = {
        discord.enable = lib.mkEnableOption "enables discord";
    };

    config = lib.mkIf config.discord.enable {
        home.packages = [ pkgs.discord ];
        programs.discord.enable = true;
    };
}
