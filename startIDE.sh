#!/bin/bash
#
# Start DrGeo IDE
#

# Cuis Version release
# When dealing with rolling versions numbers of Cuis
# release=`ls Cuis6.0-????.image | cut -d - -f 2 | cut -d . -f 1`
# Stable release, number is stable
cuisVersion=`cat drgeo/cuisVersion`
imageFolder=CuisImage
cuis=Cuis$cuisVersion
ide=drgeoIDE
VM=./RunCuisOnLinux.sh
VM=CuisVM.app/Contents/Linux-x86_64/squeak

# Install image for DrGeo IDE
cd $imageFolder
rm $ide.image $ide.changes $ide.user.* *.log
cp $cuis.image $ide.image
cp $cuis.changes $ide.changes
cd -

$VM $imageFolder/$ide -s drgeo/src/setupDrGeoDevelopment.st 
