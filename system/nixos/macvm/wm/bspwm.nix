{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.me.wm.bspwm;
in {
  options.me.wm.bspwm.enable = mkEnableOption "BSPWM";

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      desktopManager = {
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      windowManager.bspwm.enable = true;
    };
  };
}
