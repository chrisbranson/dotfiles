# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit "$ZDOTDIR/p10k.zsh".
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

# Setup GPG
export GPG_TTY=$(tty)

eval "$(direnv hook zsh)"

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# Completion
_comp_options+=(globdots) # With hidden files
source "$ZDOTDIR/completion.zsh"

# completion using arrow keys (based on history)
# bindkey '^[[A' history-search-backward
# bindkey '^[[B' history-search-forward
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# setup zsh plugins

# https://github.com/zsh-users/zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/zsh-users/zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/zsh-users/zsh-history-substring-search
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#bindkey -M menuselect '^o' accept-and-infer-next-history
#zstyle ':completion:*:*:*:*:*' menu select

# ---- Node -----
# source /usr/share/nvm/init-nvm.sh

# ---- Eza (better ls) -----
alias ls="EXA_COLORS=\"ur=33:uw=31:ux:32:lc=31:sn=32:uu=33:gu=33:di=34:ex=32:bd=33:pi=33:cd=33\" eza --icons=always --long --header --git"
alias l="ls -l"

# ---- Courtsdesk aliases ----
alias p2t='pdftotext -layout -enc UTF-8'

# pnpm
export PNPM_HOME="/Users/chrisbranson/.config/local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
