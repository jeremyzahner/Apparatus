#!/bin/bash

############################################################################
#	Created by Jeremy "Jay" Zahner (@jeremyzahner)
#  
#	First Release
#
#	Version: 1.0.0
############################################################################

echo $'\n'"This Script was designed for use on a local Ubuntu (or similar Linux) Development Platform, DO NOT use it else where as it may break your system."

echo $'\n'"Enter full domain (for Example testdrive.local.dev, without www)"$'\n'

read domain


domaindir="$HOME/public_html/$domain"
archivedir="$HOME/public_html/x_Archiv"
apachesa="/etc/apache2/sites-available"
vhost="/etc/apache2/sites-available/$domain.conf"
apachearchive="$apachesa/X_Archiv"

# Disable the site
sudo a2dissite $domain

# Reload Apache2
echo $'\n'"RELOADING APACHE......."$'\n'

sudo service apache2 reload

# Remove DIR For Sub Domain
echo $'\n'"MOVING SUB DIRECTORY FOR '$domain' DEV SITE TO ARCHIVE"$'\n'
mv $domaindir $archivedir

# Move Vhost to Archive
mv $vhost $apachearchive

echo $'\n'"All done, thanks for using."$'\n'