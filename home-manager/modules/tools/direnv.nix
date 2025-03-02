{ config, pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    stdlib = ''
      # Layouts for different languages
      layout_python() {
        local pyversion=$1
        local pvenv=$2
        if [ -z "$pyversion" ]; then
          pyversion="3"
        fi
        if [ -z "$pvenv" ]; then
          pvenv=".venv"
        fi
        if [ ! -d "$pvenv" ]; then
          python$pyversion -m venv "$pvenv"
        fi
        source "$pvenv/bin/activate"
      }
      
      # Auto-allow trusted direnvs
      use_nix() {
        eval "$(lorri direnv)"
      }
      
      # Load environment variables from .env
      dotenv() {
        set -o allexport
        [ -f .env ] && source .env
        set +o allexport
      }
    '';
  };
}
