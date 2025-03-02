{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    rustup
    rust-analyzer
    cargo-edit
    cargo-watch
    cargo-audit
    cargo-expand
    cargo-outdated
    cargo-flamegraph
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
    vadimcn.vscode-lldb
    serayuzgur.crates
  ];

  # Set up environment for Rust
  home.sessionVariables = {
    RUSTUP_HOME = "${config.home.homeDirectory}/.rustup";
    CARGO_HOME = "${config.home.homeDirectory}/.cargo";
    PATH = "$PATH:${config.home.homeDirectory}/.cargo/bin";
  };

  # Configure default toolchain in .config/rustup/settings.toml
  home.file.".config/rustup/settings.toml".text = ''
    default_toolchain = "stable"
    profile = "default"
  '';
}
