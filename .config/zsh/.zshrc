# Increase history size
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# Custom auto-update portion
PLUGINS_DIRECTORY="$HOME/.config/zsh/plugins"
PLUGINS_LASTUPDATE_FILE="$PLUGINS_DIRECTORY/.lastupdate"
PLUGINS_AUTOUPDATE_INTERVAL=$((2*24*60*60)) # every two days

# Source the initializer for snap
source "$ZDOTFILES/scripts/znap_init"

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

