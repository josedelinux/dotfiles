# Custom sourcing of colors, exports, paths, grc, multi-function fish files, etc.
source ~/.config/fish/conf.d/variables.fish
source ~/.config/fish/conf.d/exports.fish
source ~/.config/fish/conf.d/abbr.fish
source ~/.config/fish/conf.d/alias.fish
source ~/.config/fish/conf.d/path.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
