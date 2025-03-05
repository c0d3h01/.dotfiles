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
├── home-manager
│   ├── home.nix
│   └── modules
│       ├── editor
│       ├── firefox
│       ├── git
│       ├── shell
│       └── terminal
├── nixos
│   ├── amd
│   │   └── default.nix
│   ├── c0d3h01
│   │   ├── audio
│   │   ├── default.nix
│   │   ├── desktop
│   │   ├── fonts
│   │   ├── networking
│   │   └── pkgs
│   ├── configuration.nix
│   ├── dev
│   │   ├── default.nix
│   │   ├── docker.nix
│   │   ├── java.nix
│   │   ├── python.nix
│   │   └── rust.nix
│   └── hardware-configuration.nix
└── scripts
    ├── bootstrap.sh
    └── update.sh
```
