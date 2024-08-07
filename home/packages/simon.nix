{
  pkgs,
  lib,
  isLinux,
  isDarwin,
  system,
  ...
}: let
  # fonts = with pkgs; [
  #   source-code-pro
  #   fira-code
  #   jetbrains-mono
  #   ibm-plex
  #   inconsolata
  # ];
  custom-curl = pkgs.curl.override {
    c-aresSupport = true;
  };

  custom-vscode = pkgs.vscode;
  # custom-vscode = pkgs.vscode-with-extensions.override {
  #   vscodeExtensions = with pkgs.vscode-extensions; [
  #     vadimcn.vscode-lldb
  #   ];
  # };
in {
  home.packages = with pkgs;
    [
      ansi
      bat
      cachix
      cert-info
      curlie
      custom-curl
      devenv
      dig
      docker-credential-helpers
      du-dust
      duckdb
      entr
      fd
      file
      hexyl
      htop
      jless
      jqp
      lsof
      mkcert
      nix-output-monitor
      nix-tree
      nodejs
      openssh
      pre-commit
      pstree
      pv
      python3
      ripgrep
      rustup
      sqlite-interactive
      talosctl
      universal-ctags
      unzip
      watch
      yq
      zip
    ]
    ++ [
      # local packages
      listprojects
      notify-wrapper
      realise-symlink
      simpleproxy
    ]
    ++ (lib.optionals isDarwin [
      reattach-to-user-namespace
      coreutils
      libiconv
    ])
    ++ (lib.optionals isLinux [
      blanket # white noise generator
      custom-vscode
      drawio
      element-desktop
      emote # emoji picker
      flameshot # screenshot utility
      freetube
      gimp
      groff
      keymapp
      libreoffice
      man-pages
      man-pages-posix
      obsidian
      playerctl
      remmina
      thunderbird
      todoist-electron
      virt-manager
      vlc
      zeal
      zed-editor
    ])
    ++ (lib.optionals (system == "x86_64-linux") [
      slack
      discord
      insomnia
      lorien
      obs-studio
      jetbrains.pycharm-community-bin
      jetbrains.idea-community-bin
      shotcut
      wally
      wally-cli
      zoom-us
    ]);
}
