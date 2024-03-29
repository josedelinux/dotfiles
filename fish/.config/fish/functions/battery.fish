function battery -d "Show battery status"
  upower -i (upower -e | grep 'BAT') | grep -E 'state|percentage' | tr -s ' '
end
