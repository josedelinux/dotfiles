# Run systemd-detect-virt and store the output in the variable "virt_env"
set virt_env (systemd-detect-virt)

# Set up command line proxy
function setproxy
  if test -n "$http_proxy"
    # echo "setproxy: Proxy is already set. Skipping."
    # dumpproxy
    return
  end

  if string match -q "wsl" $virt_env
    set hostip (ip route | grep default | awk '{print $3}');
    set http_port 10811; # v2rayn
  else if string match -q "vmware" $virt_env
    set hostip 192.168.198.1;
    set http_port 10811; # v2rayn
  else if string match -q "none" $virt_env
    # echo "setproxy: Real machine detected." 
    # No proxy configuration needed. Go use v2raya/dae
    return
  else
    echo "setproxy: Unknown Platform: $virt_env"
    return
  end

  if test -n "$hostip" -a -n "$http_port"
    export http_proxy="http://$hostip:$http_port";
    export https_proxy="http://$hostip:$http_port";
    echo "Network Proxy on"
  else
    # something went wrong
    dumpproxy
  end
end

function unsetproxy
  set -e http_proxy
  set -e https_proxy
  echo "Network Proxy off"
end

function dumpproxy
  echo "http_proxy: $http_proxy"
  echo "https_proxy: $https_proxy"
end

setproxy

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgrep.conf";
export EDITOR="vim";

#https://wiki.archlinux.org/title/Node.js#Allow_user-wide_installations
export npm_config_prefix="$HOME/.local"
