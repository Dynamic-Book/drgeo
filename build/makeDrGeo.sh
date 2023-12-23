#!/bin/bash
#
# Build DrGeo image and package bundle
#
# Link the drgeo repository in the Cuis-Smalltalk-Dev folder.
# Execute the script from Cuis-Smalltalk-Dev folder.
# If necessary, in the Path section below, adjust drgeoRepo, vmExec variables.
# Adjust below the rel variable to the wished Dr. Geo release number

# DrGeo release number
rel="23.12a-beta"

# Smalltalk image version
release=`ls Cuis6.0-????.image | cut -d - -f 2 | cut -d . -f 1`
smalltalk="Cuis6.0-$release"
smalltalkSources="CuisV6.sources"

# To build Dr. Geo we need:
# A Cuis image, its source, the virtual machine,
# the Smalltalk installation script and the DrGeo source

# Path
imagePath="."
drgeoRepo="./drgeo"
buildPath="$drgeoRepo/build"
bundlesPath="$buildPath/bundles"
src="$drgeoRepo/src"
resources="$drgeoRepo/resources"
fonts="ipaexg.ttf WenQuanYiZenHeiSharpRegular.ttf"

vmExec="../VM/squeak"
installScript="$src/install-drgeo-workstation.st"



buildImage () {
    # INSTALL PACKAGE
    # prepare the drgeo image
    rm $imagePath/drgeo.*
    cp $imagePath/$smalltalk.image $imagePath/drgeo.image
    cp $imagePath/$smalltalk.changes $imagePath/drgeo.changes
    # install source code in the drgeo image and configure it
    $vmExec $imagePath/drgeo.image -s $installScript
    ls -lh $imagePath/drgeo.image
    echo "--== DONE building DrGeo image ==--"    
}

copyToBundle () {
    # copy a built image to an existing gnulinux bundle (for quick testing)
    bundlePath="$bundlesPath/gnulinux"
    bundleApp="$bundlePath/DrGeo"
    bundleResources="$bundleApp/Resources"
    rsync -av $imagePath/drgeo.{image,changes} $bundleResources/image
}

makeSource () {
    srcDest="$drgeoRepo/drgeo-$rel"
    rm -rf $srcDest
    mkdir -p $srcDest/resources/fonts  $srcDest/resources/doc
    mkdir -p $srcDest/resources/graphics $srcDest/resources/graphics/
    mkdir -p $srcDest/resources/graphics/banner $srcDest/build/bundles
    # Doc and ressources
    cp $resources/doc/ChangeLog $srcDest/resources/doc/
    rsync -a $resources/Sketches $resources/SmalltalkSketches $srcDest/resources/
    rsync -a $resources/graphics/iconsSVG $srcDest/resources/graphics/
    cp $resources/graphics/banner/splash.bmp $srcDest/resources/graphics/banner
    # Fonts
    for each in $fonts
    do
	rsync -a $resources/fonts/$each $srcDest/resources/fonts	
    done
    # Sources and build instruction
    rsync -a --exclude '.bzr' --exclude '*~' $src $drgeoRepo/i18n $srcDest
    rsync $drgeoRepo/install.txt $drgeoRepo/startIDE.sh $srcDest
    # Build
    rsync -a --exclude '.bzr' --exclude '*~' $drgeoRepo/build/vm  $drgeoRepo/build/makeDrGeo.sh $srcDest/build

    # Create an archive out of the bundle
    cd $srcDest/..
    rm drgeo-src-$rel.zip
    zip -r --symlinks -qdgds 5m drgeo-src-$rel.zip "`basename $srcDest`" -x \*/.bzr/* \*~
    ls -sh drgeo-src-$rel.zip
    echo "--== DONE packaging DrGeo source ==--"
    echo -n "Signing..."
    gpg --armor --sign --detach-sign drgeo-src-$rel.zip
    echo "...done."
    cd -
}


makeBundle () {
    # $1 OS target (gnulinux windows mac)
    # clean up the bundle space
    bundlePath="$bundlesPath/$1"
    if [[ "$1" == "gnulinux" || "$1" == "windows" ]]
    then
	bundleApp="$bundlePath/DrGeo"
    else
	bundleApp="$bundlePath/DrGeo.app"
    fi
    bundleResources="$bundleApp/Resources"
    bundleTemplate="$buildPath/vm/$1"
    
    rm -rf $bundlePath
    # install template
    rsync -a --exclude '.bzr' --exclude '*~' $bundleTemplate $bundlesPath
    cp $resources/doc/ChangeLog $bundleApp
    # install Sketches files
    rsync -a --exclude '.bzr' "$resources/Sketches" $bundleResources
    # install Smalltalk sketches files
    rsync -a --exclude '.bzr' "$resources/SmalltalkSketches" $bundleResources
    # user sketches and exports folder, splash
    mkdir $bundleResources/MySketches
    mkdir $bundleResources/MyExports
    rsync -a $resources/graphics/banner/splash.bmp $bundleResources/icons
    rsync -a $resources/graphics/iconsSVG/* $bundleResources/icons
    # rsync -a $resources/graphics/backgrounds $bundleResources/icons
    # install Smalltalk Image
    rsync -a $imagePath/drgeo.{image,changes} $bundleResources/image
    # install Smalltalk Source
    rsync -a $imagePath/$smalltalkSources $bundleResources/image
    # install fonts
    mkdir $bundleResources/fonts/
    for each in $fonts
    do
	rsync -a $resources/fonts/$each $bundleResources/fonts
    done
    # install the locales
    rsync -a "$drgeoRepo/i18n/locale" $bundleResources/image
    # install doc
    mkdir $bundleResources/doc
    cp $resources/doc/README.*.txt $resources/doc/README.txt $bundleResources/doc
    # set exec flag
    if [[ "$1" == "gnulinux" ]]
    then
	chmod +x $bundleApp/DrGeo.sh
	chmod +x $bundleApp/VM/squeak
    elif [[ "$1" == "mac" ]]
    then
	chmod +x $bundleApp/Contents/MacOS/squeak
    fi

    # Create an archive out of the bundle
    cd $bundlePath
    zip -r --symlinks -qdgds 5m DrGeo-$1-$rel.zip "`basename $bundleApp`" -x \*/.bzr/* \*~
    ls -sh DrGeo-$1-$rel.zip
    echo "--== DONE packaging DrGeo for $1 ==--"
    echo -n "Signing..."
    gpg --armor --sign --detach-sign DrGeo-$1-$rel.zip
    echo "...done."
    cd -
}

# Option
# Build image:
# $1 = --build
# Package from an already built image:
# $1 = --package , $2 = all | gnulinux | windows | mac
# Build image and package all bundles:
# $1 = --all
case "$1" in
    --source)
	makeSource
	;;
    --build)
	buildImage
	;;
    --package)
	case "$2" in
	    all)
		makeBundle "gnulinux"
		makeBundle "windows"
		makeBundle "mac"
		;;
	    gnulinux)
		makeBundle "gnulinux"
		;;
	    windows)
		makeBundle "windows"
		;;
	    mac)
		makeBundle "mac"
		;;
	    *)
		echo -e "Unknow \"$2\" --package argument.\nValid arguments are gnulinux, windows, mac."
		;;
	esac
	;;
    --all)
	buildImage
	makeBundle "gnulinux"
	makeBundle "windows"
	makeBundle "mac"	
	;;
    --copy)
	copyToBundle
	;;
    --help|*)
	echo "Usage: makeDrGeo [OPTION] [ARGUMENT]"
	echo
	echo -e "--source\t\t\t\tBuild an archive of Dr. Geo sources"
	echo -e "--build\t\t\t\t\tBuild Dr. Geo image"
	echo -e "--package all|gnulinux|windows|mac\tPackage Dr.Geo with an already built image"
	echo -e "--all\t\t\t\t\tBuild image and package for all OS"
	echo -e "--copy\t\t\t\t\\tCopy a built image to an existing gnulinux bundle"
	;;
esac
