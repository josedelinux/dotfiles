if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set up command line proxy
if string match -q "*WSL2*" (uname -a)
  export hostip=(ip route | grep default | awk '{print $3}');
  export http_port=10811; # v2rayn
else
  export hostip=127.0.0.1;
  export http_port=20171; # v2raya
end


export http_proxy="http://$hostip:$http_port";
export https_proxy="http://$hostip:$http_port";

# Set up alias
alias cxx c++
alias csgen 'clang-format -style=google -dump-config > .clang-format'
