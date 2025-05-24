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
            pkgs.cheese
            pkgs
            pkgs.yelp
            pkgs.file-roller
            pkgs.geary
            pkgs.seahorse
            pkgs.gnome-music
            pkgs-tour
            pkgs.gnome-calendar
            pkgs.gnome-weather
            pkgs.gnome-contacts
            pkgs.gnome-maps
            pkgs.epiphany
        ];
    };
}
