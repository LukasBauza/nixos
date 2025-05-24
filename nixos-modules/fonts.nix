{ config, pkgs, lib, ... }:

{
    options = {
        fonts.enable = lib.mkEnableOption "enables fonts";
    };

    config = lib.mkIf config.fonts.enable {
        fonts.packages = with pkgs; [
            #(nerdfonts.override { fonts = [ "IntelOneMono" ]; })
            nerd-fonts.intone-mono
        ];
    };
}
