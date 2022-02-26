# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source the P10k configuration
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

# Increase history size
HISTFILE="$ZDOTDIR/.histfile"
HISTSIZE=100000
SAVEHIST=100000

# Update plugins every two days
ZNAP_PLUGINS_AUTOUPDATE_INTERVAL=$((2*24*60*60))

# Source the initializer for znap
source "$ZDOTDIR/scripts/znap_init.zsh"

# Source other plugins
znap source 'romkatv/powerlevel10k'
znap source 'zdharma-continuum/fast-syntax-highlighting'
znap source 'marlonrichert/zsh-autocomplete'
znap source 'hlissner/zsh-autopair'
znap source 'jeffreytse/zsh-vi-mode'

# Set options for long-runnig task completion notifications
AUTO_NOTIFY_THRESHOLD=300
AUTO_NOTIFY_TITLE='Command "%command" has completed!'
AUTO_NOTIFY_BODY='With exit code %exit_code after %elapsed seconds.'
AUTO_NOTIFY_EXPIRE_TIME=15000

znap source 'MichaelAquilina/zsh-auto-notify'

# Set options for automatic terminal title
ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
ZSH_TAB_TITLE_CONCAT_FOLDER_PROCESS=true
ZSH_TAB_TITLE_ADDITIONAL_TERMS='alacritty'

znap source trystan2k/zsh-tab-title

# Useful shell options
setopt autocd extendedglob nomatch

# Prevent zsh from hanging up on running processes
setopt NO_HUP

# Don't notify on background processes
unsetopt notify

# Enable key for vi mode
bindkey -v

# Set generic keybinds
bindkey '^[[3~' delete-char

# Add an alias for starting nvim with the user's environment when running as root
alias sunvim='sudo -E nvim'

# Custom aliases for ls command
if command -v lsd &> /dev/null; then
    alias ls='lsd'
    alias ll='lsd -l'
  alias la='lsd -la'
fi

# Custom aliases for cp command
if command -v xcp &> /dev/null; then
    alias cp='xcp'
    #source "$ZDOTDIR/scripts/xcpmv.zsh"
fi
