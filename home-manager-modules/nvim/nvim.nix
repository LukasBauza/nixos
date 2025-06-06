{ config, pkgs, pkgs-unstable, lib, ... }:

{
    options = {
        neovim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.neovim.enable {
        #home.packages = [ pkgs.wl-clipboard ];
        programs.neovim = {
            package = pkgs-unstable.neovim-unwrapped;
            enable = true;
            defaultEditor = true;

            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;

            extraPackages = with pkgs; [
                # # lua
                # lua-language-server
                # stylua
                # # nix
                # nixpkgs-fmt
                # nixd
            ];

            # extraLuaConfig = ''
            #     # luafile .init.lua
            #     # luafile ./lua/lukas/options.lua
            #     # luafile ./lua/lukas/keymaps.lua
            # '';
        };
    };
}
