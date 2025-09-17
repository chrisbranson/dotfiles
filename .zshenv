export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# history setup
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000
export PSQL_HISTORY="$ZDOTDIR/psql/.psql_history"

# Setup code editor to use in shell
export EDITOR="/usr/local/bin/code"
export VISUAL="/usr/local/bin/code"

# Java Runtime
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
