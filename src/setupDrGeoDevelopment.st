| world area morph extent |
"Report by any mean error"
Transcript
   showOnDisplay: false;
   logToFile: true;
   logToStdout: true.
"Smalltalk at: #LogStartupDebugAids put: true."
"Install change set"
ChangeSet installNewUpdates.
"System configurations"
Utilities setAuthorName: 'Hilaire Fernandes' initials: 'hlsf'.
Preferences at: #logDebuggerStackToFile put: true.
Preferences at: #autoNumberUserChanges put: false.
"Install DrGeo code"
Feature require: #'DrGeo'.
Feature require: #'DrGeoFrench'.
"Morphic operation, to handle with care"
world := UISupervisor ui.
[
	(Delay forSeconds: 1) wait.
	UISupervisor whenUIinSafeState: [
		(world submorphs reject: [:aMorph | aMorph is: #TaskbarMorph])
			do: [:each | each delete].
		"Adjust font size"
		Preferences at: #defaultFontSize put: 10.
		"Adjust taskbar size"
		morph := world taskbar.
		morph scale: 1/2.
		Display fullScreenMode: true.
		"Compute the available free space for windows placement"
		area := RealEstateAgent maximumUsableArea extendBy: 0 @ morph morphHeight negated.
		extent := area extent // 2.
		"Open a few System Browsers"
		Browser open 
			morphPosition: 0@0;
			morphExtent: extent.
		Browser open 
			morphPosition: area width // 2 @ 0; 
			morphExtent: extent.
		"Open a System Browser on a specific class"
		morph := Browser open 
			morphPosition: area extent // 2;
			morphExtent: extent.
		morph model setClass: (Smalltalk at: #DrGeo) selector: nil.
		"Open a Workspace with some default contents"
		morph := Workspace open.
		morph model actualContents: 'ChangeSet installNewUpdates.
DrGeoSystem beDevelopment.
DrGeoSystem beWorkstation.
DrGeo new.
NaturalLanguageTranslator privateStartUp .
TextDomainManager registerCategoryPrefix: ''DrGeo'' domain: ''drgeo''.
TextDomainManager allKnownDomains.
DrGSmalltalkSketchBrowser open: DrGeoSystem smalltalkSketchesPath label: ''Browse''.
DrGSmalltalkSketchEditor open: ''DrGeoSketch new'' label: ''Edit Smalltalk Sketch''.
PreferenceBrowser open: DrGeoSystem preferences label: ''Dr. Geo Preferences''.
Smalltalk browseAllSelect: [:m| m pragmas anySatisfy: [:p | p key = #drgeosettings]].
GetTextExporter exportTemplate.'.
		morph 
			morphPosition: 0 @ (area height // 2);
			morphExtent: extent x @ (2 / 3 * extent y).
		"Open a transcript for logs"
		TranscriptWindow openTranscript 
			morphPosition: 0 @ (area height // 2 + (2 / 3 * extent y));
			morphExtent: extent x @ (1 / 3 * extent y ).
		Smalltalk saveImage ]
] fork
