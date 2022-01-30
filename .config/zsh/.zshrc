# Increase history size
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# Custom auto-update portion
PLUGINS_DIRECTORY="$HOME/.config/zsh/plugins"
PLUGINS_LASTUPDATE_FILE="$PLUGINS_DIRECTORY/.lastupdate"
PLUGINS_AUTOUPDATE_INTERVAL=$((2*24*60*60)) # every two days

[[ ! -d "$PLUGINS_DIRECTORY" ]] &&
  mkdir -p "$PLUGINS_DIRECTORY"

znap_init() {
  local znap="$PLUGINS_DIRECTORY/zsh-snap/znap.zsh"

  [[ ! -f "$znap" ]] &&
    git clone 'https://github.com/marlonrichert/zsh-snap' "$(dirname "$znap")" 

  source "$znap"

  [[ ! -f "$PLUGINS_LASTUPDATE_FILE" ]] &&
    echo 0 > "$PLUGINS_LASTUPDATE_FILE"

  local lastupdate="$(cat "$PLUGINS_LASTUPDATE_FILE")"
  local timenow="$(date '+%s')"
  local timetarget=$(($lastupdate + $PLUGINS_AUTOUPDATE_INTERVAL))

  if [[ "$timenow" -ge "$timetarget" ]]; then
    znap pull
    echo "$timenow" > "$PLUGINS_LASTUPDATE_FILE"
  fi
}

znap_setup() {
  znap source zdharma-continuum/fast-syntax-highlighting
  znap source marlonrichert/zsh-autocomplete
}

# Now init znap and plugins
znap_init && znap_setup

# Useful shell options
setopt autocd extendedglob nomatch

# Don't notify on background processes
unsetopt notify

# Enable key for Vi mode
bindkey -v

# Set generic keybinds
bindkey '^[[3~' delete-char

