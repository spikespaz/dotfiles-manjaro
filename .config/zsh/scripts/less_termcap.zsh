# https://unix.stackexchange.com/a/147/286824
# https://unix.stackexchange.com/a/108840/286824
# https://linuxcommand.org/lc3_adv_tput.php#text-effects

# 0: Black, 1: Red, 2: Green, 3: Orange, 4: Blue, 5: Purple, 6: Teal, 7: White
# 8-15: Darker, see the output of the following command for all 256 colors:

__view_all_256_colors() (
  color() {
    for c; do
        printf '\e[48;5;%dm %03d ' $c $c
    done
  }

  white='\e[38;5;15m'
  black='\e[38;5;16m'

  printf "$white$(color {232..243})"
  printf "$black$(color {244..255})"
  printf '\n'
  
  printf "$white$(color {0..6})"
  printf "$black$(color {7..7})"
  printf '\n'
  printf "$white$(color {8..14})"
  printf "$black$(color {15..15})"
  printf '\n'
  
  printf "$white$(color {16..33})"
  printf "$black$(color {34..51})"
  printf '\n'
  printf "$white$(color {52..69})"
  printf "$black$(color {70..87})"
  printf '\n'
  printf "$white$(color {88..105})"
  printf "$black$(color {106..123})"
  printf '\n'
  printf "$white$(color {124..141})"
  printf "$black$(color {142..159})"
  printf '\n'
  printf "$white$(color {160..177})"
  printf "$black$(color {178..195})"
  printf '\n'
  printf "$white$(color {196..213})"
  printf "$black$(color {214..231})"
  printf '\n'
)

# https://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html#SEC5

# Turn off all attributes
reset=$(tput sgr0)
# Visible bell
bell=$(tput flash)
# Begin blinking mode
blink=$(tput blink)
# Begin double intensity mode
bold=$(tput bold)
standout=$(tput smso)
rm_standout=$(tput rmso)
italic=$(tput sitm)
underline=$(tput smul)
rm_underline$(tput rmul)
reverse_video=$(tput rev)
# Begin half-intensity mode
rm_bold=$(tput dim)
$(tput ssubm)
$(tput rsubm)
$(tput ssupm)
$(tput rsupm)

alias fg='tput setaf'
alias bg='tput setab'

setopt aliases

# start blink
export LESS_TERMCAP_mb="$blink"
# start bold
export LESS_TERMCAP_md="$bold"
# turn off bold, blink and underline
export LESS_TERMCAP_me="$reset"
# start standout
export LESS_TERMCAP_so="$standout"
# stop standout
export LESS_TERMCAP_se="$rm_standout"
# start underline
export LESS_TERMCAP_us="$underline"
# stop underline
export LESS_TERMCAP_ue="$rm_underline"
# does nobody know the rest?
export LESS_TERMCAP_mr="$reset"
export LESS_TERMCAP_mh="$reset"
export LESS_TERMCAP_ZN="$reset"
export LESS_TERMCAP_ZV="$reset"
export LESS_TERMCAP_ZO="$reset"
export LESS_TERMCAP_ZW="$reset"
# fizes issue on konsole and gnome-terminal with 
export GROFF_NO_SGR=1

# display the last line and percentage in the document
export MANPAGER='less +Gg'

unsetopt aliases

