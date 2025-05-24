{ config, pkgs, lib, ... }:

{
    options = {
        kde.enable = lib.mkEnableOption "enables kde";
    };

    config = lib.mkIf config.kde.enable {
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      hardware.bluetooth.enable = true;
      hardware.bluetooth.settings.General.Experimental = true;	# Needed for displaying battery percentage
    };
}
