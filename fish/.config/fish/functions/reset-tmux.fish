# Set the path to the last tmux-resurrect save file
set resurrect_save ~/.local/share/tmux/resurrect/last

function reset-tmux -d "Reset tmux eliminating the last saved session from tmux-resurrect"
  if test -e $resurrect_save
    echo "Contents of the last resurrect save file ($resurrect_save):"
    cat $resurrect_save
    rm -i $resurrect_save

  else
    echo "No tmux-resurrect save file found."
  end

  read -P "Do you want to kill the tmux server now? " choice

  # Process the user's choice
  switch $choice
      case "yes" "y" "Y"
          echo "Killing the tmux server..."
          tmux kill-server
      case "no" "n" "N"
          echo "Cancelling the kill-server operation."
      case '*'
          echo "Invalid choice, please enter 'yes/y/Y' or 'no/n/N'."
  end
end
