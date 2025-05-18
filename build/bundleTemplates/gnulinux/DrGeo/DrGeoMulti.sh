#!/bin/bash

# Start-up script when DrGeo is installed in a read only direction
# (e.g. /opt). This script is to be used in a multi-user environment.
# For a given user, at the inital start-up, the image is copied in the
# user space in a MyDrGeo directory


# Path to user data and Smalltalk image in HOME directory
USERDATA="Documents/myDrGeo"

# Uncomment for composed key-in input
#COMPO="-compositioninput"

# Path
ROOT=`readlink -f $(dirname $0)`
APP=`dirname "$0"`
APP=`cd "$APP";pwd`
VM="$APP/VM/Linux-x86_64"
RESOURCES="$APP/Resources"

stockImage="$RESOURCES/image"
userImage="$HOME/$USERDATA/Resources/image"

# Does the USERDATA folder exist, if no create it and populate it"
if ! [ -f $userImage/drgeo.image ];
then
    mkdir -p $userImage
    cp -f $stockImage/drgeo.* $userImage
    ln -s $stockImage/Cuis*.sources $userImage
    ln -s $stockImage/locale $userImage
fi


# Icon (note: gvfs-set-attribute is found in gvfs-bin on Ubuntu
# systems and it seems to require an absolute filename)
	
gio set -t string \
    "$0" \
    "metadata::custom-icon-name" \
    "file://$RESOURCES/icons/drgeo.png" 
	
# execute
exec "$VM/squeak" $COMPO \
    --plugins "$VM" \
    --encoding utf-8 \
    -vm-display-X11 \
    --title "GNU Dr. Geo" \
    "$userImage/drgeo" \
    -d "Smalltalk at: #userPath put: '$HOME/$USERDATA' asDirectoryEntry" \
    -d "Smalltalk at: #rootPath put: '$APP' asDirectoryEntry" \
    -ud "$HOME/$USERDATA/Resources"



    
