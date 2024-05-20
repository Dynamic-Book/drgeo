| sketch f  ptA ptB middle ox|
sketch  DrGeoSketch new axesOn.
f  [ :x | x cos + (x * 1.1) ].

sketch plot: f from: -20 to: 20.
ox  (sketch line: 0@0 to: 1@0) lock hide.
ptA  sketch pointOnLine: ox at: 0.1.
ptA moveTo: 5@0; 
	large; 
	name: 'Drag me'.
ptB  sketch pointOnLine: ox at: -0.1.
ptB moveTo: -5@0; 
	large; 
	name: 'Drag me too'.
{ptA. ptB} do: [:each | each mathItem exist ifFalse: [ self halt ]].
1 to: 10 do: [ :index |
	middle  (sketch middleOf: ptA and: ptB) name: index printString.

	ptA  sketch point: [ :pt1 :pt2 |
		(f value: pt1 point x) sign = (f value: pt2 point x) sign
			ifTrue: [ pt2 point ] ifFalse: [ pt1 point]] parents: { ptA. middle }.
	ptB  sketch point: [ :pt1 :pt2 |
		(f value: pt1 point x) sign = (f value: pt2 point x) sign
			ifTrue: [ pt1 point ] ifFalse: [ pt2 point]] parents: {middle. ptB }].
sketch update.

