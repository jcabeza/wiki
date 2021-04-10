---
layout: post
title:  "⚙️ Chocolatey Install"
---

<p align="center">
    <h1 align="center">A List of Software and tools i use.</h1>
</p>

<br>

## Chocolatey Script

```bash
# =====================================================================
# Install script for Windows 10
# Created 10.12.2019
# SBOOK2
# =====================================================================

# VARS

$LogFileInstall = "C:\Temp\logs\choco-install.log"
$LogFileList = "C:\Temp\logs\choco-list.log"

start-transcript -path $LogFileInstall

#region EXECUTION POLICY SET

    Write-host "# ==================================================" -ForegroundColor DarkBlue
    Write-host "# EXECUTION POLICY SET TO UNRESTRICTED" -ForegroundColor DarkBlue
    Write-host "# ==================================================" -ForegroundColor DarkBlue

        Write-host "Setting..." -ForegroundColor red

            Set-ExecutionPolicy Unrestricted
        
        Write-host "done" -ForegroundColor green

#endregion

#region INSTALL AND UPDATE CHOCOLATEY

    Write-host "# ==================================================" -ForegroundColor DarkBlue
    Write-host "# INSTALL CHOCOLATEY TOOL" -ForegroundColor DarkBlue
    Write-host "# ==================================================" -ForegroundColor DarkBlue

        Write-host "Installing..." -ForegroundColor red

            Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

        Write-host "done" -ForegroundColor green

    Write-host "# ==================================================" -ForegroundColor DarkBlue
    Write-host "# UPDATE CHOCOLATEY TOOL" -ForegroundColor DarkBlue
    Write-host "# ==================================================" -ForegroundColor DarkBlue

        Write-host "Updating..." -ForegroundColor red

            choco upgrade chocolatey

        Write-host "done" -ForegroundColor green

#endregion

#region INSTALL CHOCOLATEY PACKAGES

    Write-host "# ==================================================" -ForegroundColor DarkBlue
    Write-host "# INSTALL CHOCOLATEY PACKAGES" -ForegroundColor DarkBlue
    Write-host "# ==================================================" -ForegroundColor DarkBlue 
        
        # 7ZIP    
        Write-host "Installing 7zip..." -ForegroundColor red

            choco install 7zip -y

        Write-host "done" -ForegroundColor green

        # NOTEPAD++    
        Write-host "Installing Notepad++..." -ForegroundColor red

            choco install notepadplusplus -y

        Write-host "done" -ForegroundColor green

        # CCLEANER
        Write-host "Installing CCleaner..." -ForegroundColor red

            choco install ccleaner -y

        Write-host "done" -ForegroundColor green

        # DISPLAY FUSION
        Write-host "Installing Display Fusion..." -ForegroundColor red

            choco install displayfusion -y

        Write-host "done" -ForegroundColor green

        # KEEPASS
        Write-host "Installing Keepass..." -ForegroundColor red

            choco install keepass -y
                
        Write-host "done" -ForegroundColor green

        # WINDOWS TERMINAL
        Write-host "Installing Windows Terminal..." -ForegroundColor red

            choco install microsoft-windows-terminal -y
                
        Write-host "done" -ForegroundColor green

        # WINDOWS TERMINAL
        Write-host "Installing Edge Insider Beta..." -ForegroundColor red

            choco install microsoft-edge-insider -y
                
        Write-host "done" -ForegroundColor green

        # CRYPTOMATOR
        Write-host "Installing Cryptomator..." -ForegroundColor red

            choco install cryptomator -y
                
        Write-host "done" -ForegroundColor green

        # VLC
        Write-host "Installing Vlc..." -ForegroundColor red

            choco install vlc -y
                
        Write-host "done" -ForegroundColor green

#endregion

Stop-Transcript

#region CHOCOLATEY PACKAGES LIST

Write-host "# ==================================================" -ForegroundColor DarkBlue
Write-host "# CHOCOLATEY PACKAGES LIST" -ForegroundColor DarkBlue
Write-host "# ==================================================" -ForegroundColor DarkBlue

    Write-host "Listing..." -ForegroundColor red

        choco list --local-only > $LogFileList
    
    Write-host "done" -ForegroundColor green

    Write-host "Log file : $LogFileList" -ForegroundColor White

#endregion

#region INSTALL MANUAL LIST
# =====================================================================
# INSTALL MANUAL LIST
# =====================================================================

    # HARDWIPE 5.2.1 -> New Soft
    # POMOTROID 0.6.0
    # POWERTOYS
    # XMETERS
    # WSL UBUNTU 18.04 LTS
    # BRAVE BROWSER
    # MICROSOFT EDGE DEV
    # WINDOWS TERMINAL
    # MICROSOFT ONEDRIVE
    # MICROSOFT OFFICE PRO PLUS 2016
    # Nvidea GeForce Experience
    # Steam
    # Gog
    # Compagnon de la console Xbox

#endregion

# =====================================================================
# CHOCOLATEY GUI
# =====================================================================

    # https://github.com/chocolatey/ChocolateyGUI

# =====================================================================
# WINDOWS DEFENDER CPU USAGE
# =====================================================================

    # Get-MpPreference | select ScanAvgCPULoadFactor
    # Set-MpPreference -ScanAvgCPULoadFactor 30
	
# =====================================================================
# WINDOWS WSL2
# =====================================================================

	# \\localhost\C$\Users\jcabeza\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\jcabeza
	# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    # dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
        
```
