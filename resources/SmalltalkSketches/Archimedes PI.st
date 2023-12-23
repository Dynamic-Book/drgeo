| sketch polygon sides piText radius |
sketch _ DrGeoSketch new.
radius _ 5.
sketch circleCenter: 0@0 radius: radius.
sides _ sketch freeValue: 3.
polygon _ sketch regularPolygonCenter: 0@0 vertex: radius@0  sides: sides.
polygon unfilled.
piText _ sketch text: '' at: 0@0.
sketch do: [
	4 to:  500 do: [: i | |digit delta approx fraction|
		approx _ polygon mathItem length / (2 * radius).
		delta _ Float pi - approx.
		digit _ 10 raisedTo: delta abs log asInteger abs.
		fraction _ (approx * digit) asInteger / digit.
		sides value: i.
		piText text: 'Approximation PI (',i printString,' sides): ' , approx printString, '
', fraction printString.
		sketch update.
		(Delay forMilliseconds: (i > 20 ifTrue: [0] ifFalse: [500])) wait]
]
