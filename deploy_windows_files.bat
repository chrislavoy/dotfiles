@echo off

WHERE scoop
IF %ERRORLEVEL% NEQ 0 (
	ECHO scoop wasn't found, installing
	start powershell.exe -ExecutionPolicy Bypass -File .\scripts\install_scoop.ps1
) ELSE (
	ECHO scoop already installed
)

WHERE nvim
IF %ERRORLEVEL% NEQ 0 (
	ECHO nvim wasn't found, installing
	CMD /K "scoop install neovim"
) ELSE (
	ECHO nvim already installed
)

WHERE alacritty
IF %ERRORLEVEL% NEQ 0 (
	ECHO alacritty wasn't found, installing
	CMD /K "scoop install alacritty"
) ELSE (
	ECHO alacritty already installed
)

REM Copy LazyVim files
xcopy .\nvim %LocalAppData%\nvim /E /Y

REM Copy Alacritty files
xcopy .\alacritty %AppData%\alacritty /E /Y

REM Copy PowerShell profile
xcopy .\PowerShell C:\Users\chris\Documents\PowerShell /E /Y
