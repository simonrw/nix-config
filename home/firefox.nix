{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    # don't install firefox
    package = null;
    profiles = {
      simon = {
        name = "simon";
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          enhancer-for-youtube
          facebook-container
          omnivore
          pkgs.nur.repos.rycee.firefox-addons."1password-x-password-manager"
          react-devtools
          ublock-origin
          vimium
        ];
        extraConfig = builtins.readFile ./firefox-preferences.js;
        isDefault = true;
      };
    };
  };
}
