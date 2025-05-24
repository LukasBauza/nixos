{ config, pkgs, lib, ... }:

{
    options = {
        neovim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.neovim.enable {
        home.packages = [ pkgs.wl-clipboard ];
        programs.neovim.enable = true;
    };
}
