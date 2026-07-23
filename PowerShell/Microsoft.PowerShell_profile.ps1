$use_vs = $false

Import-Module posh-git
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

Function Invoke-ReloadProfile {& $profile}
Function Invoke-GitLog {git log --date=short --pretty=format:"%C(auto) %h %ad %<|(35)%ar %<(70,mtrunc) %s %d" -n 20 $1}
Function Invoke-GitLogAuthor {git log --date=short --pretty=format:"%C(auto) %<(18,trunc) %an %<|(35) %ar %<(70,mtrunc) %s %d" -n 20}
Function Invoke-GitPush {git push $*}
Function Invoke-GitPull {git pull $*}
Function Invoke-GitCommitWithMessage {git add -A :/ $T git commit -m $*}
Function Invoke-GitStatus {git status}
Function Invoke-SwitchToCodeDirectory {Set-Location C:\code}
Function Open-NvimConfigure {nvim C:\Users\chris\AppData\Local\nvim\init.vim}
Function Open-NvimInitLua {nvim C:\Users\chris\Appdata\Local\nvim\init.lua}
Function Open-CTT {Invoke-WebRequest -useb https://christitus.com/win | Invoke-Expression}
Function Invoke-SwitchToNeovimPluginDirectory {Set-Location C:\Users\chris\AppData\Local\nvim\lua\plugins}
Function Open-AlacrittyConfig {nvim C:\Users\chris\AppData\Roaming\alacritty\alacritty.toml}
Function Open-WezTermConfig {nvim C:\Users\chris\.wezterm.lua}
Function Open-ContourConfig {nvim C:\Users\chris\AppData\Local\contour\contour.yml}

Set-Alias -Name rlp -Value Invoke-ReloadProfile
Set-Alias -Name gll -Value Invoke-GitLog
Set-Alias -Name gla -Value Invoke-GitLogAuthor
Set-Alias -Name gpp -Value Invoke-GitPush
Set-Alias -Name gpl -Value Invoke-GitPull
Set-Alias -Name gacm -Value Invoke-GitCommitWithMessage
Set-Alias -Name gs -Value Invoke-GitStatus
# Set-Alias -Name cst -Value JumpToSpectraTeam
Set-Alias -Name cc -Value Invoke-SwitchToCodeDirectory
Set-Alias -Name scoop-update -Value C:\Users\chris\scoop-update.ps1
Set-Alias -Name choco-upgrade -Value C:\Users\chris\choco-upgrade.ps1
Set-Alias -Name nvimrc -Value Open-NvimInitLua
Set-Alias -Name nvimil -Value Open-NvimInitLua
Set-Alias -Name ctt -Value Open-CTT
Set-Alias -Name nvp -Value Invoke-SwitchToNeovimPluginDirectory
Set-Alias -Name eaa -Value C:\Users\chris\expand-all-archives.ps1
Set-Alias -Name alcfg -Value Open-AlacrittyConfig
Set-Alias -Name wztcfg -Value Open-WezTermConfig
Set-Alias -Name cntrcfg -Value Open-ContourConfig

if ($use_vs)
{
  pushd "C:\Program Files\Microsoft Visual Studio\18\Community\Common7\Tools"
  cmd /c "VsDevCmd.bat&set" |
  foreach {
    if ($_ -match "=") {
      $v = $_.split("=", 2); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])" 
    }
  }
  popd

  Write-Host "`nVisual Studio Command Prompt variables set. Type nvim $\profile to remove" -ForegroundColor Yellow
}
else 
{
  Write-Host "`nVisual Studio Command Prompt not variables set. Type nvim $\profile to change" -ForegroundColor Yellow
}
