{ config, pkgs, ... }:
let
  userHome = config.users.users.c0d3h01.home;
in
{
  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    cargo-edit
    cargo-watch
    cargo-audit
    cargo-expand
    cargo-outdated
    cargo-flamegraph
  ];

  # Set up environment for Rust
  environment.sessionVariables = {
    RUSTUP_HOME = "${userHome}/.rustup";
    CARGO_HOME = "${userHome}/.cargo";
    PATH = "$PATH:${userHome}/.cargo/bin";
  };

  # Configure default toolchain in .config/rustup/settings.toml
  systemd.tmpfiles.rules = [
    "d ${userHome}/.config/rustup 0755 c0d3h01 users - -"
    "f ${userHome}/.config/rustup/settings.toml 0644 c0d3h01 users - -"
  ];

  systemd.services.rustup-setup = {
    script = ''
      echo 'default_toolchain = "stable"' > ${userHome}/.config/rustup/settings.toml
      echo 'profile = "default"' >> ${userHome}/.config/rustup/settings.toml
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "c0d3h01";
    };
  };
}
