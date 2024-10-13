# Custom sourcing of colors, exports, paths, grc, multi-function fish files, etc.

# *.fish scripts in ~/.config/fish/conf.d/ are also automatically executed before config.fish.

set USE_STARSHIP true  # Change to false to disable starship
set USE_OMP false  # Change to false to disable oh-my-posh

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

if test $USE_OMP = true
    if command -v oh-my-posh > /dev/null
        oh-my-posh init fish | source
        # oh-my-posh init fish --config ~/atomic.omp.json | source
        # oh-my-posh init fish --config "https://github.com/JanDeDobbeleer/oh-my-posh/raw/refs/heads/main/themes/atomic.omp.json" | source

    end
end
