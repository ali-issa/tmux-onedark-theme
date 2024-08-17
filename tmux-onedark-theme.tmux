#!/bin/bash
onedark_black="#353742"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_green="#98c379"
onedark_visual_grey="#3e4452"
onedark_comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$onedark_white"
set "message-bg" "default"

set "message-command-fg" "$onedark_white"
set "message-command-bg" "default"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "default"
setw "window-status-bg" "default"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "default"
setw "window-status-activity-fg" "default"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$onedark_comment_grey"
set "window-active-style" "fg=$onedark_white"

set "pane-border-fg" "$onedark_white"
set "pane-border-bg" "default"
set "pane-active-border-fg" "$onedark_green"
set "pane-active-border-bg" "default"

set "display-panes-active-colour" "$onedark_yellow"
set "display-panes-colour" "$onedark_blue"

set "status-bg" "default"
set "status-fg" "$onedark_white"

set "@prefix_highlight_fg" "default"
set "@prefix_highlight_bg" "$onedark_green"
set "@prefix_highlight_copy_mode_attr" "fg=default,bg=$onedark_green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@onedark_widgets")
time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$onedark_white,bg=$onedark_visual_grey,nounderscore,noitalics] ${time_format} ${date_format} #[fg=$onedark_black,bg=$onedark_green,bold] #h #[fg=$onedark_yellow, bg=$onedark_green]#[fg=$onedark_red,bg=$onedark_yellow]"
set "status-left" "#[fg=$onedark_black,bg=$onedark_green,bold] #S #{prefix_highlight}#[fg=$onedark_green,bg=$onedark_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=default,bg=default,nobold,nounderscore,noitalics]#[fg=$onedark_white,bg=default] #I  #W #[fg=default,bg=default,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=default,bg=$onedark_visual_grey,nobold,nounderscore,noitalics]#[fg=$onedark_white,bg=$onedark_visual_grey,nobold] #I  #W #[fg=$onedark_visual_grey,bg=default,nobold,nounderscore,noitalics]"
