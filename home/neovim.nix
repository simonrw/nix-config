{ config, pkgs, ... }:
{
  config = {
    home.packages = [
      pkgs.neovim
    ];

    xdg.configFile.".nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "./neovim";
      recursive = true;
    };
  };
}
