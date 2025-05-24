{ config, pkgs, lib, ... }:

{
    options = {
        # FIX: MODULE_NAME should be the name of the module.
        MODULE_NAME.enable = lib.mkEnableOption "enables MODULE_NAME";
    };

    # FIX: MODULE_NAME should be the name of the module.
    config = lib.mkIf config.MODULE_NAME.enable {
        # TODO: The setup for the module goes here.
    };
}
