[[ -z "$ZNAP_PLUGINS_DIRECTORY" ]] &&
  ZNAP_PLUGINS_DIRECTORY="${XDG_CONFIG_HOME:-"$HOME/.config"}/zsh/plugins"

[[ ! -d "$ZNAP_PLUGINS_DIRECTORY" ]] &&
  mkdir -p "$ZNAP_PLUGINS_DIRECTORY"

[[ -z "$ZNAP_PLUGINS_LASTUPDATE_FILE" ]] &&
  ZNAP_PLUGINS_LASTUPDATE_FILE="$ZNAP_PLUGINS_DIRECTORY/.lastupdate"

[[ ! -f "$ZNAP_PLUGINS_LASTUPDATE_FILE" ]] &&
  echo 0 > "$ZNAP_PLUGINS_LASTUPDATE_FILE"

[[ -z "$ZNAP_PLUGINS_AUTOUPDATE_INTERVAL" ]] &&
  ZNAP_PLUGINS_AUTOUPDATE_INTERVAL=$((7*24*60*60)) # every seven days

local znap="$ZNAP_PLUGINS_DIRECTORY/zsh-snap/znap.zsh"

[[ ! -f "$znap" ]] &&
  git clone 'https://github.com/marlonrichert/zsh-snap' "$(dirname "$znap")" 

source "$znap"

local lastupdate="$(cat "$ZNAP_PLUGINS_LASTUPDATE_FILE")"
local timenow="$(date '+%s')"
local timetarget=$((lastupdate + ZNAP_PLUGINS_AUTOUPDATE_INTERVAL))

if [[ "$timenow" -ge "$timetarget" ]]; then
  znap pull
  echo "$timenow" > "$ZNAP_PLUGINS_LASTUPDATE_FILE"
fi

