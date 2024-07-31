{ config, pkgs, ... }:

{
	# Enable the GNOME Desktop environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	
	# Exclude GNOME packages.
	environment.gnome.excludePackages = with pkgs; [
		gnome.cheese
		gedit
		gnome.yelp
		gnome.file-roller
		gnome.geary
		gnome.seahorse
		gnome.gnome-music
		gnome-tour
		gnome.gnome-calendar
		gnome.gnome-weather
		gnome.gnome-contacts
		gnome.gnome-maps
		gnome.epiphany
	];
}
