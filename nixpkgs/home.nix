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
    # pkgs.timewarrior
    pkgs.tmux
    pkgs.neovim
    pkgs.fzf
    pkgs.diff-so-fancy
    # pkgs.brave
    pkgs.awscli2
    pkgs.graphviz
    pkgs.pngquant
    pkgs.optipng
    pkgs.rustup
    pkgs.libiconv

    # Containers
    pkgs.lazydocker

    # asdf
    pkgs.gnupg
    pkgs.asdf-vm

    # Emacs
    # pkgs.emacs
    #pkgs.emacs28NativeComp
    #pkgs.emacs-all-the-icons-fonts

    pkgs.fd
    pkgs.coreutils
    pkgs.gcc
    pkgs.jetbrains-mono
    pkgs.noto-fonts
    pkgs.iosevka-bin
    pkgs.julia-mono
    pkgs.nixfmt
    pkgs.fontconfig
    pkgs.editorconfig-core-c
    pkgs.shellcheck
    pkgs.pandoc

    # Others
    # pkgs.platformio
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
      export PATH=$HOME/.emacs.d/bin:$PATH
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
          rev = "b727321f2bd3d79c1dae805441261c45888cbb41";
          sha256 = "sha256-jbrn8cIHQFmceofCVA1TjRPQL5hRdGFgxLfeIZE6Z7k=";
        };
        file = "forgit.plugin.zsh";
      }
      {
        name = "zsh-z";
        src = fetchFromGitHub {
          owner = "agkozak";
          repo = "zsh-z";
          rev = "b30bc6050e77abe30ce36761d18ed696e5410f16";
          sha256 = "sha256-TSX6KooWYGf1NDlD4A3o6CmSsyy1JL7bPeKsuCOuUhY=";
        };
        file = "zsh-z.plugin.zsh";
      }
      {
        name = "pure";
        src = fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "90dc9cf908481cc155e1ce5611f684916523fc30";
          sha256 = "sha256-nsmiP1RSG27WtwRJpTZvDi2CvUQExxdBs5my7T5TSKk=";
        };
        file = "pure.plugin.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "c7caf57ca805abd54f11f756fda6395dd4187f8a";
          sha256 = "sha256-MeuPqDeJpbJi2hT7VUgyQNSmDPY/biUncvyY78IBfzM=";
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
