{ pkgs, lib, ... }: {
    imports = [
        ./doom-emacs.nix
        ./git.nix
        ./nvim/nvim.nix
        ./nvim/neovide.nix
        ./nixvim.nix
        ./tools.nix
        ./wezterm.nix
        ./vscode.nix
        ./zed-editor.nix
    ];
}
