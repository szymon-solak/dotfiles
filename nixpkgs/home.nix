{ config, pkgs, ... }:

{
  home.username = "szymonsolak";
  home.homeDirectory = "/Users/szymonsolak";

  home.packages = [
    # General
    pkgs.git
    pkgs.alacritty
    pkgs.lsd
    pkgs.bat
    pkgs.ripgrep
    pkgs.tmux
    pkgs.neovim
    pkgs.fzf
    # pkgs.diff-so-fancy
		pkgs.difftastic
    pkgs.awscli2
    pkgs.rustup
    pkgs.python3
    pkgs.fd
    pkgs.coreutils
    pkgs.gcc
    pkgs.nixfmt
    pkgs.fontconfig
    pkgs.editorconfig-core-c
    pkgs.shellcheck
    pkgs.ffmpeg
    # pkgs.pandoc
		pkgs.obsidian

    # Fonts
    pkgs.nerdfonts

    # Image utils
    pkgs.graphviz
    pkgs.pngquant
    pkgs.optipng
    pkgs.libiconv
    pkgs.imagemagick

    # Containers
    pkgs.lazydocker

    # asdf
    pkgs.gnupg
    pkgs.asdf-vm
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

	disabledModules = [ "targets/darwin/linkapps.nix" ];

  imports = [
    ./modules/tmux.nix
    ./modules/zsh.nix
    ./modules/fzf.nix
		./modules/darwin-application-activation.nix
  ];
}
