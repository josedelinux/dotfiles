Set-PSReadLineOption -EditMode Emacs
if($IsWindows){
  Import-Module gsudoModule # use gsudo https://scoop.sh/#/apps?q=gsudo
  Set-Alias lvim "C:\Users\Jose\.local\bin\lvim.ps1"
  function msys {
    & "C:\msys64\msys2_shell.cmd" -shell fish -defterm -here -no-start -ucrt64
  }
  function pathedit{
    # win+r: `rundll32 sysdm.cpl,EditEnvironmentVariables`
    Start-Process "rundll32.exe" -ArgumentList "sysdm.cpl,EditEnvironmentVariables"
  }
  function setproxy {
      param (
          [string]$ProxyAddress
      )
      
      # Check if v2rayn.exe or v2rayawin.exe is running
      $v2raynRunning = Get-Process -Name "v2rayn" -ErrorAction SilentlyContinue
      $v2rayawinRunning = Get-Process -Name "v2rayawin" -ErrorAction SilentlyContinue

      # Set default proxy address based on running process
      if (-not $ProxyAddress) {
          if ($v2raynRunning) {
              $ProxyAddress = "http://localhost:10809"
          } elseif ($v2rayawinRunning) {
              $ProxyAddress = "http://localhost:20172"
          } else {
              $ProxyAddress = "http://localhost:10809" # Default to v2rayn's address if no process is found
          }
      }
      
      $Env:https_proxy = $ProxyAddress
      $Env:http_proxy = $ProxyAddress
      
      Write-Output "Proxy set to: $ProxyAddress"
  }
  function unsetproxy() {
    $Env:https_proxy=""
    $Env:http_proxy=""
  }

  $env:CMAKE_GENERATOR = "MSYS Makefiles"
  $env:PYTHONSTARTUP = "$HOME\.PYTHONSTARTUP"

}else{
  function setproxy() {
    #$Env:https_proxy="http://localhost:10809"
    #$Env:http_proxy="http://localhost:10809"
  }
  function unsetproxy() {
  #  $Env:https_proxy=""
  #  $Env:http_proxy=""
  }
}
Set-Alias cxx clang++
Set-Alias lg lazygit

# Alias 'gls' to the 'ls' command with full path
Set-Alias gls Get-ChildItem

# Check if the 'lsd' command is available
if (Get-Command lsd -ErrorAction SilentlyContinue) {
    # Alias 'ls' to 'lsd'
    Set-Alias ls lsd
}
# alias for lsd
function l {
    lsd -l @args
}

function la {
    lsd -a @args
}

function lla {
    lsd -la @args
}

function ll {
    lsd -lh @args
}

function lt {
    lsd --tree @args
}


setproxy

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Invoke-Expression (&starship init powershell)

#$exTime = Measure-Command {
#  Invoke-Expression (&starship init powershell)
#}
#
#Write-host "Starship initialization time was: $exTime"

