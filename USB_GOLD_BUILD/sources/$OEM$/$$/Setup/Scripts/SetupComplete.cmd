@echo off
if not exist "C:\PostInstall" mkdir "C:\PostInstall"
xcopy "%~dp0..\..\..\PostInstall" "C:\PostInstall" /E /I /H /Y >nul

net user localadmin ""

PowerShell -NoProfile -ExecutionPolicy AllSigned -File "C:\PostInstall\Install-GPUDrivers.ps1"
PowerShell -NoProfile -ExecutionPolicy AllSigned -File "C:\PostInstall\Install-Apps.ps1"
PowerShell -NoProfile -ExecutionPolicy AllSigned -File "C:\PostInstall\Gaming-Tweaks.ps1"
PowerShell -NoProfile -ExecutionPolicy AllSigned -File "C:\PostInstall\Dynamic-PowerSwitch.ps1"
PowerShell -NoProfile -ExecutionPolicy AllSigned -File "C:\PostInstall\Register-DynamicPowerTask.ps1"
PowerShell -NoProfile -ExecutionPolicy AllSigned -File "C:\PostInstall\New-DesktopAdminToolkit.ps1"

exit /b 0
