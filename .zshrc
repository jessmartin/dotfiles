export AWS_PROFILE="default"
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.utils:$PATH"
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:$PATH"
export PATH="$HOME/.claude/local:$PATH"
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

# Aliases and Claude Code profiles
source ~/.aliases
source ~/.claude-profiles

# Starship prompt (config at ~/.config/starship.toml)
eval "$(starship init zsh)"

autoload -Uz add-zsh-hook

# Async PR number cache using zsh-async
source /opt/homebrew/opt/zsh-async/share/zsh/site-functions/async
async_init
async_start_worker pr_cache_worker -n

_update_pr_cache() {
  local git_dir=$(git rev-parse --git-dir 2>/dev/null)
  [[ -z "$git_dir" ]] && return
  [[ "$git_dir" != /* ]] && git_dir="$PWD/$git_dir"

  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null | tr '/' '-')
  [[ -z "$branch" ]] && return

  local cache_file="$git_dir/PR_NUMBER_$branch"

  # Use async to run a shell command that fetches and writes
  async_job pr_cache_worker zsh -c "
    pr=\$(gh pr view --json number -q .number 2>/dev/null)
    if [[ -n \"\$pr\" ]]; then
      echo \"\$pr\" > '$cache_file'
    else
      rm -f '$cache_file'
    fi
  "
}
add-zsh-hook precmd _update_pr_cache

export PATH="$HOME/.local/bin:$PATH"
