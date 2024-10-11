# Custom sourcing of colors, exports, paths, grc, multi-function fish files, etc.

# *.fish scripts in ~/.config/fish/conf.d/ are also automatically executed before config.fish.

set USE_STARSHIP false  # Change to false to disable starship

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if command -v zoxide > /dev/null
  zoxide init fish | source
end

if test $USE_STARSHIP = true
    if command -v starship > /dev/null
        starship init fish | source
    end
end
