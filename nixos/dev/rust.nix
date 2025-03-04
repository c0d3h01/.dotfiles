{ config, pkgs, ... }:

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
}
