{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    dotDir = ".config/zsh";

    # Shell history settings
    history = {
      expireDuplicatesFirst = true;
      ignoreSpace = true;
      save = 10000;
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    # Shell aliases
    shellAliases = {
      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      
      # Command aliases
      ls = "ls --color=auto";
      ll = "ls -la";
      la = "ls -a";
      
      # Git aliases
      g = "git";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gs = "git status";
      
      # Nix related
      nrs = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
      hmb = "home-manager build";
      
      # Neovim
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
    };

    # ZSH plugins
    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
    ];

    # Additional options
    initExtra = ''
      # Set prompt
      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats '%b '
      setopt PROMPT_SUBST
      PROMPT='%F{green}%n%f@%F{blue}%m%f %F{yellow}%~%f %F{red}''${vcs_info_msg_0_}%f$ '

      # Load direnv
      eval "$(direnv hook zsh)"
      
      # Better history navigation with arrow keys
      bindkey "^[[A" history-beginning-search-backward
      bindkey "^[[B" history-beginning-search-forward
    '';
  };

  # Enable starship prompt - a minimal, blazing-fast, and infinitely customizable prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
      nix_shell = {
        disabled = false;
        impure_msg = "[impure shell](bold red)";
        pure_msg = "[pure shell](bold green)";
        symbol = "❄️ ";
      };
      git_branch = {
        symbol = "🌱 ";
      };
    };
  };
}
