{ config, pkgs, lib, ... }:

{
    options = {
        gnome.enable = lib.mkEnableOption "enables gnome";
    };

    config = lib.mkIf config.gnome.enable {
      dconf.settings = {
        "org/gnome/desktop/interface" = {
	  color-scheme = "prefer-dark";
	};
      };
    };
}
