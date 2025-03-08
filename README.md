[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%40with%40Nix&color=41439a)](https://builtwithnix.org)

## 📂 Dotfiles Structure
```
.
├── LICENSE
├── Makefile
├── README.md
├── README_TREE.md
├── flake.lock
├── flake.nix
├── home
│   ├── home.nix
│   └── modules
│       ├── default.nix
│       ├── firefox.nix
│       ├── git.nix
│       ├── gtk.nix
│       ├── kitty.nix
│       ├── neovim.nix
│       └── zsh.nix
├── image
│   ├── gitjump.png
│   └── wallpaper.png
├── nix
│   ├── apps
│   │   ├── default.nix
│   │   ├── printing.nix
│   │   ├── tlp.nix
│   │   └── virtualization.nix
│   ├── c0d3h01
│   │   ├── audio.nix
│   │   ├── default.nix
│   │   ├── desktop.nix
│   │   ├── fonts.nix
│   │   └── networking.nix
│   ├── default.nix
│   ├── dev
│   │   ├── default.nix
│   │   ├── docker.nix
│   │   ├── java.nix
│   │   ├── python.nix
│   │   └── rust.nix
│   ├── hardware-configuration.nix
│   └── modules
│       ├── boot.nix
│       ├── default.nix
│       ├── hardware.nix
│       ├── services.nix
│       └── systemd.nix
└── scripts
    ├── bootstrap.sh
    └── update.sh
```
