| sketch  build computePoints|
sketch _ DrGeoSketch new.
sketch centerTo: 1@0; scale: 200.

computePoints _ [: pointA  :pointB | { (pointA * 2 + pointB) / 3 . (pointB * 2 + pointA) / 3 } ].

build _ [  ].
build _ [ :square :depth | | vertices points resultsA resultsB nextSquares|
	depth > 0 ifTrue: [ 
		vertices _ square mathItem points.
		"compute the sub points coordinates"
		points _ OrderedCollection new.
		" raw 1 "
		points addAll: (computePoints value: vertices first value: vertices second).
		" raw 2 "
		resultsA _ computePoints value: vertices first value: vertices fourth.
		resultsB _ computePoints value: vertices second value: vertices third.
		points 	add: resultsA first;
			addAll: (computePoints value: resultsA first value: resultsB first);
			add: resultsB first.
		" raw 3 "
		points add: resultsA second;
			addAll: (computePoints value: resultsA second value: resultsB second);
			add: resultsB second.
		" raw 4 "
		points addAll: (computePoints value: vertices fourth value: vertices third).
		sketch domain deleteMathItem: square mathItem.
		"compute the sub squares"	
		nextSquares _ OrderedCollection new.
		nextSquares 
			add: (sketch polygon: {vertices first. points first. points fourth . points third});
			add: (sketch polygon: {points first. points second. points fifth . points fourth});
			add: (sketch polygon: {points second . vertices second. points sixth . points fifth}).
		nextSquares 
			add: (sketch polygon: {points third . points fourth . points eighth . points seventh})	;
			add: (sketch polygon: {points fifth . points sixth . points at: 10. points ninth}).
		nextSquares 
			add: (sketch polygon: {points seventh . points eighth . points at: 11. vertices fourth});
			add: (sketch polygon: {points eighth . points ninth . points at: 12. points at: 11});
			add: (sketch polygon: {points ninth . points at: 10. vertices third . points at: 12}).
		nextSquares do: [:aSquare | build value: aSquare value: depth -1 ]
	]
 ].
build
	value: (sketch polygon: {-1@1 . 1@ 1 . 1@ -1. -1@ -1})
	value: 4.
sketch
