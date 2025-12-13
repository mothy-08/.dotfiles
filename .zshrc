# -------------------------------
# 0. XDG & Environment (MUST BE FIRST)
# -------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Zsh specific XDG paths
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
# HISTORY CONFIG MUST BE HERE (Before plugins load)
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory hist_ignore_space hist_save_no_dups hist_ignore_all_dups

# Path setup
typeset -U path
path=("$HOME/.local/bin" $path)
export PATH

# -------------------------------
# 1. Powerlevel10k Instant Prompt
# -------------------------------
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------
# 2. Zinit (Plugin Manager)
# -------------------------------
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")" && \
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# -------------------------------
# 3. Completion System
# -------------------------------
autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons --group-directories-first $realpath'

# -------------------------------
# 4. Plugins
# -------------------------------
# Theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Core
zinit light-mode for \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions \
  Aloxaf/fzf-tab

# -------------------------------
# 5. Configs & Tools
# -------------------------------
# Powerlevel10k Config
[[ -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"

# Tools
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# -------------------------------
# 6. Aliases & Binds
# -------------------------------
alias vim='nvim'
alias ls='eza --icons --group-directories-first --git'
alias ll='eza -l --icons --group-directories-first --git'
alias la='eza -la --icons --group-directories-first --git'

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# -------------------------------
# 7. Syntax Highlighting (MUST BE LAST)
# -------------------------------
zinit light zsh-users/zsh-syntax-highlighting
