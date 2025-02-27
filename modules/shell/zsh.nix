{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    autocd = true;
    dotDir = ".config/zsh";
    
    # Shell history settings
    history = {
      expireDuplicatesFirst = true;
      ignoreSpace = true;
      save = 15000;
      size = 15000;
      path = "${config.xdg.dataHome}/zsh/history";
      share = true; 
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
      
      # Modern ls replacement with eza
      lx = "eza --icons --group-directories-first";
      lxa = "eza -a --icons --group-directories-first";
      lxl = "eza -l --icons --group-directories-first";
      lxla = "eza -la --icons --group-directories-first";
      lxt = "eza --tree --level=2 --icons";
      
      # Git aliases
      g = "git";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gs = "git status";
      gl = "git log --oneline";
      gd = "git diff";
      gco = "git checkout";
      
      # Neovim
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      
      # Additional Aliases
      ff = "fastfetch";
      cl = "clear";
      x = "exit";
      
      # NixOS Aliases
      nrs = "sudo nixos-rebuild switch";
      nrb = "sudo nixos-rebuild boot";
      nrt = "sudo nixos-rebuild test";
      hs = "home-manager switch";
      hmb = "home-manager build";
      nsearch = "nix search nixpkgs";
      nrun = "nix-shell -p";
      neconf = "sudo $EDITOR /etc/nixos/configuration.nix";
      nhconf = "$EDITOR ~/.config/nixpkgs/home.nix";
      nconf = "nix show-config";
      nrebuild = "sudo nixos-rebuild switch --upgrade";
      nclean = "sudo nix-collect-garbage -d";
      ncleanall = "sudo nix-store --gc && sudo nix-collect-garbage -d";
      nstore-opt = "sudo nix-store --optimise";
      ninfo = "nix-shell -p nix-info --run \"nix-info -m\"";
      
      # System
      sysinfo = "fastfetch";
      df = "df -h";
      du = "du -h";
      free = "free -h";
      mkdir = "mkdir -pv";
      path = "echo -e ${builtins.concatStringsSep "\\n" config.home.sessionPath}";
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
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
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
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.1.1";
          sha256 = "1h1f0kkh8f8p4kkpis9fk05qwb6cxpj23x839df0aqgbp616sbmg";
        };
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "fast-syntax-highlighting";
          rev = "v1.55";
          sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
        };
      }
      {
        name = "zsh-history-substring-search";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          rev = "v1.0.2";
          sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
        };
      }
    ];
    
    # Environment variables
    envExtra = ''
      export EDITOR="nvim"
      export VISUAL="nvim"
      export MANPAGER="nvim +Man!"
      export MANWIDTH=80
      export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --color=always {}'"
      export BAT_THEME="Catppuccin-mocha"
    '';
    
    # Additional options
    initExtra = ''
      # Set prompt
      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%f '
      setopt PROMPT_SUBST
      
      # Enable colors
      autoload -U colors && colors
      
      # Better history search
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      bindkey '^P' history-substring-search-up
      bindkey '^N' history-substring-search-down
      
      # vi mode
      bindkey -v
      export KEYTIMEOUT=1
      
      # Change cursor shape for different vi modes
      function zle-keymap-select {
        if [[ ''${KEYMAP} == vicmd ]] ||
           [[ $1 = 'block' ]]; then
          echo -ne '\e[1 q'
        elif [[ ''${KEYMAP} == main ]] ||
             [[ ''${KEYMAP} == viins ]] ||
             [[ ''${KEYMAP} = "" ]] ||
             [[ $1 = 'beam' ]]; then
          echo -ne '\e[5 q'
        fi
      }
      zle -N zle-keymap-select
      
      # Use beam shape cursor for each new prompt
      preexec() { echo -ne '\e[5 q' ;}
      
      # Load direnv
      eval "$(direnv hook zsh)"
      
      # fzf integration
      if [ -n "''${commands[fzf-share]}" ]; then
        source "$(fzf-share)/key-bindings.zsh"
        source "$(fzf-share)/completion.zsh"
      fi
      
      # Enable auto-paired quotes and brackets
      autoload -Uz bracketed-paste-magic
      zle -N bracketed-paste bracketed-paste-magic
      
      # Suffix aliases
      alias -s {md,txt}=$EDITOR
      alias -s {html,css,js}=$EDITOR
      
      # Directory colors
      eval "$(${pkgs.coreutils}/bin/dircolors -b)"
      
      # Set a custom, themed title for terminal
      function precmd() {
        vcs_info
        print -Pn "\e]0;%~\a"
      }
      
      function preexec() {
        print -Pn "\e]0;$1\a"
      }
    '';
  };
  
  # Enable Starship prompt with improved styling
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$username$hostname$directory"
        "$git_branch$git_state$git_status"
        "$nix_shell$cmd_duration$jobs"
        "$line_break$character"
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
        vicmd_symbol = "[❮](bold blue)";
      };
      nix_shell = {
        disabled = false;
        impure_msg = "[impure](bold red)";
        pure_msg = "[pure](bold green)";
        symbol = "❄️ ";
        format = "via [$symbol$name]($style) ";
      };
      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        style = "bold cyan";
        format = "[$path]($style)[$read_only]($read_only_style) ";
      };
      git_branch = {
        symbol = "🌱 ";
        style = "bold purple";
        format = "on [$symbol$branch]($style) ";
      };
      git_status = {
        style = "bold yellow";
        format = "([\\[$all_status$ahead_behind\\]]($style) )";
      };
      cmd_duration = {
        min_time = 2000;
        format = "took [$duration](bold yellow) ";
      };
      username = {
        style_user = "bold green";
        style_root = "bold red";
        format = "[$user]($style)@";
        disabled = false;
        show_always = true;
      };
      hostname = {
        style = "bold blue";
        format = "[$hostname]($style) in ";
        disabled = false;
      };
      jobs = {
        symbol = "⚙️";
        style = "bold blue";
        format = "[$symbol$number]($style) ";
      };
    };
  };
  
  # Create ZSH theme directory
  home.file.".config/zsh/themes".source = pkgs.runCommand "zsh-themes" {} ''
    mkdir -p $out
    cat > $out/catppuccin-mocha.zsh-theme << EOF
    # Catppuccin Mocha ZSH Theme
    
    # Colors
    local rosewater='#f5e0dc'
    local flamingo='#f2cdcd'
    local pink='#f5c2e7'
    local mauve='#cba6f7'
    local red='#f38ba8'
    local maroon='#eba0ac'
    local peach='#fab387'
    local yellow='#f9e2af'
    local green='#a6e3a1'
    local teal='#94e2d5'
    local sky='#89dceb'
    local sapphire='#74c7ec'
    local blue='#89b4fa'
    local lavender='#b4befe'
    local text='#cdd6f4'
    local subtext1='#bac2de'
    local subtext0='#a6adc8'
    local overlay2='#9399b2'
    local overlay1='#7f849c'
    local overlay0='#6c7086'
    local surface2='#585b70'
    local surface1='#45475a'
    local surface0='#313244'
    local base='#1e1e2e'
    local mantle='#181825'
    local crust='#11111b'
    
    # Set colors for highlighting
    ZSH_HIGHLIGHT_STYLES[default]=fg=$text
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=$red
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=$mauve,bold
    ZSH_HIGHLIGHT_STYLES[alias]=fg=$blue
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=$blue
    ZSH_HIGHLIGHT_STYLES[function]=fg=$blue
    ZSH_HIGHLIGHT_STYLES[command]=fg=$blue
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=$teal,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=$lavender
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=$blue
    ZSH_HIGHLIGHT_STYLES[path]=fg=$yellow,underline
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=$maroon
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=$pink
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=$mauve
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=$sapphire
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=$sapphire
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=$teal
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=$green
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=$green
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=$peach
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=$peach
    ZSH_HIGHLIGHT_STYLES[assign]=fg=$teal
    EOF
  '';
    #  git_branch = {
    #    symbol = "🌱 ";
    #  };
}