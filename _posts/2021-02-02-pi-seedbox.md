---
layout: post
title:  "💻 Install Seedbox"
---

> Seedbox installation on linux debian 10 (Raspbian) and configuration.

* Do not remove this line (it will not be displayed) 
{:toc}

# Install Raspberry Pi

Please take a look at the following documentation for the installation and configuration of your Raspberri Pi :

https://jcabeza.github.io/wiki/2021/02/05/pi-install.html

# Kimsufi Server (optional)

Server Model & installation :

```bash
Model : KS-3 - Atom N2800 - 4GB DDR3 1066 MHz - 2 To SATA
```

For install server follow the step by step on Kimsufi portal.

# Install ruTorrent

For install ruTorrent follow this link :

https://mondedie.fr/d/10831-tuto-installer-rutorrent-sur-debian-10-nginx-php-fpm

If Public Key Errors (**NO_PUBKEY**) :

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B188E2B695BD4743
```

For change the theme to material design theme follow this link :

https://www.noobunbox.net/noobunschool/seedbox/theme-material-design-rutorrent

https://github.com/themightykitten/ruTorrent-MaterialDesign
