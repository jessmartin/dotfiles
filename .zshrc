export AWS_PROFILE="default"
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/jessmartin/.utils:$PATH"
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:$PATH"
export PATH="/Users/jessmartin/.claude/local:$PATH"
. $(brew --prefix asdf)/libexec/asdf.sh

# Set up history
export HISTSIZE=50000
export SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt prompt_subst

# Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Git prompt
export AGKOZAK_CUSTOM_SYMBOLS=( '↕' '📥' '📤' '🆕' '␡' '✨' '♻️' '👻' '📦')
source ~/.zsh/agkozak-zsh-prompt.plugin.zsh

source ~/.aliases
source ~/.claude-profiles

# Add Claude Code profile icon to prompt
PROMPT='$(cc_profile_icon) '$PROMPT

# --WCGW_ENVIRONMENT_START--
if [ -n "$IN_WCGW_ENVIRONMENT" ]; then
 PROMPT_COMMAND='printf "◉ $(pwd)──➤ \r\e[2K"'
 prmptcmdwcgw() { eval "$PROMPT_COMMAND" }
 add-zsh-hook -d precmd prmptcmdwcgw
 precmd_functions+=prmptcmdwcgw
fi
# --WCGW_ENVIRONMENT_END--

export PATH="$HOME/.local/bin:$PATH"
