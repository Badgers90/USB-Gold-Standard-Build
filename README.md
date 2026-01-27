🚀 Windows 11 Gold USB Build
Automated Deployment • Gaming Optimised • Hardware‑Aware • GitHub‑Versioned
This repository contains a fully automated Windows 11 Pro deployment framework, optimised for gaming, mixed‑hardware support, and repeatable USB builds.
It includes:

Unattended Windows installation (no prompts)
Local administrator account with blank password
Automated installation of Chrome, Steam, and Discord
Vendor‑aware GPU driver install (NVIDIA / AMD / Intel)
Gaming optimisations:

Game Mode OFF
Pagefile fixed at 4GB (stable)


Dynamic power switching

Desktop → Ultimate Performance
Laptop on AC → Ultimate Performance
Laptop on Battery → Balanced


Supports GitHub versioning
Installers excluded with .gitignore
Full logging to C:\PostInstall\Logs


📁 Folder Structure
USB_GOLD_BUILD/
├─ Autounattend.xml
├─ README.md
├─ .gitignore
├─ sources/
│  └── $OEM$/$$/Setup/Scripts/SetupComplete.cmd
└─ PostInstall/
   ├─ Install-GPUDrivers.ps1
   ├─ Install-Apps.ps1
   ├─ Gaming-Tweaks.ps1
   ├─ Dynamic-PowerSwitch.ps1
   ├─ Register-DynamicPowerTask.ps1
   ├─ New-DesktopAdminToolkit.ps1
   ├─ Apps/        (ignored by Git)
   ├─ Drivers/     (ignored by Git)
   └─ Logs/        (ignored by Git)


🧷 .gitignore (Included)
Installers & logs are excluded:
PostInstall/Apps/*
PostInstall/Drivers/*
PostInstall/Logs/*

This keeps the repository clean, small, and safe for public use.

📥 Add These Installers Locally (Not in GitHub)
Place the following files into the USB package manually:
Apps → PostInstall/Apps/

ChromeStandalone.msi
SteamSetup.exe
DiscordSetup.exe

GPU Drivers → PostInstall/Drivers/
Rename them exactly as shown:

NVIDIA.exe
AMD.exe
Intel.exe

These are the offline full driver packages from each vendor.

These files are ignored by git and will not be pushed to GitHub.


🔧 How to Create the USB Installer

Download the official Windows 11 Pro ISO
Create a bootable USB using Rufus or Windows Media Creation Tool
Copy all contents of this repository to the root of the USB
Add installers into the correct folders:
PostInstall/Apps/
PostInstall/Drivers/


Boot a PC from the USB
Windows installs automatically → Scripts run automatically → System is fully configured


🧪 Testing Instructions
✔ 1. Test in a Virtual Machine (recommended first)

Confirms unattended setup and scripts
Confirms Game Mode OFF + power tweaks
Confirms logging
Does not test GPU installers (VM GPUs unsupported)

✔ 2. Test on a spare PC (best for GPU & apps)

GPU vendor detection
App installs (Chrome/Steam/Discord)
Dynamic AC/battery switching for laptops
Scheduled Task creation

✔ 3. Full production hardware test
Ensure:

C:\PostInstall\Logs contains:

gpu.log
apps.log
gaming-tweaks.log
dynamic-power.log


Power plan changes correctly
GPU drivers installed correctly
Apps installed correctly


⚡ Dynamic Power Profiles (How It Works)
This is implemented using:

PowerShell detection of:

Battery presence
AC adapter state


A Scheduled Task that runs:

At logon
When AC/battery power events fire



Behaviour:

























DevicePower StateResultDesktopAlways ACUltimate PerformanceLaptopPlugged InUltimate PerformanceLaptopBatteryBalanced
This ensures low latency on AC and reasonable battery life when unplugged.

📄 Logs & Diagnostics
Logs are written to:
C:\PostInstall\Logs\

Each script creates its own .log file for easy troubleshooting.

🔐 Activation
Windows installs unactivated (as required).
You must activate later using a valid retail/MAK/digital key.
Example:
PowerShellslmgr /ipk YOUR-PRODUCT-KEY-HEREslmgr /atoShow more lines
No activation bypasses are included.

🏷 Versioning & Updates
All logic is stored in plain text (.ps1, .cmd, .xml), so you can:

Fork
Branch
Tag
Create releases
Manage multiple build configurations (Gaming / Work / Clean)


🆘 Support
If you want:

Additional tweaks
A “Workstation edition”
A script validator
Automatic GitHub deployment
Installer download automation
GPU model‑specific drivers
Menu‑based options (during SetupComplete)

Just open an issue or request an enhancement.
