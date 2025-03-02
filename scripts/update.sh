#!/usr/bin/env bash
set -euo pipefail

# Script to update dotfiles and system

echo "==> Updating dotfiles..."
cd "${HOME}/dotfiles"

# Check if there are local changes
if [[ -n "$(git status --porcelain)" ]]; then
  echo "==> Local changes detected. Stashing..."
  git stash
fi

# Update repository
echo "==> Pulling latest changes..."
git pull origin master

# Update flake
echo "==> Updating flake..."
nix flake update

# Rebuild system
echo "==> Rebuilding system..."
make switch

echo "==> Update complete!"
