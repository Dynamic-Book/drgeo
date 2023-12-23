'From Cuis 6.0 [latest update: #5448] on 16 August 2022 at 12:00:54 pm'!
'Description '!
!provides: 'DrGeoTablet' 1 1!
!requires: 'DrGeo' 1 430 nil!
SystemOrganization addCategory: 'DrGeoTablet'!


!classDefinition: #DrGTablet category: 'DrGeoTablet'!
DrGPlatform subclass: #DrGTablet
	instanceVariableNames: 'wheelHeight'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DrGeoTablet'!
!classDefinition: 'DrGTablet class' category: 'DrGeoTablet'!
DrGTablet class
	instanceVariableNames: ''!

!classDefinition: #DrGAndroid category: 'DrGeoTablet'!
DrGTablet subclass: #DrGAndroid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DrGeoTablet'!
!classDefinition: 'DrGAndroid class' category: 'DrGeoTablet'!
DrGAndroid class
	instanceVariableNames: ''!

!classDefinition: #DrGiPad category: 'DrGeoTablet'!
DrGTablet subclass: #DrGiPad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DrGeoTablet'!
!classDefinition: 'DrGiPad class' category: 'DrGeoTablet'!
DrGiPad class
	instanceVariableNames: ''!


!DrGTablet commentStamp: '' prior: 0!
Preferences common to tablets!

!DrGAndroid commentStamp: '' prior: 0!
Preferences for Android tablet!

!DrGiPad commentStamp: '' prior: 0!
Preferences for iPad tablet!

!DrGTablet methodsFor: 'initialize-release'!
reset
	super reset.
	wheelHeight _ nil! !

!DrGTablet methodsFor: 'initialize-release' stamp: 'hlsf 4/10/2022 15:04:23'!
startUp
	super startUp.
	self splash.
	(WorldMorph submorphs anySatisfy: [:morph | morph class == DrGeoView]) ifFalse:
		[DrGeo newFullscreen]! !

!DrGTablet methodsFor: 'user interface'!
wheelHeight
	^ wheelHeight ifNil: [ |maxWheelHeight|
		maxWheelHeight _ (Display height - (3.4 * self toolbarIconSize) - 32 - self wheelWidth) // 2.
		wheelHeight _ 180 min: maxWheelHeight]! !

!DrGTablet methodsFor: 'user interface'!
wheelWidth
	^ 55! !

!DrGTablet methodsFor: 'font'!
canvasFontSize
	^ 12! !

!DrGTablet methodsFor: 'font'!
setFontPreferences
	StandardFonts codeFont: (LogicalFont familyName: DrGeoSystem fontName  pointSize: 12).
	StandardFonts listFont: (LogicalFont familyName: DrGeoSystem fontName  pointSize: 14).
	StandardFonts menuFont: (LogicalFont familyName: DrGeoSystem fontName pointSize: 14).
	StandardFonts windowTitleFont: (LogicalFont familyName: DrGeoSystem fontName pointSize: 14).
	StandardFonts balloonFont: (LogicalFont familyName: DrGeoSystem fontName  pointSize: 12).
	StandardFonts haloFont: (LogicalFont familyName: DrGeoSystem fontName  pointSize: 12).
	StandardFonts buttonFont: (LogicalFont familyName: DrGeoSystem fontName  pointSize: 16).
	StandardFonts defaultFont: (LogicalFont familyName: DrGeoSystem fontName  pointSize: 14).
! !

!DrGAndroid methodsFor: 'initialize-release' stamp: 'hlsf 4/21/2020 21:32:20'!
initialize
	canWeDisplaySpinner _ true.
	WorldState desktopMenuTitle: 'Dr. Geo'.
	WorldState desktopMenuPragmaKeyword:  'drgeoMenu'.
	PolymorphSystemSettings uiThemeClass:  DrGeoTheme.
	UITheme currentSettings fastDragging: true.
	UITheme currentSettings fadedBackgroundWindows: false.
	SystemWindow fullscreenMargin: 0.
	UITheme currentSettings preferRoundCorner: false.

	TaskbarMorph showTaskbar: false.
	World color: Color white.! !

!DrGAndroid methodsFor: 'initialize-release'!
startUp 
	super startUp.
	(Smalltalk at: #Android) setVMTimerInterval: 100! !

!DrGAndroid methodsFor: 'user interface'!
showVirtualKeyboard: boolean
	(Smalltalk at: #Android) onScreenKbd: (boolean ifTrue: [1] ifFalse: [0])! !

!DrGAndroid methodsFor: 'user interface'!
toolbarIconSize
	toolbarIconSize
		ifNil: [ toolbarIconSize _ (Display height - 110) / 12 truncateTo: 4.
			toolbarIconSize _ toolbarIconSize min: 48 max: 12].
	^ toolbarIconSize! !

!DrGAndroid methodsFor: 'path'!
mySketchesPath
	^ ((Smalltalk at: #Android) getSDCardRoot), '/MySketches'.! !

!DrGAndroid methodsFor: 'path' stamp: 'hlsf 6/8/2021 19:43:02'!
rootPath
	^  DirectoryEntry smalltalkImageDirectory! !

!DrGAndroid methodsFor: 'testing'!
isAndroid
	^ true! !

!DrGiPad methodsFor: 'initialize-release' stamp: 'hlsf 4/21/2020 21:32:20'!
initialize
	canWeDisplaySpinner _ true.
	WorldState desktopMenuTitle: 'Dr. Geo'.
	WorldState desktopMenuPragmaKeyword:  'drgeoMenu'.

	PolymorphSystemSettings uiThemeClass:  DrGeoTheme.
	UITheme currentSettings fastDragging: true.
	UITheme currentSettings fadedBackgroundWindows: false.
	SystemWindow fullscreenMargin: 0.
	UITheme currentSettings preferRoundCorner: false.

	TaskbarMorph showTaskbar: false.
	World color: Color white.
"	HostWindowProxy basicNew primitiveWindowSize: 1	x: 1024	y: 768. " "does not work when building from Linux"
"	World doOneCycleNow.
	DrGeo new view extent: 1024@768; position: 0@0."! !

!DrGiPad methodsFor: 'initialize-release'!
startUp
	GetTextTranslator userDefaultLocaleDirs add: self localePath.
	NaturalLanguageTranslator privateStartUp.
	super startUp.
! !

!DrGiPad methodsFor: 'as yet unclassified'!
openURI: aString
	| sharedApp nsUrl |
	sharedApp _ ((Smalltalk at: #ObjectiveCBridge) classObjectForName: #UIApplication) sharedApplication.
	nsUrl _ (Smalltalk at: #ObjectiveCBridge) classObjectForName: #NSURL.
	sharedApp openURL: (nsUrl URLWithString: aString asNSStringUTF8).
	
	"(ObjectiveCBridge  classObjectForName: #UIApplication) sharedApplication 
		openURL: ((ObjectiveCBridge classObjectForName: #NSURL) URLWithString: 'http://www.drgeo.eu' asNSStringUTF8)"! !

!DrGiPad methodsFor: 'testing'!
isiPad
	^ true! !

!DrGiPad methodsFor: 'path'!
localePath
	^ self rootPath / 'locale'! !

!DrGiPad methodsFor: 'path'!
mySketchesPath
	| path |
	path _ self sandboxPath asFileReference / 'MySketches'.
	^path fullName
! !

!DrGiPad methodsFor: 'path' stamp: 'hlsf 6/8/2021 19:43:33'!
rootPath
	^ DirectoryEntry smalltalkImageDirectory! !

!DrGiPad methodsFor: 'path'!
sandboxPath
	| path |
	path _ self rootPath  parent / 'Documents'.
	path ensureDirectory.
	^path fullName! !

!DrGiPad methodsFor: 'user interface'!
showVirtualKeyboard: boolean
	(Smalltalk at: #IPhonePlatform) showKeyboard: boolean! !

!DrGiPad methodsFor: 'user interface'!
toolbarIconSize
	^ 40! !

!DrGeoSystem class methodsFor: '*DrGeoTablet'!
beAndroid
	"self beAndroid"
	platform _ DrGAndroid new.
	self addStartUp! !

!DrGeoSystem class methodsFor: '*DrGeoTablet'!
beiPad
	"self beiPad"
	platform _ DrGiPad new.
	self addStartUp! !
