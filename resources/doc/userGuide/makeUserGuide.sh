#!/bin/bash

lang="$1"
validLanguages="fr en"
htmlDest="drgeoHtml"
infoDest="drgeoInfo"
textDest="drgeoText"

chapters="Introduction BasicFunctionalities FilesAndDocuments Settings MacroConstruction SmalltalkScript SmalltalkFigure DidacticExamples AdvancedFunctionalities Tools"

imgPath="./figures/:./Introduction/figures:./BasicFunctionalities/figures:./FilesAndDocuments/figures/:./MacroConstruction/figures/:./SmalltalkScript/figures/:./SmalltalkFigure/figures/:./DidacticExamples/figures/:./Tools/figures/:./Settings/figures/"

function doPdf {
    cd $lang
    makeinfo -I $imgPath --pdf drgeo.texinfo
    cd -
    clean_all
}

function doText {
    cleanupDestination $textDest
    cd $lang
    texi2any --output=$textDest/ --transliterate-file-names --split=node \
	     --no-number-sections --plaintext drgeo.texinfo 
    cd -
}

function doInfo {
    prepareDestination $infoDest
    cd $lang
    makeinfo -I $imgPath --output=$infoDest/ drgeo.texinfo
    cd -
}

function doHtml {
    prepareDestination $htmlDest
    cp style.css $lang/$htmlDest
    cd $lang
    texi2any -I $imgPath --output=$htmlDest/ --html --css-ref=style.css drgeo.texinfo
    cd -
}

function cleanupDestination {
    # Clean up dest $1
    cd $lang
    rm -rf "$1"
    mkdir "$1"
    cd -
}
function prepareDestination {
    # Clean up dest $1 and copy all bitmaps there
    cleanupDestination "$1"
    cd $lang
    for dir in $chapters
    do
	if [ -d $dir/figures ]; then
	    cp $dir/figures/*.png "$1"
	fi
    done
    cp ./figures/*.png "$1"
    cd -
}

function package_html {
    doHtml
    cd $lang/$drgeoHtml
    tar cfz ../drgeo-html-$lang.tgz *
    cd -
}

function clean_all {
    cd $lang
    rm   *.log *.toc  *.aux  *.cp *.cps *.fn *.ky *.tp *.vr *.fns *.pg
    cd -
}

function checkForValidLanguage
{
okLang="0"
for valid in $validLanguages; do
    if [[ $lang = $valid ]]; then
	okLang="1"
    fi
done

if [[ $okLang = "0" ]]; then
    usage
    exit
fi
}


function usage {
    echo "Usage: $0 ($validLanguages) (txt|html|pdf|package|clean)"
}

checkForValidLanguage

case "$2" in 
    txt)
	echo "Build documentation in text."
	doText
	;;
    html) 
	echo 'Build documentation in html.'
	doHtml
	;;
    pdf)
	echo 'Build documentation in PDF.'
	doPdf
	;;
    info)
	echo 'Build documentation for Texinfo.'
	doInfo
	;;
    package)
	echo 'Build html documentation and archive it.'
	doHtml
	package_html
	;;
    clean)
	echo "Delete all the intermediate files."
	clean_all
	;;
    *)
	usage
	exit
esac
