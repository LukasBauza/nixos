{ config, pkgs, ... }

{
	programs.hyprland.enable = true;
	# Optionsal, hint electron apps to use wayland
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
