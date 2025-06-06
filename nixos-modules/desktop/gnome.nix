{ config, pkgs, lib, ... }:

{
    options = {
        gnome.enable = lib.mkEnableOption "enables gnome";
    };

    config = lib.mkIf config.gnome.enable {
        # Enable the GNOME Desktop environment.
        services.xserver.displayManager.gdm.enable = true;
        services.xserver.desktopManager.gnome.enable = true;
        
        # Exclude GNOME packages.
        environment.gnome.excludePackages = with pkgs; [
            cheese
            gedit
            yelp
            geary
            seahorse
            gnome-music
            gnome-tour
            gnome-calendar
            gnome-weather
            gnome-contacts
            gnome-maps
            epiphany
        ];
    };
}
