# fish dotfiles

## Installation

You would need to have [fisher plugin manage](https://github.com/jorgebucaran/fisher) installed 

assume you have a vanilla fish shell
```bash
# remove default fish config
rm ~/.config/fish/config.sh 

# create softlinks
stow -v fish

# install plugin manager
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 

# update plugins
fisher update

# configure your customization, or you can do you own with `tide configure`
tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time=No --rainbow_prompt_separators=Angled -
-powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character and frame'
--prompt_connection=Dotted --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Lightest --prompt_s
pacing=Sparse --icons='Many icons' --transient=No
```
