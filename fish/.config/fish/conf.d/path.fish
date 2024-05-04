fish_add_path /home/$USER/.cargo/bin/
fish_add_path /home/$USER/go/bin/

# for wsl
set virt_env (systemd-detect-virt)
if string match -q "wsl" $virt_env
  fish_add_path /mnt/c/Windows/ # explorer.exe
end
