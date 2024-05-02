{ config, pkgs, pkgs-unstable, ... }:

{
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "lukas";
    home.homeDirectory = "/home/lukas";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

    nixpkgs.config.allowUnfree = true;

    # Fonts
    fonts.fontconfig.enable = true;

    # Allows obsidian to work.
    nixpkgs.config.permittedInsecurePackages = [
        "electron-25.9.0"
    ];

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = 
    (with pkgs; [
        neovim
        brave
        obsidian
        standardnotes
        git
        gcc
        syncthing
        zotero
        wl-clipboard        # Needed for neovim clipboard.
        libreoffice-qt
        python3
        qtcreator
        tmux
        zellij
        distrobox
        podman              # Needed for distrobox.
        virt-manager
        libvirt             # Needed for virt-manager
        gnumake
        cargo
        discord
        ripgrep
        fd
        #vimPlugins.nvim-treesitter
        lazygit
        nodejs_21
        tree-sitter
        btop
        appimage-run
        gnome.gnome-software    # Flatpak store
        whatsapp-for-linux
        (pkgs.nerdfonts.override { fonts = [ "IntelOneMono" ]; })
    ])
    ++
    (with pkgs-unstable; [
        ciscoPacketTracer8
        protonvpn-gui
        alacritty
    ]);

    # QEMU settings for virt-manager.
    dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
            autoconnect = ["qemu:///system"];
            uris = ["qemu:///system"];
        };
    };

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. If you don't want to manage your shell through Home
    # Manager then you have to manually source 'hm-session-vars.sh' located at
    # either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/lukas/etc/profile.d/hm-session-vars.sh
    #
    home.sessionVariables = {
    # EDITOR = "emacs";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

}
