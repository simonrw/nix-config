{ lib, config, ...}: 
with lib;
let
  cfg = config.me.nixvim.trouble;

  keymap = {
    key,
    action,
    mode ? "n",
    lua ? false,
  }: {
    inherit action mode key lua;
    options = {
      noremap = true;
      silent = true;
    };
  };
in {
  options.me.nixvim.trouble.enable = mkEnableOption "trouble";

  config = mkIf cfg.enable {
    plugins.trouble = {
      enable = false;
      settings = {
        icons = false;
        use_diagnostic_signs = false;
        auto_preview = false;
      };
    };
    keymaps = [
      (keymap {
        key = "yot";
        action = "function() require('trouble').toggle() end";
        lua = true;
      })
    ];
  };
}
