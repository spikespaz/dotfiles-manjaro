# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source the P10k configuration
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

# Increase history size
HISTFILE="$ZDOTDIR/.history"
HISTSIZE=10000000
SAVEHIST=10000000

# Allow multiple sessions to append to the history rather than overwriting it
setopt APPEND_HISTORY
# Save timestamps to history
setopt EXTENDED_HISTORY
# Drop older duplicates in history when trimming (when HISTSIZE is larger than SAVEHIST)
setopt HIST_EXPIRE_DUPS_FIRST
# Remove older duplicates from history
setopt HIST_IGNORE_ALL_DUPS
# Successive duplicate entries will collapse to the first one rather than rewriting
setopt HIST_IGNORE_DUPS
# Commands can be ignored by history when prefixed with a space
setopt HIST_IGNORE_SPACE
# Trim trailing whitespace (and prefix without HIST_IGNORE_SPACE)
setopt HIST_REDUCE_BLANKS
# When rewriting/trimming history, remove the oldest duplicates
setopt HIST_SAVE_NO_DUPS
# Incremental history, rather than waiting for the shell to exit. Useful for crashes.
setopt INC_APPEND_HISTORY
# Allow comments in interactive mode
setopt INTERACTIVE_COMMENTS
# Disable the annoying BIOS bell.
# Note that my terminal emulator simply flashes the screen so this is disabled.
#unsetopt HIST_BEEP

# Update plugins every two days
ZNAP_PLUGINS_AUTOUPDATE_INTERVAL=$((2*24*60*60))

# Source the initializer for znap
source "$ZDOTDIR/scripts/znap_init.zsh"
#source "$ZDOTDIR/scripts/less_termcap.sh"

# Source other plugins
znap source 'romkatv/powerlevel10k'
znap source 'jeffreytse/zsh-vi-mode'
znap source 'hlissner/zsh-autopair'

# Set options for autocomplete
zstyle ':autocomplete:*' min-delay 0.5
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' fzf-completion yes

znap source 'marlonrichert/zsh-autocomplete'

# Add some built-in completions
zstyle ':completion:*:paths' path-completion yes

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

znap source 'trystan2k/zsh-tab-title'

# Source this last
#znap source 'zdharma-continuum/fast-syntax-highlighting'
#znap source 'z-shell/fast-syntax-highlighting'
znap source 'zsh-users/zsh-syntax-highlighting'

# If a command is invalid, assume it is a path and change to it
setopt AUTO_CD
# Necessary for advanced globbing
setopt EXTENDED_GLOB
# Print an error when path expansion fails
setopt NOMATCH
# Prevent zsh from hanging up on running processes
# Why is this needed, is something broken?
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

# Enable alias for thefuck
if command -v thefuck &> /dev/null; then
  eval "$(thefuck --alias)"
fi

# Source the asdf version manager
[ -f '/opt/asdf-vm/asdf.sh' ] &&
  source '/opt/asdf-vm/asdf.sh'

# This is for Rust 1.59. Incremental compilation was disabled because of a bug and will be fixed in the next version.
export RUSTC_FORCE_INCREMENTAL=1

# For binaries from 'cargo install'
[ -d "$HOME/.cargo/bin" ]
  export PATH="$PATH:$HOME/.cargo/bin"

