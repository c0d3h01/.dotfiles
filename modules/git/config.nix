{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "c0d3h01";
    userEmail = "your-email@example.com"; # Change this to your email
    
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false; # Merge strategy
      color.ui = true;
      
      # Helpful aliases
      alias = {
        st = "status";
        co = "checkout";
        ci = "commit";
        br = "branch";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        visual = "!gitk";
        graph = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      };
    };
    
    # Delta is a syntax-highlighting pager for git
    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
        line-numbers = true;
      };
    };
    
    # Enable git-ignore
    ignores = [
      ".DS_Store"
      "*.swp"
      "*~"
      "*.log"
      ".direnv/"
      "result"
      "result-*"
    ];
  };
}
