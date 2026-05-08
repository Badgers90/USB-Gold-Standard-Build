# 🧱 Windows Golden Image – Home Lab Deployment

This project provides a fully automated Windows deployment setup using:

- Unattended installation (`autounattend.xml`)
- Automated app installs (Chrome, Steam)
- GPU auto-detection (NVIDIA / AMD / Intel)
- Golden image creation for fast rebuilds

---

# 🚀 Overview

This workflow allows you to:

1. Install Windows automatically
2. Configure apps and settings
3. Capture a “golden image”
4. Reuse that image across multiple machines

---

# 🖥️ Requirements

- Windows 10/11 ISO
- Hyper-V / VMware / VirtualBox
- 60GB+ free disk space
- 8GB RAM recommended (for VM)
- USB stick or mountable ISO tool

---

# 📦 Step 1 – Prepare Files

1. Clone this repo:

```bash
git clone https://github.com/YOURNAME/windows-golden-image.git
cd windows-golden-image
