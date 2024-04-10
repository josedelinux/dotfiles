
# Set up alias
alias cxx c++


# https://github.com/sharkdp/bat
# Ubuntu/debian
if command -v batcat >/dev/null
	alias bat='batcat'
end

# https://github.com/lsd-rs/lsd
if command -v lsd >/dev/null
	alias ls='lsd'
end

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias rm='rm -i'
