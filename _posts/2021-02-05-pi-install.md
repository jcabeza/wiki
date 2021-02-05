---
layout: post
title:  "🚀 Install Raspberry PI"
---

Raspberry PI installation on linux debian 10 (Raspbian) and configuration.

* Do not remove this line (it will not be displayed) 
{:toc}

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

Here's a how to configuration for static ip and DNS Servers :

Edit the **dhcp.conf** file on /etc/dhcp.conf

```bash
interface eth0
static ip_address=192.168.1.10/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
	
OR
	
interface wlan0
static ip_address=192.168.1.10/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```

Edit the **resolv.conf** file on /etc/resolv.conf

```bash
servername 192.168.1.254
```

Reboot after change network configuration.

*The ip address/dns can also be set via the external dhcp server (box, ap, dhcp).*

# RPi Operating System & Package Update

For update OS and Packages run :

```bash
sudo apt update && apt upgrade -y
```

Reboot after updates if necessary.

# RPi Basics Packages

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

Edit the SSH configuration **/etc/ssh/sshd_config** and add :

```bash
AllowUsers 'new username'
Banner /etc/issue.net
```
*For best security configure a Key-based authentication.*

Add a personnal SSH Banner/Motd :

```bash
sudo vim /etc/banner
sudo vim /etc/motd
```

Banner/Motd content exemple :

```bash
  ____       _     ___   __        __   _    ____
 |  _ \  ___| |__ / _ \  \ \      / /__| |__/ ___|  ___ _ ____   _____ _ __
 | | | |/ _ \ '_ \ (_) |  \ \ /\ / / _ \ '_ \___ \ / _ \ '__\ \ / / _ \ '__|
 | |_| |  __/ |_) \__, |   \ V  V /  __/ |_) |__) |  __/ |   \ V /  __/ |
 |____/ \___|_.__/  /_/     \_/\_/ \___|_.__/____/ \___|_|    \_/ \___|_|

```

```bash
-------------------------------------------------------------------------------

                               !!!WARNING!!!

 This system is solely for the use of authorized users for official purposes.
You have no expectation of privacy in its use and to ensure that the system is
functioning properly, individuals using this computer system are subject to
having all of their activities monitored and recorded by system personnel.

 Use of this system evidences an express consent to such monitoring and
agreement that if such monitoring reveals evidence of possible abuse or
criminal activity, system personnel may provide the results of such monitoring
to appropriate officials.

-------------------------------------------------------------------------------
```

```bash
-------------------------------------------------------------------------------
W A R N I N G  -  THIS IS A PRIVATE COMPUTER SYSTEM
If you are not authorized to access or use this system, disconnect now !
-------------------------------------------------------------------------------
```

```bash
-------------------------------------------------------------------------------

Hosting ........... OVH Kimsufi Hosting
Status ............ Production
OS ................ Debian GNU/Linux 10
Role .............. uTorrent Seedbox
FQDN .............. N/A
Management IP ..... 192.168.1.x

-------------------------------------------------------------------------------
```

Or create one : http://asciiflow.com/

Restart ssh services after change configuration :

```bash
sudo systemctl restart ssh
```

## History

Edit the **~/.bashrc** and add :

```bash
export HISTTIMEFORMAT='%F, %T ' (Date and Timestamp)
OR
export HISTTIMEFORMAT="%d/%m/%y %T " (Date and Timestamp)

HISTSIZE=1000 (Size of history entries)
HISTFILESIZE=1000 (Size of history file)
export HISTIGNORE="history:ls:pwd:ip a:" (Ignore Specific Commands)
export PROMPT_COMMAND='history -a'
```

Reload .bashrc :

```bash
source ~/.bashrc (reload user .bashrc)
```

# RPi Advanced Security

## IPTables & UFW

For more security it is recommended to configure the firewall **iptables** (installed by default).

For check the iptables firewall rules run :

```bash
sudo iptables -L
```

For simplicity we will install **Uncomplicated Fire Wall (UFW)** (frontend for Iptables) and activate it.

```bash
sudo apt install ufw -y
sudo ufw enable (disable for disable)
```

To add/delete rules run :

```bash
sudo ufw default deny incoming (deny all incoming traffic)
sudo ufw default deny outgoing (deny all outgoing traffic)
sudo ufw allow 22 (for allow ssh port)
sudo ufw allow ssh (for allow ssh service)
sudo ufw deny 21 (for deny)
sudo ufw allow 21/tcp (port/service)
sudo ufw deny from 192.168.1.x port 21 (deny a ip address on port)
sudo ufw reject 22 (block ssh port)

OR Delete rules :

sudo ufw delete allow http
```

Exemple for basic RPi with pi-hole services :

```bash
sudo ufw default deny incoming
sudo ufw deny 22
sudo ufw allow http
sudo ufw allow https
sudo ufw allow from 192.168.1.x port 22
```

To check all rules run :

```bash
sudo ufw show
sudo ufw show added
```

To reset all rules run :

```bash
sudo ufw reset
```

To check firewall status and reload run :

```bash
sudo ufw status
sudo ufw status verbose
sudo ufw status numbered (number list)
sudo ufw
```

[Debian Firewall UFW](https://linuxhint.com/debian_firewalls_ufw/)

## Fail2ban

For install fail2ban package run :

```bash
sudo apt install fail2ban -y
```

After install fail2ban, copy the **/etc/fail2ban/jail.conf** file to **/etc/fail2ban/jail.local**

```bash
sudo cp jail.conf jail.local
```

Edit the **jail.local** file and enabled the ssh services :

```bash
sudo vim jail.local

[DEFAULT]
bantime    = 1800 (30 min)
findtime   = 1800 (30 min)
destemail  = root@localhost
sendername = Hostname - Fail2Ban

[ssh]
enabled	 = true
port	 = ssh
filter	 = sshd
logpath	 = /var/log/auth.log
maxretry = 3
```

## Logwatch

For install logwatch package run :

```bash
sudo apt install logwatch -y
```

## Rkhunter (Rootkit Hunter)

For install rkhunter package run :

```bash
sudo apt install rkhunter -y
```

Edit the **/etc/default/rkhunter.conf** configuration file and add :

```bash
sudo vim /etc/default/rkhunter.conf

REPORT_EMAIL="monitoring@test.com"
CRON_DAILY_RUN="yes"
ALLOWHIDDENDIR=/dev/.udev (add if false positive)
```

For execute rkhunter/update/testslist run :

```bash
sudo rkhunter --check
sudo rkhunter --update (update)
sudo rkhunter --list (tests list)
```

For check logs :

```bash
less /var/log/rkhunter.log
```

## Chkrootkit (optional)

For install chkrootkit package run :

```bash
sudo apt install chkrootkit -y
```

For execute chkrootkit run :

```bash
sudo chkrootkit | less

OR

sudo chkrootkit > /tmp/chkrootkit.log (less /tmp/chkrootkit.log for read the file)
```

For auto-check, edit the configuration file **/etc/chkrootkit.conf** and activate the run daily :

```bash
sudo vim /etc/chkrootkit.conf

RUN_DAILY="true"
```

## Lynis Security audit (optional)

For install lynis package run :

```bash
sudo apt install lynis -y
```

Update Database :

```bash
sudo lynis –-check-update
```

For run Lynis :

```bash
sudo lynis -c
```

To view only Suggestion or Warning on log file :

```bash
sudo grep Suggestion /var/log/lynis.log
sudo grep Warning /var/log/lynis.log
```

## Disable Unnecessary Services

For check services status :

```bash
sudo service --status-all
sudo service sendmail status (specific service)

OR

sudo ls /etc/init.d

OR

sudo systemctl status
sudo systemctl status <service>
```

For list all running services :

```bash
sudo systemctl
```

For stop/start/restart services :

```bash
sudo systemctl stop/start/restart <service>
```

For disable a service :

```bash
sudo systemctl disable <service>
```

For check service in failed :

```bash
sudo systemctl --failed
```

For enable/disable service on boot :

```bash
sudo systemctl enable/disable <service>
```

## Linux Hardening

[Linux Hardening Checklist](https://linuxhint.com/linux_security_hardening_checklist/)

# Rpi Others

Raspberry PI Configuration :

```bash
raspi-config
```

<img src="https://img.shields.io/badge/Autor-Jos%C3%A9%20CABEZA-blue?style=for-the-badge" />
<img src="https://img.shields.io/badge/Version-1.0-blue?style=for-the-badge" />
