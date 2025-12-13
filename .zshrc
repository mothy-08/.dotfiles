# -------------------------------
# Powerlevel10k Instant Prompt
# -------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------
# Zinit Setup
# -------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# -------------------------------
# Plugins (Load Highlighting LAST)
# -------------------------------
# Theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Core Plugins
zinit light-mode for \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions \
  Aloxaf/fzf-tab

# -------------------------------
# Completion System
# -------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons --group-directories-first $realpath'

# -------------------------------
# Aliases
# -------------------------------
alias vim='nvim'
alias ls='eza --icons --group-directories-first --git'
alias ll='eza -l --icons --group-directories-first --git'
alias la='eza -la --icons --group-directories-first --git'

# -------------------------------
# Shell Integrations & Tools
# -------------------------------
# Load these BEFORE syntax highlighting so the highlighter knows they exist
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# -------------------------------
# Keybindings
# -------------------------------
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# -------------------------------
# History
# -------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_space hist_save_no_dups hist_ignore_all_dups

# -------------------------------
# Environment & PATH
# -------------------------------
typeset -U path            # keep path entries unique
path=(
  "$HOME/.local/bin"
  $path
)
export PATH

# -------------------------------
# Syntax Highlighting (MUST BE LAST)
# -------------------------------
zinit light zsh-users/zsh-syntax-highlighting
