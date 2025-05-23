{ config, pkgs, lib, ... }:

{
    options = {
        nixvim.enable = lib.mkEnableOption "enables nixvim";
    };

    config = lib.mkIf config.nixvim.enable {
        programs.nixvim = {
            enable = true;

            colorschemes.kanagawa.enable = true;
        };
    };
}
