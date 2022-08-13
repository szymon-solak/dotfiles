{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
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
    pkgs.pandoc

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

  # Package settings
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    autocd = true;

    shellAliases = {
      ip  = "ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\\  -f2";

      # Git
      gst = "git status";
      gc = "git commit -v";
    };

    initExtra = ''
      export PATH=$HOME/bin:/usr/local/bin:$PATH
      export PATH=$HOME/.local/bin:$PATH
      export PATH=$HOME/.asdf/shims:$PATH
    '';

      # export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
      # source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

    plugins = with pkgs; [
      {
        name = "forgit";
        src = fetchFromGitHub {
          owner = "wfxr";
          repo = "forgit";
          rev = "f6040b21a0db895d0e0ec110fecdc72274a20417";
          sha256 = "sha256-zyDp8tswi+6WuHgJkSIz1OE6s314qycK1975vk8FbMM=";
        };
        file = "forgit.plugin.zsh";
      }
      {
        name = "zsh-z";
        src = fetchFromGitHub {
          owner = "agkozak";
          repo = "zsh-z";
          rev = "aaafebcd97424c570ee247e2aeb3da30444299cd";
          sha256 = "sha256-9Wr4uZLk2CvINJilg4o72x0NEAl043lP30D3YnHk+ZA=";
        };
        file = "zsh-z.plugin.zsh";
      }
      {
        name = "pure";
        src = fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "2d89ef1d06f76997790b45df5ac447f0c3ffd34c";
          sha256 = "sha256-KO1z5/9vRh4JNNawbUhy9Zgr3ywGfpSEMx/4N0V+vmw=";
        };
        file = "pure.plugin.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "caa749d030d22168445c4cb97befd406d2828db0";
          sha256 = "sha256-YV9lpJ0X2vN9uIdroDWEize+cp9HoKegS3sZiSpNk50=";
        };
        file = "zsh-syntax-highlighting.plugin.zsh";
      }
    ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
