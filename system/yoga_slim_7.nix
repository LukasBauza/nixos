{ config, pkgs, ... }:

{
	boot.blacklistedKernelModules = [ "elan_i2c" ];
}
