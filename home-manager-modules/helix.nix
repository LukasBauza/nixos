{ config, pkgs, pkgs-unstable, lib, ... }:

{
    options = {
        helix.enable = lib.mkEnableOption "enables helix";
    };

    config = lib.mkIf config.helix.enable {
        programs.helix = {
            package = pkgs-unstable.helix;
            enable = true;
        };
    };
}
