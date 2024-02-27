#!/bin/bash

# Uncomment for composed key-in input
#COMPO="-compositioninput"

# Path
ROOT=`readlink -f $(dirname $0)`
APP=`dirname "$0"`
APP=`cd "$APP";pwd`
VM="$APP/VM/Linux-x86_64"
RESOURCES="$APP/Resources"

image="$RESOURCES/image/drgeo"
NB_ARG=$#

# Icon (note: gvfs-set-attribute is found in gvfs-bin on Ubuntu
# systems and it seems to require an absolute filename)
gvfs-set-attribute \
	"$0" \
	"metadata::custom-icon" \
	"file://$RESOURCES/icons/drgeo.png" \
	2> /dev/null


# Help
drgeoHelp () {
    echo "$1"
    echo "Usage: DrGeo.sh [--sketch file] [--script file]"
}

makeAbsolute () {
    if [[ "${1:0:1}" == "/" ]] 
    then
	filename="$1"
    else
	filename=`pwd`"/$1"
    fi
}

# Do we have any Dr. Geo option to give to the image
# $1 option
# $2 arg. (filename)
drgeoOption () {
    makeAbsolute "$2"
    case "$1" in
	--sketch) 
	    if test -n "$2" 
	    then
		DRGEO_OPT="drgeo --sketch="
	    else
		drgeoHelp "Error: missing filename for sketch."
		exit
	    fi
	    ;;
	--script)
	    if test -n "$2" 
	    then
		DRGEO_OPT="drgeo --script="
	    else
		drgeoHelp "Error: missing filename for Smalltalk script."
		exit
	    fi
	    ;;
	*) 
	    if test "$NB_ARG" -eq 0
	    then
		DRGEO_OPT=
		filename=
	    elif test "$NB_ARG" -eq 1
	    then
		makeAbsolute "$1"
		DRGEO_OPT="drgeo --sketch="
	    else
		drgeoHelp "Unknow option $1."
		exit
	    fi
	    ;;
    esac
}


drgeoOption "$1" "$2"
echo $DRGEO_OPT"$filename"

# execute
exec "$VM/squeak" $COMPO \
    --plugins "$VM" \
    --encoding utf-8 \
    -vm-display-X11 \
    --title "GNU Dr. Geo" \
    "$image" \
    -d "Smalltalk at: #home put: '$HOME' asDirectoryEntry"
    $DRGEO_OPT"$filename"


    
