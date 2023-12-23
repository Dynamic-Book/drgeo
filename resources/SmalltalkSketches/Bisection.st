| sketch f  ptA ptB middle ox|
sketch _ DrGeoSketch new axesOn.
f _ [ :x | x cos + (x * 1.1) ].

sketch plot: f from: -20 to: 20.
ox _ (sketch line: 0@0 to: 1@0) lock hide.
ptA _ sketch pointOnLine: ox at: 0.1.
ptA moveTo: 5@0; 
	large; 
	name: 'Drag me'.
ptB _ sketch pointOnLine: ox at: -0.1.
ptB moveTo: -5@0; 
	large; 
	name: 'Drag me too'.
{ptA. ptB} do: [:each | each mathItem exist ifFalse: [ self halt ]].
1 to: 10 do: [ :index |
	middle _ (sketch middleOf: ptA and: ptB) name: index printString.

	ptA _ sketch point: [ :pts |
		(f value: pts first point x) sign = (f value: pts second point x) sign
			ifTrue: [ pts second point ] ifFalse: [ pts first point]] parents: { ptA. middle }.
	ptB _ sketch point: [ :pts |
		(f value: pts first point x) sign = (f value: pts second point x) sign
			ifTrue: [ pts first point ] ifFalse: [ pts second point]] parents: {middle. ptB }].
sketch update.

