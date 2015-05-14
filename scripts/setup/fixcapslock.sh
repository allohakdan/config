#!/bin/bash
# Taken from http://askubuntu.com/a/223674

# To see all things you can set with options
# grep -E "(ctrl|caps):" /usr/share/X11/xkb/rules/base.lst

sudo sed -i.bak -E s/XKBOPTIONS.*/XKBOPTIONS=\"caps:escape\"/g /etc/default/keyboard
sudo dpkg-reconfigure keyboard-configuration
