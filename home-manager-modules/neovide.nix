{ config, pkgs, pkgs-unstable, lib, ... }:

{
    options = {
        neovide.enable = lib.mkEnableOption "enables neovide";
    };

    config = lib.mkIf config.neovide.enable {
        programs.neovide = {
            package = pkgs-unstable.neovide;
        };
    };
}
