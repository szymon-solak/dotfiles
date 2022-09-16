{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "szymonsolak";
  home.homeDirectory = "/Users/szymonsolak";

  home.packages = [
    # General
    pkgs.niv
    pkgs.git
    pkgs.alacritty
    pkgs.lsd
    pkgs.bat
    pkgs.ripgrep
    pkgs.tmux
    pkgs.neovim
    pkgs.fzf
    pkgs.diff-so-fancy
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
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./modules/tmux.nix
    ./modules/zsh.nix
    ./modules/fzf.nix
  ];
}
