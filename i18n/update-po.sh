#!/bin/sh

# OBSOLETE, done by the Launchpad service

cd po

lang="ar ast ca ca@valencia cs da de en_GB eo es fi fr hy ia it ja ko lt nl pl pt pt_BR ro ru sk sv ta te th tr ug uk uz vi zh_CN zh_TW"

for l in $lang; do
    msgmerge -U $l.po drgeo.pot
#    msgmerge -U $l-cuis.po cuis.pot
done

cd -
