{ config, pkgs, pkgs-unstable, lib, ... }:

{
    options = {
        neovim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.neovim.enable {
        #home.packages = [ pkgs.wl-clipboard ];
        programs.neovim = {
            enable = true;
            defaultEditor = true;
            extraConfig = lib.fileContents ../../nvim/init.lua
        }

        environment.variables.EDITOR = "nvim";
    };
}
