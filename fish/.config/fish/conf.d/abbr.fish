if status is-interactive
  abbr --add unset 'set --erase'
  abbr --add cl clear
  abbr --add vifzf 'vim (fzf)'
  abbr --add vani 'vim -u /dev/null'
  abbr --add vini 'vim -u /dev/null'
  abbr --add csgen 'clang-format -style=google -dump-config > .clang-format'
  abbr --add gitfu 'git fetch; git status'

  # i type fast
  abbr --add tmx 'tmux'
  abbr --add lg 'lazygit'

	# makefile abbr
	abbr --add mb 'make -B'
	abbr --add mc 'make clean'

  # docker
  abbr --add docker-revive 'docker start -a -i (docker ps -q -l)'

end
