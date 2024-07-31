{ config, pkgs, ... }:

{
	home.packages = [ pkgs.git ];
	programs.git.enable = true;
	programs.git.userName = "Lukas Bauza";
	programs.git.userEmail = "LukasBauza.LB@proton.me";
}
