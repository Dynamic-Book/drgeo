'From Cuis 6.0 [latest update: #5435] on 4 August 2022 at 11:05:05 pm'!
'Description '!
!provides: 'Commander' 1 4!
SystemOrganization addCategory: 'Commander'!


!classDefinition: #CommandBuilder category: 'Commander'!
Object subclass: #CommandBuilder
	instanceVariableNames: 'cmdPragma commands model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Commander'!
!classDefinition: 'CommandBuilder class' category: 'Commander'!
CommandBuilder class
	instanceVariableNames: ''!

!classDefinition: #CommandRecord category: 'Commander'!
Object subclass: #CommandRecord
	instanceVariableNames: 'id order icon label target selector arguments help'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Commander'!
!classDefinition: 'CommandRecord class' category: 'Commander'!
CommandRecord class
	instanceVariableNames: ''!


!CommandBuilder commentStamp: '<historical>' prior: 0!
I build a group of commands (think menu) and possible sub-group of commands (think sub-menu). 
I collect the command data from class methods tagged with a given pragma.

- commands is a dictionnary where:
	- value:  is a sorted collection of CommandRecord instances describing a group of commands
	- key is the id (symbol) of the command group
	There is always a top level group of commands with the key #root.
	The key of a sub-group of commands is the 'id' of the parent CommandRecord (read newEntry:in:)
- model : a defaut model used for the command	. Eeach command record can provide its own model

Test the example:

(CommandBuilder on: #exampleCommand) getMenu popUpInWorld!

!CommandRecord commentStamp: 'hlsf 8/4/2022 22:37:14' prior: 0!
I am the record of a command.

- id: a symbol identifier
- order: a (possibly float) number, the lowest, the higher in the menu I am placed
- icon: a form or symbol (theme)
- label: a string, if nil id is used as default label
- target, selector, arguments: parameter to execute the command
- help: a long description of the command!

!CommandBuilder methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:31:26'!
commandMethods
" Select all the methods defining the menu records  we are interested in"
	^ Smalltalk allSelect: [:m | m pragmas anySatisfy: [:p | p key == cmdPragma ]]. 

! !

!CommandBuilder methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 23:06:03'!
model: aModel
	model _ aModel ! !

!CommandBuilder methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:19:42'!
pragma: aSymbol
	cmdPragma _ aSymbol asSymbol
! !

!CommandBuilder methodsFor: 'private' stamp: 'hlsf 7/23/2022 22:31:49'!
collectCommandRecords
	commands _ Dictionary new.
	self commandMethods do: [:method |
		method methodClass soleInstance 
			perform: method methodSymbol 
			with: self ].
	commands valuesDo: [:menuRecords | menuRecords reSort]! !

!CommandBuilder methodsFor: 'private' stamp: 'hlsf 7/23/2022 23:07:27'!
modelFor: aCmd
	^ aCmd target ifNil: [model]! !

!CommandBuilder methodsFor: 'private' stamp: 'hlsf 7/23/2022 22:32:13'!
newCommandRecordCollection
	^ SortedCollection sortBlock: [ :menuRec1 :menuRec2 | 		menuRec1 order < menuRec2 order]! !

!CommandBuilder methodsFor: 'command record creation' stamp: 'hlsf 7/23/2022 22:32:32'!
newEntry: aSymbol
" Create a new command record in the #root"
	^ self newEntry: aSymbol in: #root! !

!CommandBuilder methodsFor: 'command record creation' stamp: 'hlsf 7/23/2022 22:33:07'!
newEntry: aSymbol in: parentSymbol
" Create a new command record in the designated parent command and remember it in the appropriate collection "
	| commandCollection |
	commandCollection _ commands at: parentSymbol ifAbsentPut: [self newCommandRecordCollection].
	^ commandCollection add: (CommandRecord id: aSymbol)! !

!CommandBuilder methodsFor: 'menu' stamp: 'hlsf 7/23/2022 23:07:19'!
buildMenuFrom: menuId
" Build the menu and return it "
	| menu |
	menu _ MenuMorph new.
	(commands at: menuId) do: [:cmdRec | | menuItem |
		menuItem _ MenuItemMorph new.
		menuItem 
			contents: cmdRec label;
			setIcon: cmdRec icon;
			setBalloonText: cmdRec help;
			target: (self modelFor: cmdRec) selector: cmdRec selector arguments: cmdRec arguments.
		menu addMorphBack: menuItem.
		" is this cmd the parent of a sub group? "
		(commands 	includesKey: cmdRec id) ifTrue: [
			" then attach its sub-menu, do it recursively " 
			menuItem subMenu: (self buildMenuFrom: cmdRec id) ] ].
	^ menu
	! !

!CommandBuilder methodsFor: 'menu' stamp: 'hlsf 7/23/2022 23:02:06'!
getMenu
" Build the collected commands as a top level menu with sub-menus if any "
	self collectCommandRecords.
	^ self buildMenuFrom: #root! !

!CommandBuilder class methodsFor: 'instance creation' stamp: 'hlsf 7/14/2022 11:43:12'!
on: aPragmaKeyord
	^ self new ::
		pragma: aPragmaKeyord ! !

!CommandBuilder class methodsFor: 'instance creation' stamp: 'hlsf 7/23/2022 23:05:38'!
on: aPragmaKeyord with: aModel
	^ self new ::
		pragma: aPragmaKeyord;
		model: aModel! !

!CommandBuilder class methodsFor: 'examples' stamp: 'hlsf 8/4/2022 20:53:46'!
example1_1: menuBuilder
	<exampleCommand>
	menuBuilder newEntry: #entry1 ::
		label: 'Menu entry 1';
		icon: #worldIcon;
		target: Workspace; selector: #openWorkspace;
		order: 500.
	menuBuilder newEntry: #entry2 ::
		action: [BrowserWindow openBrowser];
		label: 'Menu entry 2';
		help: 'I can have help too';
		order: 100! !

!CommandBuilder class methodsFor: 'examples' stamp: 'hlsf 7/23/2022 22:59:15'!
example1_2: menuBuilder
	<exampleCommand>
	menuBuilder newEntry: #entry3 		in: #entry1 ::
		label: 'Menu entry 3';
		order: 1.
! !

!CommandBuilder class methodsFor: 'examples' stamp: 'hlsf 7/23/2022 22:59:21'!
example1_3: menuBuilder
	<exampleCommand>
	menuBuilder newEntry: #entry4 ::
		label: 'Menu entry 4';
		order: 1.
	menuBuilder newEntry: #'Just a drop place' in: #entry1
! !

!CommandBuilder class methodsFor: 'examples' stamp: 'hlsf 7/23/2022 22:59:24'!
example1_4: menuBuilder
	<exampleCommand>
	menuBuilder newEntry: #entry5 in: #'Just a drop place'::
		label: 'Menu entry 5'
! !

!CommandRecord methodsFor: 'initialization' stamp: 'hlsf 7/15/2022 16:22:12'!
initialize
	super initialize.
	menutItem _ MenuItemMorph new.
	order _ 1! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 8/4/2022 20:53:11'!
action: aBlock
" An alternate way to execute the command"
	target _ aBlock.
	selector _ #value.
	arguments _ nil! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:48:33'!
arguments
	^ arguments ! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:49:34'!
arguments: aCollection
	arguments _ aCollection
! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:50:18'!
help
	^ help! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:46:08'!
help: aString
	help _ aString ! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:47:46'!
icon
	^ icon! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:45:52'!
icon: aSymbolOrForm
	icon _ aSymbolOrForm ! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/15/2022 17:31:50'!
id
	^ id! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/14/2022 19:50:47'!
id: aSymbol
	id _ aSymbol ! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:47:40'!
label
	^ label! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:45:35'!
label: aString
	label _ aString ! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/15/2022 16:21:29'!
order
	^ order! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/14/2022 11:31:35'!
order: aNumber
	order _ aNumber ! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:48:26'!
selector
	^ selector ! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:49:10'!
selector: aSymbol 
	selector _ aSymbol! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:48:18'!
target
	^ target! !

!CommandRecord methodsFor: 'accessing' stamp: 'hlsf 7/23/2022 22:48:58'!
target: anObject
	target _ anObject! !

!CommandRecord methodsFor: 'printing' stamp: 'hlsf 7/15/2022 17:26:20'!
printOn: aStream
	super printOn: aStream.
	aStream 
		nextPut: $(;
		nextPutAll: id printString ;
		nextPutAll: ', order=';
		nextPutAll: order printString;
		nextPut: $)! !

!CommandRecord class methodsFor: 'instance creation' stamp: 'hlsf 7/14/2022 19:50:19'!
id: uniqueIndentifer
	^ self new ::
		id: uniqueIndentifer asSymbol;
		label: uniqueIndentifer asString;
		yourself! !
