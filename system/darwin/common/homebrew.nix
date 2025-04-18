{hostname, ...}: let
  host-specific-casks =
    {
      mba = [];
      mm = ["wacom-tablet"];
    }
    .${hostname};
in {
  homebrew = {
    enable = true;
    # remove any homewbrew packages not installed via nix-darwin
    onActivation.cleanup = "uninstall";
    casks =
      [
        "1password-cli"
        "1password"
        "alacritty"
        "amazon-chime"
        "barrier"
        "betterdisplay"
        "blender"
        "brave-browser"
        "deskpad"
        "discord"
        "docker"
        "dteoh-devdocs"
        "element"
        "emacs"
        "firefox"
        "ghostty"
        "gimp"
        "google-chrome"
        "inkscape"
        "insomnia"
        "jetbrains-toolbox"
        "karabiner-elements"
        "neovide"
        "notion"
        "obs"
        "obsidian"
        "pocket-casts"
        "raycast"
        "shotcut"
        "slack"
        "steam"
        "sublime-merge"
        "sublime-text"
        "tabby"
        "utm"
        "visual-studio-code"
        "vivaldi"
        "vlc"
        "whatsapp"
        "wireshark"
        "xquartz"
        "yt-music"
        "yubico-yubikey-manager"
        "zed"
        "zoom"
      ]
      ++ host-specific-casks;
    brews = [
      "cargo-instruments"
      "mise"
      "node"
      "pulumi/tap/pulumi"
      "stow"
    ];
    taps = [
      "pulumi/tap"
    ];
    masApps = {
      DaisyDisk = 411643860;
      Tailscale = 1475387142;
      "1Password for Safari" = 1569813296;
      Instapaper = 288545208;
      Perplexity = 6714467650;
    };
  };
}
