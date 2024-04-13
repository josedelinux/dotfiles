set resurrect_save ~/.local/share/tmux/resurrect/last 

function reset-tmux -d "Reset tmux from tmux-resurrect last save"
  if test -e $resurrect_save
    echo "last save file $resurrect_save contents:"
    cat ~/.local/share/tmux/resurrect/last
    rm -i ~/.local/share/tmux/resurrect/last

  else
    echo "tmux-resurrect save does not exist"
  end

  read -P "Do you want to tmux kill-server now? (yes/no)" choice

  switch $choice
      case "yes" "y" "Y"
          echo "Killing..."
          tmux kill-server
      case "no" "n" "N"
          echo "Kill-server cancelled."
      case '*'
          echo "Invalid choice, please enter 'yes' or 'no'."
  end
end
