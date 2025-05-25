{ config, pkgs, lib, ... }:

{
    options = {
        vscode.enable = lib.mkEnableOption "enables vscode";
    };

    config = lib.mkIf config.vscode.enable {
        packages.git.enable = true;
    };
}
