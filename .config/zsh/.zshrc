# Increase history size
HISTFILE="$ZDOTDIR/.histfile"
HISTSIZE=100000
SAVEHIST=100000

# Update plugins every two days
ZNAP_PLUGINS_AUTOUPDATE_INTERVAL=$((2*24*60*60))

# Source the initializer for snap
source "$ZDOTDIR/scripts/znap_init.zsh"

znap prompt romkatv/powerlevel10k
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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

