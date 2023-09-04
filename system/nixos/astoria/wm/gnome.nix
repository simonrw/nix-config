{ pkgs, config, lib, ... }:
let
  cfg = config.me.wm.gnome;
in
{
  options.me.wm.gnome = {
    enable = lib.mkEnableOption (lib.mkDoc "Enable Gnome window manager");
    wayland = lib.mkEnableOption (lib.mkDoc "Enable Wayland support");
  };

  config = lib.mkIf cfg.enable {
    services.xserver.displayManager.defaultSession = if cfg.wayland then "gnome" else "gnome-xorg";
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.gdm.wayland = cfg.wayland;
    services.udev.packages = with pkgs;
      [
        gnome.gnome-settings-daemon
      ];

    environment.systemPackages = with pkgs; [
      gnome.adwaita-icon-theme
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.advanced-alttab-window-switcher
      orchis-theme
    ];

    programs.xwayland.enable = cfg.wayland;

    services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
      [org.gnome.desktop.wm.preferences]
      resize-with-right-button=true
      mouse-button-modifier='<Alt>'
    '';
  };
}