if status is-interactive
  abbr --add cl clear
  abbr --add vifzf 'vim (fzf)'
  abbr --add vani 'vim -u /dev/null'
  abbr --add csgen 'clang-format -style=google -dump-config > .clang-format'
  abbr --add gitfu 'git fetch; git status'
end
