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


alias lg='lazygit'
alias ll='ls -alF'
alias l='ls -alF'
alias zshconfig='vim ~/.zshrc'
alias zshreload='source ~/.zshrc'


export PATH="$HOME/.cargo/bin:$HOME/go/bin:$HOME/bin:$PATH"

eval "$(zoxide init zsh)"

