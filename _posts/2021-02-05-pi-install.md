---
layout: post
title:  "Install Raspberry PI"
---

Raspberry PI installation on linux debian 10 (Raspbian) and configuration.

<img src="https://img.shields.io/badge/Autor-Jos%C3%A9%20CABEZA-blue?style=for-the-badge" />
<img src="https://img.shields.io/badge/Version-1.0-blue?style=for-the-badge" />

# RPi Operating System

Here's a list of Operating System for Raspberry PI :

 1. [Raspbian](https://www.raspbian.org/)
 2. [DietPi](https://dietpi.com/)
 
Here's a list of tools for create a boot image on usb key :

 1. [Rufus](https://rufus.ie/) (best)
 2. [Win32DiskImager](https://sourceforge.net/projects/win32diskimager/files/latest/download) (old school)
 3. [Etcher](https://www.balena.io/etcher/) (too heavy and too slow)
 4. [Raspberry Pi Imager](https://www.raspberrypi.org/downloads/) (why not)

Here's a how to configuration for the SSH activation on boot :

After create the boot image, enter on your device (usb) and create a **ssh** file on the root (boot part).

```bash
cd 'device'
sudo touch ssh
```

Here's a configuration script for auto-config your RPI on first boot :

```bash
under development
```

This specific configuration can be configured after boot by connecting via ssh.

# RPi Hostname

Change the hostname on RPI :

```bash
sudo vim /etc/hostname
sudo vim /etc/hosts
```

To check hostname run :
```bash
sudo hostname
```

Reboot after change hostname.

# RPi Network



# RPi Operating System & Package Update

For update OS and Packages run :

```bash
sudo apt update && apt upgrade -y
```

Reboot after updates if necessary.

# RPi BasicsPackages

For install basics packages run :

```bash
sudo apt install htop locate git vim pv -y
```

# RPi Basic System Security

## User Settings

Create a new user :

```bash
sudo adduser 'username' (with strong password !)
sudo passwd 'username' (for change password)
```

Disable pi user :

```bash
sudo pkill -u pi
sudo deluser -remove-home pi
```

Edit **/etc/sudoers** file and add :

```bash
username ALL=(ALL) PASSWD: ALL
```

## Secure Shell (SSH)

 ---

You can still do it if you haven't yet,

<!-- Place this tag where you want the button to render. -->
<a class="github-button" href="https://github.com/jcabeza/wiki" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star jcabeza/wiki on GitHub">Star</a>
<script async defer src="https://buttons.github.io/buttons.js"></script>

Thank you.
