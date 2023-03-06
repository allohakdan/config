#!/bin/bash
# Sets the host name so it won't change
# Usage: ./sethostname.sh <myhostname>
echo "Setting host name to $1"
sudo scutil --set HostName $1
sudo scutil --set LocalHostName $1
sudo scutil --set ComputerName "$1"
