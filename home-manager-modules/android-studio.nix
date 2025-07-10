{ config, pkgs ? import <nixpkgs> {config.android_sdk.accept_license = true;}, lib, ... }:

{
    options = {
        android-studio.enable = lib.mkEnableOption "enables android-studio";
    };

    config = lib.mkIf config.android-studio.enable {
        # TODO: The setup for the module goes here.
		home.packages = [ pkgs.android-studio-full ];
		programs.android-studio-full.enable = true;
		#android_sdk.accept_license = true;
    };
}
