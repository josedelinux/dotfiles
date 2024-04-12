# Run systemd-detect-virt and store the output in the variable "virt_env"
set virt_env (systemd-detect-virt)

# Set up command line proxy
if string match -q "wsl" $virt_env
  export hostip=(ip route | grep default | awk '{print $3}');
  export http_port=10811; # v2rayn
else if string match -q "vmware" $virt_env
  export hostip=192.168.198.1;
  export http_port=10811; # v2rayn
else
  # real machine v2raya, no action needed
  export hostip=
  export http_port= 
end


export http_proxy="http://$hostip:$http_port";
export https_proxy="http://$hostip:$http_port";

function unsetproxy
  set -e http_proxy
  set -e https_proxy
  echo "Network Proxy off"
end

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgrep.conf";

