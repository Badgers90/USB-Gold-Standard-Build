# Windows 11 Gaming USB – Gold Build

## What this does
- Unattended Windows 11 Pro install
- Local admin account (blank password)
- Chrome, Steam, Discord installed automatically
- Vendor-aware GPU driver install (offline)
- Game Mode OFF
- Ultimate Performance on desktop / laptop when plugged in
- Balanced power plan on battery (auto-switching)

## GitHub usage
This repository is designed to be committed **without installers**.

Installers are excluded via `.gitignore`.

### Add locally before USB use:
- `PostInstall/Apps/ChromeStandalone.msi`
- `PostInstall/Apps/SteamSetup.exe`
- `PostInstall/Apps/DiscordSetup.exe`
- `PostInstall/Drivers/NVIDIA.exe`
- `PostInstall/Drivers/AMD.exe`
- `PostInstall/Drivers/Intel.exe`

## USB creation
1. Create a Windows 11 Pro USB (Media Creation Tool or Rufus)
2. Copy **all repo contents** to the USB root
3. Add installers as above
4. Boot and deploy

Logs are written to `C:\PostInstall\Logs`.
