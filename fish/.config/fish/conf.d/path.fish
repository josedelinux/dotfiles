# https://fishshell.com/docs/current/cmds/fish_add_path.html

#set fish_add_path_flag "-P" #     Manipulate $PATH directly.
# `fish_add_path -P` equals `set -gx PATH /path/you/wannna/add $PATH`
# universal variable are actually faster

fish_add_path $fish_add_path_flag /home/$USER/.cargo/bin/
fish_add_path $fish_add_path_flag /home/$USER/.local/bin/
fish_add_path $fish_add_path_flag /usr/local/go/bin/ # go installed the official way
fish_add_path $fish_add_path_flag /home/$USER/go/bin/
fish_add_path $fish_add_path_flag /home/$USER/.local/share/nvim/mason/bin/ # tools installed by meson
fish_add_path $fish_add_path_flag /home/jose/.luarocks/bin/ # tools installed by luarocks

# for wsl
set virt_env (systemd-detect-virt)
if string match -q "wsl" $virt_env
  fish_add_path $fish_add_path_flag /mnt/c/Windows/ # explorer.exe
end
