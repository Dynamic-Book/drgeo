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
cuisVersion=`cat drgeo/cuisVersion`
smalltalk=Cuis$cuisVersion
smalltalkSources=Cuis$cuisVersion.sources

# To build Dr. Geo we need:
# A Cuis image, its source, the virtual machine,
# the Smalltalk installation script and the DrGeo source

# Path
imagePath=./CuisImage
drgeoRepo=./drgeo
buildPath="$drgeoRepo/build"
bundlesPath="$buildPath/bundles"
src="$drgeoRepo/src"
resources="$drgeoRepo/resources"
fonts="ipaexg.ttf WenQuanYiZenHeiSharpRegular.ttf"

vmExec=CuisVM.app/Contents/Linux-x86_64/squeak
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

makeBundle () {
    # $1 OS target (gnulinux windows mac)
    # clean up the bundle space
    mkdir $bundlesPath
    bundlePath="$bundlesPath/$1"
    bundleTemplate="$buildPath/bundleTemplates/$1"

    case "$1" in
	gnulinux)
	    bundleApp="$bundlePath/DrGeo"
	    cuisVM="CuisVM.app/Contents/Linux-x86_64"
	;;
	windows)
	    bundleApp="$bundlePath/DrGeo"
	    cuisVM="CuisVM.app/Contents/Windows-x86_64"
	;;
	mac)
	    bundleApp="$bundlePath/DrGeoApp"
	    cuisVM="$bundlePath/MacOS"
	;;
    esac
    bundleResources="$bundleApp/Resources"
    # INSTALL BUNDLES...
    rm -rf $bundlePath
    # ...template
    rsync -a --exclude '.bzr' --exclude '*~' $bundleTemplate $bundlesPath
    # ...sketches files
    rsync -a --exclude '.bzr' "$resources/Sketches" $bundleResources
    # ...smalltalk sketches files
    rsync -a --exclude '.bzr' "$resources/SmalltalkSketches" $bundleResources
    # ...user sketches and exports folder, graphics
    mkdir $bundleResources/MySketches
    mkdir $bundleResources/MyExports
    rsync -a $resources/graphics/banner/splash.bmp $bundleResources/icons
    rsync -a $resources/graphics/iconsSVG/* $bundleResources/icons
    # ...vm
    rsync -a $cuisVM/* $bundleApp/VM
    # ...smalltalk image
    rsync -a $imagePath/drgeo.{image,changes} $bundleResources/image
    # ...smalltalk source
    rsync -a $imagePath/$smalltalkSources $bundleResources/image
    # ...fonts
    mkdir $bundleResources/fonts/
    for each in $fonts
    do
	rsync -a $resources/fonts/$each $bundleResources/fonts
    done
    # ...locales
    rsync -a "$drgeoRepo/i18n/locale" $bundleResources/image
    # ...doc
    cp $resources/doc/ChangeLog $bundleApp
    mkdir $bundleResources/doc
    cp $resources/doc/README.*.txt $resources/doc/README.txt $bundleResources/doc
    # set exec flag
    case "$1" in
	gnulinux)
	    chmod +x $bundleApp/DrGeo.sh
	    chmod +x $bundleApp/VM/squeak
	    ;;
	mac)
	    chmod +x $bundleApp/VM/squeak
	    ;;
    esac

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
	echo -e "--build\t\t\t\t\tBuild Dr. Geo image"
	echo -e "--package all|gnulinux|windows|mac\tPackage Dr.Geo with an already built image"
	echo -e "--all\t\t\t\t\tBuild image and package for all OS"
	echo -e "--copy\t\t\t\t\\tCopy a built image to an existing gnulinux bundle"
	;;
esac
