My PC configuration using NixOS, nix package manager, flakes and home-manager.

- Make sure use the original hardware-configuraiton.nix file, since NixOs generates and original hardware-configuration.nix file everytime an OS is installed.

- The configuration.nix file also may contain some information that is unique everytime the OS is installed. For `boot.initrd.luks.devices."XXXXXXX".devices = "XXXXXXX";`, where `XXXXXXX` is located, that will be a unique generated ID for LUKS/UUID. This means you need to save the originals ID's in order for the OS to boot.
