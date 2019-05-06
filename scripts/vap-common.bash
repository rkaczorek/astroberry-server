#!/bin/bash
#
# astroberry virtual access point configuration functions
# Author: Geordan Rosario, geordan AT google DOT com
# License: GPL 3.0

REVISION=$(grep Revision /proc/cpuinfo |awk -F: '{print $2}'|sed 's/\ //')

# take only 6 significant characters from right
REVISION=${REVISION:(-6)}

get_hostapd_conf_path() {
	if [ "$REVISION" == "a02082" ] || [ "$REVISION" == "a32082" ] || [ "$REVISION" == "a52082" ]; then # Raspberry Pi 3B
		VAPCONF="/etc/hostapd/hostapd_3b.conf"
	elif [ "$REVISION" == "a020d3" ]; then
		VAPCONF="/etc/hostapd/hostapd_3bplus.conf" # Raspberry Pi 3B+
	else
		VAPCONF="/etc/hostapd/hostapd.conf"
	fi
}
