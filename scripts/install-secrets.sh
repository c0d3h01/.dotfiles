#!/usr/bin/env bash
set -euo pipefail

# Script to install secrets

SECRETS_DIR="${HOME}/dotfiles/secrets"
GPG_KEY="GPG_KEY_ID+"

decrypt_secret() {
  local file=$1
  local output=$2
  
  echo "==> Decrypting ${file} to ${output}..."
  gpg --decrypt --recipient "${GPG_KEY}" "${file}" > "${output}"
  chmod 600 "${output}"
}

# SSH keys
if [[ -f "${SECRETS_DIR}/ssh/id_rsa.gpg" ]]; then
  mkdir -p ~/.ssh
  decrypt_secret "${SECRETS_DIR}/ssh/id_rsa.gpg" ~/.ssh/id_rsa
  chmod 600 ~/.ssh/id_rsa
fi

if [[ -f "${SECRETS_DIR}/ssh/id_rsa.pub.gpg" ]]; then
  decrypt_secret "${SECRETS_DIR}/ssh/id_rsa.pub.gpg" ~/.ssh/id_rsa.pub
fi

# GPG keys
if [[ -f "${SECRETS_DIR}/gpg/private.key.gpg" ]]; then
  decrypt_secret "${SECRETS_DIR}/gpg/private.key.gpg" /tmp/private.key
  gpg --import /tmp/private.key
  rm /tmp/private.key
fi

# Environment files
if [[ -f "${SECRETS_DIR}/env/work.env.gpg" ]]; then
  mkdir -p ~/.config/env
  decrypt_secret "${SECRETS_DIR}/env/work.env.gpg" ~/.config/env/work.env
fi

echo "==> Secrets installed successfully!"
