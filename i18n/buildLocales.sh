#!/bin/sh



PODIR="po"
MODIR="locale"

LANG="ar ast ca ca@valencia cs da de en_GB eo es fi fr hy ia it ja ko lt nl pl pt pt_BR ro ru sk sv ta te th tr ug uk uz vi zh_CN zh_TW"

# clean up
rm -rf $MODIR

# Compile .po files
#
for l in $LANG; do
    mkdir -p $MODIR/$l/LC_MESSAGES
    msgfmt $PODIR/$l.po -o $MODIR/$l/LC_MESSAGES/drgeo.mo
    msgfmt $PODIR/cuis/$l.po -o $MODIR/$l/LC_MESSAGES/cuis.mo
done

