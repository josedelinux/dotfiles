Set-PSReadLineOption -EditMode Emacs

$EnableStarshipPrompt = $true
$EnableOMPPrompt = $false

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

  function vihosts {
    sudo nvim C:\Windows\System32\drivers\etc\hosts
  }

  function RebootFirmware {
    shutdown /r /fw /t 0
  }

  function reboot {
    shutdown /r /t 0
  }

  function poweroff {
    shutdown /s /t 0
  }

  function gitfu {
    git fetch
    git status
  }

  function setproxy {
      param (
          [string]$ProxyAddress
      )
      
      # Check if v2rayn.exe or v2rayawin.exe is running
      $v2raynRunning = Get-Process -Name "v2rayn" -ErrorAction SilentlyContinue
      $v2rayawinRunning = Get-Process -Name "v2rayawin" -ErrorAction SilentlyContinue
      $nekorayRunning = Get-Process -Name "nekobox" -ErrorAction SilentlyContinue
      $clashVergeRunning = Get-Process -Name "clash-verge" -ErrorAction SilentlyContinue

      # Set default proxy address based on running process
      if (-not $ProxyAddress) {
          if ($v2raynRunning) {
              $ProxyAddress = "http://localhost:10808"
          } elseif ($v2rayawinRunning) {
              $ProxyAddress = "http://localhost:20172"
          } elseif ($nekorayRunning) {
              $ProxyAddress = "http://localhost:2080"
          } elseif ($clashVergeRunning) {
              $ProxyAddress = "http://localhost:7897"
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

  function Get-PortProcess {
      [CmdletBinding()]
      param (
          [Alias("p")]
          [int]$Port = 8080
      )
 
      $connections = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue
 
      if ($null -eq $connections) {
          Write-Host "No process is using port $Port." -ForegroundColor Yellow
      } else {
          foreach ($conn in $connections) {
              $proc = Get-Process -Id $conn.OwningProcess -ErrorAction SilentlyContinue
              [PSCustomObject]@{
                  Port        = $Port
                  State       = $conn.State
                  PID         = $conn.OwningProcess
                  ProcessName = $proc.ProcessName
              }
          }
      }
  }

  $env:CMAKE_GENERATOR = "MSYS Makefiles"
  $env:PYTHONSTARTUP = "$HOME\.PYTHONSTARTUP"
  $env:YAZI_FILE_ONE = "$env:USERPROFILE\scoop\apps\git\current\usr\bin\file.exe"
  $env:EDITOR = "nvim" 

}else{
  # other system other than windows

  function setproxy() {
    #$Env:https_proxy="http://localhost:10809"
    #$Env:http_proxy="http://localhost:10809"
  }
  function unsetproxy() {
  #  $Env:https_proxy=""
  #  $Env:http_proxy=""
  }
}

# platform agnostic configs

Set-Alias cxx clang++
Set-Alias pkill pskill
Set-Alias lg lazygit

function csgen {
    clang-format -style=google -dump-config > .clang-format
}

# shell wrapper that provides the ability to change the current working directory when exiting Yazi.
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

# Alias 'gls' to the 'ls' command with full path
Set-Alias gls Get-ChildItem

# Check if the 'lsd' command is available
if (Get-Command lsd -ErrorAction SilentlyContinue) {
    # Alias 'ls' to 'lsd'
    Set-Alias ls lsd

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
}

setproxy

if ($EnableStarshipPrompt) {
  Invoke-Expression (&starship init powershell)
}

if ($EnableOMPPrompt){
  # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
  oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\atomic.omp.json" | Invoke-Expression
}

if (Get-Command zoxide -ErrorAction SilentlyContinue) {
  Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

if (Get-Command fnm -ErrorAction SilentlyContinue) {
  fnm env --use-on-cd | Out-String | Invoke-Expression
}

if (Get-Command direnv -ErrorAction SilentlyContinue) {
  $Env:HOME = $HOME
  Invoke-Expression "$(direnv hook pwsh)"
}
#$exTime = Measure-Command {
#  Invoke-Expression (&starship init powershell)
#}
#
#Write-host "Starship initialization time was: $exTime"

# vscode shell integration
if ($env:TERM_PROGRAM -eq "vscode") { . "$(code --locate-shell-integration-path pwsh)" }

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

