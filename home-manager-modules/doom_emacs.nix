{ config, pkgs, lib, ... }:

{
    options = {
        doom-emacs.enable = lib.mkEnableOption "enables doom emacs";
    };

    config = lib.mkIf config.doom-emacs.enable {
        home.packages = with pkgs; [ 
            # Required dependencies
            emacs
            ripgrep
            findutils
            # Optional dependencies
            fd
            nodePackages_latest.bash-language-server
            shellcheck
        ];
    };
}
