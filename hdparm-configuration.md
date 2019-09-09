## Configure the HDD standby timeout

### To enable hdparm config on boot
1. Install package `hdparm` 
1. Create new file `/etc/udev/rules.d/69-hdparm.rules`
1. Add `ACTION=="add", SUBSYSTEM=="block", KERNEL=="sda", RUN+="/usr/bin/hdparm -B 128 -S 72 /dev/sda"`

### To re-enable hdparm config after suspend
1. Create new file `/usr/lib/systemd/system-sleep/hdparm`
1. Add this command

	```
		#!/bin/sh
		case $1 in post)
	    	    /usr/bin/hdparm -B 128 -S 72 /dev/sda
	        	;;
		esac
	```
1. Run `sudo chmod a+x` on that file to make the file executable

Reference : [Arch Wiki](https://wiki.archlinux.org/index.php/Hdparm)
