# ---------------------- # set some pretty colors
# ----------------------
# set pane colors - hilight the active pane
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# colorize messages in the command line
set-option -g message-bg black #base02
set-option -g message-fg brightred #orange

# ----------------------
# Status Bar
# -----------------------
set-option -g status on                # turn the status bar on
set -g status-utf8 on                  # set utf-8 for the status bar
set -g status-interval 5               # set update frequencey (default 15 seconds)
set -g status-justify centre           # center window list for clarity
# set-option -g status-position top    # position the status bar at top of screen

# visual notification of activity in other windows
  setw -g monitor-activity on
  set -g visual-activity on

# set color for status bar
  set-option -g status-bg colour235 #base02
  set-option -g status-fg yellow #yellow
  set-option -g status-attr dim

# set window list colors - red for active and cyan for inactive
  set-window-option -g window-status-fg brightblue #base0
#  set-window-option -g window-status-bg colour236
  set-window-option -g window-status-attr dim

  set-window-option -g window-status-current-fg yellow #orange
#  set-window-option -g window-status-current-bg colour236
  set-window-option -g window-status-current-attr bright
