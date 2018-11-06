# Astroberry Server
Astroberry Server is a ready to use astronomy desktop system for Raspberry Pi 3 Model B and B+
It is a standalone system for controlling astronomy equipment supported by INDI server.

[![astroberry-server](https://img.youtube.com/vi/t3CHtQmzvhY/0.jpg)](https://youtu.be/ZHCab7DomkI)

The system features:
- Ubuntu Mate 16.04 Desktop
- Virtual Access Point (VAP) allowing to access the system directly i.e. without external wireless network eg. in the field
- Remote desktop accessible over VNC at astroberry.local:5900 or a web browser at http://astroberry.local
- KStars planetarium software and Ekos with all available device drivers
- Skychart / Cardes du Ciel planetarium software
- HNSKY planetarium software
- CCDciel capture control software (supports Skychart and HNSKY)
- Astrometry with basic index files
- PHD2 for autoguiding
- Lin-guider for autoguiding
- Gnome Predict for satellite tracking
- StarPlot for 3-dimensional positions of stars in space
- oaCapture for planetary imaging
- wxAstroCapture for planetary imaging
- Planetary Imager for planetary imaging
- SER Player for viewing captured video streams
- Astroberry PiFace drivers for a relay and focuser control
- Astroberry DIY drivers for focuser, gps, switch board, IMU device
- Samba server sharing Pictures directory for easy access to captured images
- Support for raspi-config for easy configuration of Raspberry Pi options

# How to start?
Download the image file from https://goo.gl/KWMMCP

Confirm SHA256 checksums in [SHA256SUMS](https://github.com/rkaczorek/astroberry-server/blob/master/SHA256SUMS) file for packed and unpacked image files to ensure that
they are not corrupted during download.

Unpack the image file and flash your microSD card (minimum 16GB required) using [etcher.io](https://etcher.io/) or running the below commands in your terminal:
```
xz -d astroberry-server_1.1.0.img.xz
sudo dd if=astroberry-server_1.1.0.img of=/dev/sdX bs=8M status=progress
```
Note1: Replace sdX with your microSD card identifier. Make sure it is correct before running the above command!

After flashing your microSD card and booting into the system you can expand the filesystem up to maximum space available on the microSD card. To do this open terminal window and run:
```
sudo raspi-config
```
Then select Advanced Options / Expand Filesystem

# How to use it?
It's as simple as this:
- Start your Raspberry Pi with the flashed microSD card.
- Connect to a astroberry wireless network (default password is astroberry)
- Point your browser to http://astroberry.local or http://IP_ADDRESS
- Click Connect button to access Astroberry Server in unencrypted mode or 'encrypted connection' link to use secure connection
- Login to desktop (default password is astroberry)
- Have fun

Note: Astroberry Server is accessible at http://astroberry.local or http://IP_ADDRESS
      If you are connecting via Virtual Access Point IP_ADDRESS is 192.168.10.1
      If you are connecting via home wireless connection IP_ADDRESS is assigned by your home router

# How to upgrade?
Starting from version 1.1.0 you need to reflash your microSD card with the latest image file to upgrade the system.
To upgrade your operating system use regular procedure by running apt, apt-get, aptitude or Software Updater.

# How to reconfigure it?
You can use it as any Ubuntu system, however there are some mission critical parameters to be configured by
embedded scripts i.e.
- astroberry_vap - to start, stop or check status of Virtual Access Point
- check-wlanconn - to test on wireless connection and fallback to Virtual Access Point if no wireless network is available or configured
- vaprename - to change Virtual Access Point name
- vappasswd - to change your Virtual Access Point password
- wlanconf - to set configuration of your preffered wireless network (restart to activate the configuration)
- wlanconf-gui - to set configuration of your preffered wireless network in graphical mode (restart to activate the configuration)

# What is default username and password?
It's always astroberry:
- For SSH access run: ssh astroberry@astroberry.local
- For VNC access use astroberry.local:5900 for server and astroberry for username and password
- For your browser access use http://astroberry.local/ or http://IP_ADDRESS then click Connect button and login (default password is astroberry)

# Installing your own certificates
Using encrypted connection requires a security certificate installed on your Astroberry Server.
If you want to use default configuration you need to install and trust security certificate (distributed with the system) in your browser.
Due to security constraints of modern browsers default SSL configuration might not work for you. In such a case just use unencrypted connection
or install commercial certificates. To do this you need to get your certificate issued by a public certification authority recognized by your browser.
As soon as you get your own certificate you can install it by replacing the content of the file /opt/noVNC/server.pem. To activate your changes run:
```
sudo systemctrl restart novnc.service
sudo systemctrl restart nginx.service
```

# FAQ
Q: The image is too large for my microSD card

A: If the image appears to be too big shrink it according to [this example](https://softwarebakery.com//shrinking-images-on-linux)

Q: Why I get black screen after logging to Astroberry Server desktop?

A: The origin of this issue is unknown. Restart your system and try again. If it does not help remove .Xauthority file in your home directory and restart

Q: How can I preserve my configuration while upgrading the system?

A: Backup your /home/astroberry directory on external storage and restore it after reflashing your microSD card

Q: Why I cannot configure my wireless network with wlanconf or wlanconf-gui?

A: In rare cases the provided scripts don't work. To configure your wireless network you can manually edit /etc/wpa_supplicant/wpa_supplicant.conf file

# Issues
File any issues on https://github.com/rkaczorek/astroberry-server

