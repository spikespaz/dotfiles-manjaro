# Increase history size
HISTFILE="$ZDOTDIR/.histfile"
HISTSIZE=100000
SAVEHIST=100000

# Update plugins every two days
ZNAP_PLUGINS_AUTOUPDATE_INTERVAL=$((2*24*60*60))

# Source the initializer for znap
source "$ZDOTDIR/scripts/znap_init.zsh"

# Enable znap's instant prompt rather than Powerline's
znap prompt romkatv/powerlevel10k

# Source the P10k configuration
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

# Source other plugins
znap source zdharma-continuum/fast-syntax-highlighting
znap source marlonrichert/zsh-autocomplete

# Useful shell options
setopt autocd extendedglob nomatch

# Don't notify on background processes
unsetopt notify

# Enable key for Vi mode
bindkey -v

# Set generic keybinds
bindkey '^[[3~' delete-char

