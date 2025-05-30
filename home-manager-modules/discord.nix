{ config, pkgs, lib, ... }:

{
    options = {
        discord.enable = lib.mkEnableOption "enables discord";
    };

    config = lib.mkIf config.discord.enable {
        programs.discord.enable = true;
    };
}
