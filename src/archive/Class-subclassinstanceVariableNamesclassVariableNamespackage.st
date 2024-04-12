'From Cuis6.3 [latest update: #6319] on 12 April 2024 at 11:43:56 am'!

!Class methodsFor: '*DrGeo-subclass creation' stamp: 'hlsf 4/18/2020 21:29:40'!
subclass: t instanceVariableNames: f classVariableNames: d package: cat
"This is a hack to import DrGeo Pharo code"
	
	| answer |
	answer := ClassBuilder new
		superclass: self
		subclass: t
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: nil
		category: cat.
		
	Smalltalk
		logChange: answer definition 
		preamble: answer definitionPreamble.
	^answer
! !
