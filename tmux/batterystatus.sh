# little helper to display battery status in tmux status bar in osx
pmset -g batt | grep -o "[0-9]*\%"
