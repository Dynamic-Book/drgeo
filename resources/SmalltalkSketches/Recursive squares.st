| sketch  build computePoints|
sketch  DrGeoSketch new.
sketch centerTo: 1@0; scale: 200.

computePoints  [: pointA  :pointB | { (pointA * 2 + pointB) / 3 . (pointB * 2 + pointA) / 3 } ].

build  [  ].
build  [ :square :depth | | vertices points resultsA resultsB nextSquares shake |
	depth > 0 ifTrue: [ 
		vertices  square mathItem points.
		"compute the sub points coordinates"
		points  OrderedCollection new.
		" raw 1 "
		points addAll: (computePoints value: vertices first value: vertices second).
		" raw 2 "
		resultsA  computePoints value: vertices first value: vertices fourth.
		resultsB  computePoints value: vertices second value: vertices third.
		points 	add: resultsA first;
			addAll: (computePoints value: resultsA first value: resultsB first);
			add: resultsB first.
		" raw 3 "
		points add: resultsA second;
			addAll: (computePoints value: resultsA second value: resultsB second);
			add: resultsB second.
		" raw 4 "
		points addAll: (computePoints value: vertices fourth value: vertices third).
		"Shake these points a bit "
		shake := [ ((10 * depth) atRandom - (5 * depth)) / 500 ].
		points := points collect: [:aPoint | aPoint +  (shake value @ shake value)].
		"compute the sub squares"	
		nextSquares  OrderedCollection new.
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
	value: 3.
sketch
