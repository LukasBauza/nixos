{ config, pkgs, lib, nixvim, ... }:

{
    options = {
        nixvim.enable = lib.mkEnableOption "enables nixvim";
    };

    config = lib.mkIf config.nixvim.enable {
        programs.nixvim = {
            enable = true;

            colorschemes.catppuccin.enable = true;
            plugins.lualine.enable = true;
        };
    };
}
