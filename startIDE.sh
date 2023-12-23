#!/bin/bash
#
# Start DrGeo IDE
#

# Cuis Version release
release=`ls Cuis6.0-????.image | cut -d - -f 2 | cut -d . -f 1`

cuis=Cuis6.0-$release
ide=drgeoIDE

rm $ide.image $ide.changes $ide.user.* *.log

cp $cuis.image $ide.image
cp $cuis.changes $ide.changes

../VM/squeak $ide -s drgeo/src/setupDrGeoDevelopment.st 
