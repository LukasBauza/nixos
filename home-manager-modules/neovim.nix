{ config, pkgs, pkgs-unstable, lib, ... }:

{
    options = {
        neovim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.neovim.enable {
        #home.packages = [ pkgs.wl-clipboard ];
        programs.neovim = {
            package = pkgs-unstable.neovim-unwrapped;
            enable = true;

            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;

            defaultEditor = true;
        };
    };
}
