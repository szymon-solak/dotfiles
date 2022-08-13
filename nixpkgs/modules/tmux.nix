{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;

    extraConfig = ''
      # refs
      # https://github.com/TWB0109/PDots/blob/main/tmux/.tmux.conf

      unbind C-b
      set-option -g prefix `
      bind ` send-prefix

      set -g status-style 'bg=colour244'
      set -g status-left ""

      # 30 + 2 spaces
      set -g status-right '#[fg=black bg=blue] #(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD | cut -c -30) '
      # 30 + 2 spaces
      set -ga status-right '#[fg=black bg=colour11] %d-%b-%Y %H:%M (week %V/#(ncal -m december -w | tail -2 | cut -d " " -f 1 | tr -d "[:space:]")) '
      set -g status-right-length 64
      set -g window-status-separator ""

      setw -g window-status-current-style  'fg=black bg=colour11 bold'
      setw -g window-status-current-format ' #[fg=black]#I: #W '

      setw -g window-status-style  'fg=colour237 bg=colour244 '
      setw -g window-status-format ' #[fg=colour237]#I: #W '

      set -g pane-border-style 'fg=colour8 bg=colour0'
      set -g pane-active-border-style 'fg=colour2 bg=colour0'

      set -g status-justify left
      set -g status-position bottom

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      unbind %
      bind | split-window -h
      unbind '"'
      bind - split-window -v
      bind _ split-window -v

      set -g default-terminal "xterm-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      bind-key c new-window

      set-option -g mouse on
    '';
  };
}
