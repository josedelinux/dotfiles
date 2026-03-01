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


setopt AUTO_CD              # cd by typing directory name
# setopt CORRECT              # command correction
setopt APPEND_HISTORY	    # append instead of overwrite
setopt SHARE_HISTORY        # share history between sessions
setopt HIST_IGNORE_DUPS     # ignore duplicate commands
setopt HIST_REDUCE_BLANKS

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


export PATH="$HOME/.cargo/bin:$HOME/go/bin:$HOME/bin:$PATH"

# copy from tmux remote linux to local
cb() {
  printf "\033]52;c;%s\a" "$(base64 "$1" | tr -d '\n')"
}

# zsh way
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

