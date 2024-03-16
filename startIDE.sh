#!/bin/bash
#
# Start DrGeo IDE
#

imagePath=CuisImage
# Cuis release
release=`cat drgeo/cuisRelease`
# version number, when dealing with rolling release
version=`ls $imagePath/Cuis$release-????.image | cut -d - -f 2 | cut -d . -f 1`
cuis=Cuis$release-$version

ide=drgeoIDE
VM=CuisVM.app/Contents/Linux-x86_64/squeak

# Install image for DrGeo IDE
cd $imageFolder
rm $ide.image $ide.changes $ide.user.* *.log
cp $cuis.image $ide.image
cp $cuis.changes $ide.changes
cd -

$VM $imageFolder/$ide -s drgeo/src/setupDrGeoDevelopment.st 
