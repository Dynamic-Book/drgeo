#!/bin/bash
#
# Build DrGeo image and package bundle
#
# Link the drgeo repository in the Cuis release folder.
# Execute the script from Cuis release folder.
# If necessary, in the Path section below, adjust drgeoRepo, vmExec variables.
# Adjust below the rel variable to the wished Dr. Geo release number

# DrGeo release number
rel="25.06b-beta"

# Path
drgeoRepo=./drgeo
buildPath="$drgeoRepo/build"
bundlesPath="$buildPath/bundles"
src="$drgeoRepo/src"
resources="$drgeoRepo/resources"
imagePath=./CuisImage

# Cuis release
release=`cat drgeo/cuisRelease`
# version number, when dealing with rolling release
version=`ls $imagePath/Cuis$release-????.image | cut -d - -f 2 | cut -d . -f 1`
if [ -z "$version" ]
then
    smalltalk=Cuis$release
else
    smalltalk=Cuis$release-$version	
fi
smalltalkSources=`ls CuisImage/Cuis?.?.sources | cut -d / -f2`

# To build Dr. Geo we need:
# A Cuis image, its source, the virtual machine,
# the Smalltalk installation script and the DrGeo source

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
    cuisVMPath="CuisVM.app/Contents"
    case "$1" in
	gnulinux)
	    bundleApp="$bundlePath/DrGeo"
	    cuisVM="Linux-x86_64"
	    destVM="VM"
	;;
	windows)
	    bundleApp="$bundlePath/DrGeo"
	    cuisVM="Windows-x86_64"
	    destVM="VM"
	;;
	mac)
	    bundleApp="$bundlePath/DrGeo.app"
	    cuisVM="MacOS Resources"
	    # Subfolder Resources to be considered as well
	    destVM="Contents"
	;;
    esac
    bundleResources="$bundleApp/Resources"
    echo "Cleaning previous bundles build..."
    rm -rf $bundlePath
    echo "Installing template..."
    rsync -a  --exclude '*~' $bundleTemplate $bundlesPath
    echo "Installing sketches files..."
    rsync -a "$resources/Sketches" $bundleResources
    echo "Installing Smalltalk sketches files..."
    rsync -a "$resources/SmalltalkSketches" $bundleResources
    echo "Installing user sketches and exports folder, graphics..."
    mkdir $bundleResources/MySketches
    mkdir $bundleResources/MyExports
    rsync -a $resources/graphics/banner/splash.png $bundleResources/icons
    rsync -a $resources/graphics/iconsSVG/* $bundleResources/icons
    echo "Installing OpenSmalltalk VM..."
    for i in $cuisVM
    do
	rsync -a $cuisVMPath/$i $bundleApp/$destVM/
    done
    echo "Installing Smalltalk image and changes..."
    rsync -a $imagePath/drgeo.{image,changes} $bundleResources/image
    echo "Installing Smalltalk source..."
    rsync -a $imagePath/$smalltalkSources $bundleResources/image
    echo "Installing fonts..."
    mkdir $bundleResources/fonts/
    for each in $fonts
    do
	rsync -a $resources/fonts/$each $bundleResources/fonts
    done
    echo "Installing locales..."
    rsync -a "$drgeoRepo/i18n/locale" $bundleResources/image
    echo "Installing documentation..."
    cp $resources/doc/ChangeLog $bundleApp
    mkdir $bundleResources/doc
    cp $resources/doc/README.*.txt $resources/doc/README.txt $bundleResources/doc
    echo "Set exec flag and any additional specific files installation..."
    case "$1" in
	gnulinux)
	    chmod +x $bundleApp/DrGeo.sh
	    chmod +x $bundleApp/VM/$cuisVM/squeak
	    ;;
	mac)
	    chmod +x $bundleApp/Contents/MacOS/Squeak
	    ;;
    esac

    echo "Preparing to build archive..."
    cd $bundlePath
    echo "Archiving the bundle..."
    zip -r --symlinks -qdgds 5m DrGeo-$1-$rel.zip "`basename $bundleApp`" -x \*~
    ls -sh DrGeo-$1-$rel.zip
    echo "--== DONE packaging DrGeo for $1 ==--"
    echo -n "Signing..."
    gpg --armor --sign --detach-sign DrGeo-$1-$rel.zip
    echo "...DONE."
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
