{ config, pkgs, lib, ... }:

{
    options = {
        neovim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.nvim.enable {
        programs.neovim = {
            enable = true;
            package = pkgs-unstable.neovim;
        };
    };
}
