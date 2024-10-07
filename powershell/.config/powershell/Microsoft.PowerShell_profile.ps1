Set-PSReadLineOption -EditMode Emacs

$EnableStarshipPrompt = $false

if($IsWindows){
  Import-Module gsudoModule # use gsudo https://scoop.sh/#/apps?q=gsudo

  function msys {
    & "C:\msys64\msys2_shell.cmd" -shell fish -defterm -here -no-start -ucrt64
  }

  function pathedit{
    # win+r: `rundll32 sysdm.cpl,EditEnvironmentVariables`
    Start-Process "rundll32.exe" -ArgumentList "sysdm.cpl,EditEnvironmentVariables"
  }

  function hisedit {
    $historyPath = (Get-PSReadlineOption).HistorySavePath
    Start-Process $historyPath
  }

  function vihis {
    nvim (Get-PSReadlineOption).HistorySavePath
  }

  function RebootFirmware {
    shutdown /r /fw /t 0
  }

  function setproxy {
      param (
          [string]$ProxyAddress
      )
      
      # Check if v2rayn.exe or v2rayawin.exe is running
      $v2raynRunning = Get-Process -Name "v2rayn" -ErrorAction SilentlyContinue
      $v2rayawinRunning = Get-Process -Name "v2rayawin" -ErrorAction SilentlyContinue
      $nekorayRunning = Get-Process -Name "nekoray" -ErrorAction SilentlyContinue

      # Set default proxy address based on running process
      if (-not $ProxyAddress) {
          if ($v2raynRunning) {
              $ProxyAddress = "http://localhost:10809"
          } elseif ($v2rayawinRunning) {
              $ProxyAddress = "http://localhost:20172"
          } elseif ($nekorayRunning) {
              $ProxyAddress = "http://localhost:2081"
          } else {
              #$ProxyAddress = "http://localhost:10809" # Default to v2rayn's address if no process is found
              return
          }
      }
      
      $Env:https_proxy = $ProxyAddress
      $Env:http_proxy = $ProxyAddress
      $Env:no_proxy = "localhost,127.0.0.1,::1"
      
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

function csgen {
    clang-format -style=google -dump-config > .clang-format
}

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

if ($EnableStarshipPrompt) {
  Invoke-Expression (&starship init powershell)
}

#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\atomic.omp.json" | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })

fnm env --use-on-cd | Out-String | Invoke-Expression

#$exTime = Measure-Command {
#  Invoke-Expression (&starship init powershell)
#}
#
#Write-host "Starship initialization time was: $exTime"

