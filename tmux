# remap prefix from 'C-b' to 'C-x'
unbind C-b
set-option -g prefix C-a 
bind-key C-a send-prefix

# paste
bind p paste-buffer

# split panes using | and -

# switch panes using Alt-arrow without prefix



# Enable mouse mode (tmux 2.1 and above)
set -g mouse on

# don't rename windows automatically
set-option -g allow-rename off

######################
### DESIGN CHANGES ###
######################

## Status bar design

set -g status-justify left
set -g status-bg default
set -g status-fg colour12
set -g status-interval 2


# window status
setw -g window-status-format " #F#I:#W#F "
setw -g window-status-current-format " #F#I:#W#F "
setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "


# Info on left (I don't have a session display for now)
set -g status-left ''


# The modes {
setw -g clock-mode-colour colour135
# }

# The statusbar {

#set -g status-position bottom
set -g status-bg colour234
set -g status-fg colour137

# set -g status-attr dim
set -g status-left ''
set -g status-right '#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S '
set -g status-right-length 50
set -g status-left-length 20

setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
# }

# manpage highlight {
set -g default-terminal "xterm"
# }



bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R


bind -r C-h select-window -t :-
bind -r C-l select-window -t :+


bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

unbind [
bind Escape copy-mode
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on

set -g status-left-length 40
set -g status-left "#[fg=green]Session: #S #[fg=yellow]#I #[fg=cyan]#P"
set -g status-right "#[fg=cyan]%d %b %R #H"
set -g status-interval 60
set -g status-justify centre
