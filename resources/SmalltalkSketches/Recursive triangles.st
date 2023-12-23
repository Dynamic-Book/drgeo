| sketch build |

sketch _ DrGeoSketch new .
sketch centerTo: 1@0; scale: 200.
build _ [  ].

build _ [ :triangle :depth| | vertrices middles nextTriangles|
	depth > 0 ifTrue: [ 
		(Delay forMilliseconds: 10) wait.
		vertrices _ triangle mathItem points.
		middles _ vertrices withIndexCollect: [:point : index | point + (vertrices atWrap: index + 1) / 2 ].
		sketch domain deleteMathItem: triangle mathItem.
		nextTriangles _ OrderedCollection new.
		nextTriangles 
			add: (sketch polygon: {vertrices  first.  middles first. middles third });
			add: (sketch polygon: {middles first. vertrices second. middles second});
			add: (sketch polygon: {middles third. middles second. vertrices third}).
		nextTriangles do: [ :aTriangle | build value: aTriangle value: depth - 1]
	]
 ].

build 
	value: (sketch polygon: { 0 @3 sqrt. 1@0 . -1@0})
	value: 6.
sketch.
