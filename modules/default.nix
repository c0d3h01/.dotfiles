{ config, inputs, lib, modulesPath, options, specialArgs }: {
  imports = [
  ./git/config.nix
  ./kitty/kitty.nix
  ./shell/zsh.nix
  ./editor/neovim.nix
  ./firefox/firefox.nix
  ./notion-app-enhanced/notion-infinite-load-fix.patch
  ];
}
