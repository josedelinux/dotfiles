fish_add_path /home/$USER/.cargo/bin/
fish_add_path /home/$USER/.local/bin/
fish_add_path /usr/local/go/bin/ # go installed the official way
fish_add_path /home/$USER/go/bin/
fish_add_path /home/$USER/.local/share/nvim/mason/bin/ # tools installed by meson

# for wsl
set virt_env (systemd-detect-virt)
if string match -q "wsl" $virt_env
  fish_add_path /mnt/c/Windows/ # explorer.exe
end
