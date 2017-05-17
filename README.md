# Astroberry Server
Astroberry Server is a ready to use astronomy desktop system for Raspberry Pi 3
It is a standalone system for controlling astronomy equipment supported by INDI server.

The system features:
- Ubuntu Mate 16.04 Desktop
- Virtual Access Point (VAP) allowing to access the system without external wireless network
- Remote desktop accessible over VNC at astroberry.local:5900 or a web browser at https://astroberry.local
- KStars and Ekos with all available device drivers
- Astrometry with basic index files
- PHD2 for autoguiding
- Gnome Predict for satellite tracking
- StarPlot for 3-dimensional positions of stars in space
- oaCapture and wxAstroCapture for planetary imaging
- Astroberry PiFace drivers for a relay and focuser control
- Samba server sharing Pictures directory for easy access to captured images

# How to start?
Due to github does not allow keeping files over 100MB the image is stored on Google Drive.

Download the image file from https://drive.google.com/open?id=0B8iZo4LMCyr6c2VQWUJHdTRZbVU

Confirm SHA256 checksums in [SHA256SUMS](https://github.com/rkaczorek/astroberry-server/blob/master/SHA256SUMS) file for packed and unpacked image files to ensure that
they are not corrupted during download.

Unpack the image file and flash your microSD card (minimum 16GB required) with it:
```
xz -d astroberry-XXX.img.xz
sudo dd if=astroberry-XXX.img of=/dev/sdX bs=4M
```
Note: Replace sdX with your microSD card identifier. Make sure it is correct before running the above command!

# How to use it?
It's as simple as this:
- Start your Raspberry Pi 3 with the flashed microSD card.
- Connect to a astroberry wireless network (default password is astroberry)
- Point your browser to http://astroberry.local and follow the instructions to install security certificate
- Point your browser to https://astroberry.local/desktop/ to access Astroberry Server
- Have fun

# How to update and upgrade
Run astroberry-update for checking new system version and updating vital system components. Next run astroberry-upgrade to upgrade the system to the latest version.

The above procedure updates only Astroberry Server components and works independently from regular operating system update and upgrade.

To upgrade your operating system run apt-get, aptitude or Software Updater.

# How to reconfigure it?
You can use it as any Ubuntu system, however there are some mission critical parameters to be configured by
embedded scripts i.e.
- astroberry-update - to update Astroberry Server scripts
- astroberry-upgrade - to upgrade Astroberry Server version
- aprename - to change access point name from astroberry to whatever you want
- appass - to change password to your astroberry access point
- wlanconf - to configure and connect Astroberry Server to your home wireless network
- wlanconf-gui - to configure and connect Astroberry Server to your home wireless network in GUI (available in menu and on the Ubuntu Mate taskbar)

# What is default username and password?
It's always astroberry:
- For SSH access run: ssh astroberry@astroberry.local
- For VNC access use astroberry.local:5900 for server and astroberry for username and password
- For your browser access use https://astroberry.local for server and astroberry for password

In case of any issue accessing astroberry.local just use 192.168.10.1 after connecting to astroberry access point or
your home network access after connecting to your wireless home network.

# Issues
File any issues on https://github.com/rkaczorek/astroberry-server
