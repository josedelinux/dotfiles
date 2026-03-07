# Simple prompt
PROMPT='%n@%m %1~ %# '

# Colorful prompt
PROMPT='%F{green}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


# autocomplete
autoload -Uz compinit
compinit
#allow tab completion in the middle of a word 
setopt COMPLETE_IN_WORD

## keep background processes at full speed 
#setopt NOBGNICE

# On exit, have zsh send SIGHUP to all running jobs
setopt HUP

setopt AUTO_CD              # cd by typing directory name
# setopt CORRECT              # command correction
setopt APPEND_HISTORY	    # append instead of overwrite
setopt INC_APPEND_HISTORY   # Append each command to the history file immediately
setopt SHARE_HISTORY        # share history between sessions
setopt HIST_IGNORE_DUPS     # ignore duplicate commands
setopt HIST_REDUCE_BLANKS

#setopt NO_BEEP

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
# setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index


alias lg='lazygit'

alias ll='ls -alF'
alias l='ls -alF'
alias zshconfig='vim ~/.zshrc'
alias zshreload='source ~/.zshrc'


if (( $+commands[lsd] )); then
  alias ls='lsd -l'
  alias la='lsd -a'
  alias lla='lsd -la'
  alias lt='lsd --tree'
fi

export PATH="$HOME/.cargo/bin:$HOME/go/bin:$HOME/bin:$PATH"

# copy from tmux remote linux to local
cb() {
  printf "\033]52;c;%s\a" "$(base64 "$1" | tr -d '\n')"
}

# zsh way
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

autoload -U colors
colors
# echo "${fg[yellow]}Hello Color${reset_color}"

# fnm
FNM_PATH="/home/$USER/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
