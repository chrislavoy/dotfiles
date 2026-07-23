@echo off

REM Copy LazyVim files
xcopy %LocalAppData%\nvim .\nvim /E /Y

REM Copy Alacritty files
xcopy %AppData%\alacritty .\alacritty /E /Y

REM Copy PowerShell profile
xcopy C:\Users\chris\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 .\PowerShell /E /Y
