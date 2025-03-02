#!/usr/bin/env bash
set -euo pipefail

# Bootstrap script for new machine setup

echo "==> Setting up dotfiles..."

# Ensure nix is installed
if ! command -v nix >/dev/null 2>&1; then
  echo "==> Installing Nix..."
  sh <(curl -L https://nixos.org/nix/install) --daemon
fi

# Ensure flakes are enabled
if ! grep -q "experimental-features" ~/.config/nix/nix.conf 2>/dev/null; then
  mkdir -p ~/.config/nix
  echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
fi

# Clone the repository if running from a downloaded script
if [[ ! -d "${HOME}/dotfiles" ]]; then
  echo "==> Cloning dotfiles repository..."
  git clone https://github.com/c0d3h01/dotfiles.git "${HOME}/dotfiles"
  cd "${HOME}/dotfiles"
else
  cd "${HOME}/dotfiles"
fi

# Detect hostname for configuration
HOST=$(hostname)
echo "==> Detected hostname: ${HOST}"

# Install the configuration
echo "==> Installing system configuration..."
sudo nixos-rebuild switch --flake ".#${HOST}"

echo "==> Dotfiles setup complete!"
