export PATH=$HOME/bin:/usr/local/bin:$HOME/code/tools/bin:$HOME/code/struqtur-legacy/bin:$PATH

ZSH=/usr/share/oh-my-zsh/

DISABLE_AUTO_UPDATE="true"

DISABLE_AUTO_TILES="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git colorize colored-man-pages last-working-dir vi-mode )

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Colors
(cat ~/.cache/wal/sequences &)

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/factor/.zshrc'

# sourcing plugins installed with pacman or written myself

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /etc/profile.d/autojump.zsh
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ -s /etc/grc.zsh ]] && source /etc/grc.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

# source oh-my-zsh late, fixes some issues with plugins
source $ZSH/oh-my-zsh.sh


# Keybindings for history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v

# Custom prompt

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="±"
ZSH_THEME_GIT_PROMPT_BEHIND="⇣"
ZSH_THEME_GIT_PROMPT_AHEAD="⇡"


git_status() {
  echo -n "%F{242}$(git_prompt_info)$(git_prompt_status)%f"
}

dir_status() {
  echo -n "%F{green}"
}

PROMPT="%(?.%F{white}.%F{red})%f "
RPROMPT='%n@%M:%F{green}%~%f $(git_status)'

# Cursor styling
# The cursor matches the behavior of vim

MODE_CURSOR_VIINS="blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS "
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL"


# Environment Variables

export PATH=~/.bin:$PATH
export PATH=~/.cargo/bin:$PATH
export EDITOR=nvim
export CLASSPATH="/usr/share/java/*:"

# export GOPATH=$HOME/code/go
# export PATH=$PATH:$(go env GOPATH)/bin

# Aliases

# alias ls='ls --color=auto'
alias ls='exa --group-directories-first '
alias ll='exa --group-directories-first -l --git'
alias la='exa --group-directories-first -la --git'
alias lt='exa -T'

alias pika='pikaur'
alias cat='bat'

alias vim='nvim'
alias svim='sudoedit'
alias v='nvim'
alias sv='sudoedit'

alias gcal='gcalcli --calendar juliusschumacher@gmail.com'
alias weather='curl wttr.in/gothenburg'

alias ghci='stack ghci'
alias haskell='stack runghc'
alias py='python'

export XDG_CONFIG_HOME="$HOME/.config"

# Load Angular CLI autocompletion.
source <(ng completion script)

source ~/.tokens
