{ config, pkgs, ... }:

{
	home.packages = [ pkgs.wezterm ];
	programs.wezterm.enable = true;

	programs.wezterm.extraConfig = 
		''
		-- Pull in the wezterm API
		local wezterm = require("wezterm")

		-- This will hold the configuration.
		local config = wezterm.config_builder()

		-- This is where you actually apply your config choices

		-- For example, changing the color scheme:
		config.color_scheme = "Kanagawa (Gogh)"

		config.font = wezterm.font("IntoneMono Nerd Font")

		config.use_fancy_tab_bar = true

		config.enable_tab_bar = false

		config.window_decorations = "TITLE | RESIZE"

		config.window_padding = {
			left = 2,
			right = 2,
			top = 0,
			bottom = 0,
		}

		config.window_background_opacity = 0.95

		-- and finally, return the configuration to wezterm
		return config
		'';
}
