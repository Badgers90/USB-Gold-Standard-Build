# 🧱 Windows Golden Image – Full Build Guide (Home Lab)

This repository contains a **complete, production-ready Windows deployment workflow** using:

- Unattended installation (`autounattend.xml`)
- Automated app installs (Chrome, Steam)
- GPU auto-detection (NVIDIA / AMD / Intel)
- Golden image capture for fast rebuilds

---

# 🚀 Overview

This setup allows you to:

1. Automatically install Windows
2. Configure applications and settings
3. Capture a reusable “golden image”
4. Deploy it to any machine quickly

---

# 🖥️ Requirements

- Windows 10/11 ISO
- Hyper-V / VMware / VirtualBox
- 8GB RAM recommended
- 60GB+ storage
- USB or ISO mounting tool

---

# 📦 Step 1 – Prepare Files

1. Clone repo:

```bash
git clone https://github.com/YOURNAME/windows-golden-image.git
cd windows-golden-image
```

2. Copy `autounattend.xml` to:
- USB root
- OR extracted ISO root

---

# 🖥️ Step 2 – Create Reference VM

Create VM with:

- Gen 2
- 4–8GB RAM
- 2+ CPUs
- 60GB disk

Attach ISO and boot.

---

# ⚙️ Step 3 – Automated Setup

The system will:

✅ Install Windows  
✅ Log in automatically  
✅ Run scripts  
✅ Install:
- Chrome
- Steam
- GPU software (if detected)

---

# 🧹 Step 4 – Clean System

Run as admin:

```powershell
Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Users\*\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

net stop wuauserv
Remove-Item C:\Windows\SoftwareDistribution -Recurse -Force
net start wuauserv
```

Optional:

```powershell
cleanmgr /sageset:1
cleanmgr /sagerun:1
```

---

# 🧬 Step 5 – Sysprep (Critical)

```powershell
C:\Windows\System32\Sysprep\Sysprep.exe
```

Select:
- OOBE
- ✅ Generalize
- Shutdown

---

# 💾 Step 6 – Capture Image

Boot into installer → press `Shift + F10`

```cmd
diskpart
list vol
```

Capture:

```cmd
dism /capture-image /imagefile:D:\install.wim /capturedir:C:\ /name:"Win11-Golden"
```

---

# 📀 Step 7 – Build ISO

Extract ISO → replace:

```
sources\install.wim
```

Then:

```powershell
oscdimg -bC:\WinISO\boot\etfsboot.com -u2 -h -m -lWIN11_CUSTOM C:\WinISO C:\Win11-Golden.iso
```

---

# ✅ Step 8 – Deploy

Install using new ISO:

✅ Fully configured Windows  
✅ Apps ready  
✅ 5–10 min deployment  

---

# ⚠️ Important

Do NOT remove:
- Edge
- WebView2
- Media Features

---

# 🧩 Extending

Add scripts and call them in:

```powershell
C:\Windows\Setup\Scripts\FirstLogon.ps1
```

---

# 🏁 Result

✅ Automated install  
✅ Reusable image  
✅ Fast rebuilds  
✅ Git-managed config  

---
