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
znap source 'zdharma-continuum/fast-syntax-highlighting'
znap source 'marlonrichert/zsh-autocomplete'
znap source 'hlissner/zsh-autopair'
znap source 'jeffreytse/zsh-vi-mode'

# Set options for long-runnig task completion notifications
AUTO_NOTIFY_THRESHOLD=120
AUTO_NOTIFY_TITLE='Command "%command" has completed!'
AUTO_NOTIFY_BODY='With exit code %exit_code after %elapsed seconds.'
AUTO_NOTIFY_EXPIRE_TIME=15000

znap source MichaelAquilina/zsh-auto-notify


# Set options for automatic terminal title
ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
ZSH_TAB_TITLE_CONCAT_FOLDER_PROCESS=true
ZSH_TAB_TITLE_ADDITIONAL_TERMS='alacritty'

znap source trystan2k/zsh-tab-title

# Useful shell options
setopt autocd extendedglob nomatch

# Don't notify on background processes
unsetopt notify

# Enable key for Vi mode
bindkey -v

# Set generic keybinds
bindkey '^[[3~' delete-char

# Custom aliases for ls command
if command -v lsd &> /dev/null; then
    alias ls='lsd'
    alias ll='lsd -l'
    alias lh='lsd -la'
fi

