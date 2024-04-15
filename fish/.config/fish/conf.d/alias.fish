# Set up alias

alias cxx c++

# https://github.com/sharkdp/bat
# On Ubuntu/debian
if command -v batcat >/dev/null
	alias bat='batcat'
end

# https://github.com/sharkdp/fd
# On Ubuntu/debian
if command -v fdfind >/dev/null
	alias fd='fdfind'
end

# https://github.com/lsd-rs/lsd
if command -v lsd >/dev/null
	alias ls='lsd'
end

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# https://github.com/oberblastmeister/trashy
if command -v trash >/dev/null
	alias rm='trash put'
else
	alias rm='rm -i'
end

alias tmux-reset='reset-tmux'
