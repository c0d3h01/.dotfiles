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
│       ├── editor
│       ├── firefox
│       ├── git
│       ├── gtk
│       ├── shell
│       └── terminal
├── image
│   ├── gitjump.png
│   ├── review.png
│   └── wallpaper.png
├── nix
│   ├── apps
│   │   ├── default.nix
│   │   ├── flatpak.nix
│   │   ├── gamemode.nix
│   │   ├── steam.nix
│   │   └── virtualization.nix
│   ├── c0d3h01
│   │   ├── audio
│   │   ├── default.nix
│   │   ├── desktop
│   │   ├── fonts
│   │   └── networking
│   ├── default.nix
│   ├── dev
│   │   ├── default.nix
│   │   ├── docker.nix
│   │   ├── java.nix
│   │   ├── python.nix
│   │   └── rust.nix
│   ├── modules
│   │   ├── default.nix
│   │   ├── hardware.nix
│   │   ├── kernel.nix
│   │   ├── opengl.nix
│   │   ├── printing.nix
│   │   ├── systemd.nix
│   │   ├── timesyncd.nix
│   │   └── tlp.nix
│   └── security
│       ├── automount.nix
│       ├── default.nix
│       ├── dns.nix
│       ├── firewall.nix
│       ├── gpg.nix
│       └── sshd.nix
└── scripts
    ├── bootstrap.sh
    └── update.sh
```
