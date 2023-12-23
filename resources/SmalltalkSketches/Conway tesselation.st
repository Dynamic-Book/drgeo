| canvas  triangle |
canvas _ DrGeoSketch new.
triangle _ [  ].
triangle _ [ :a :b :c :k | | ca m mn n bo o p|
	canvas segment: a to: b.
	canvas segment: b to: c.
	ca _ canvas segment: c to: a.
	m _ (canvas middleOf: a and: b) hide.
	mn _ (canvas perpendicular: ca at: m) hide.
	n _ (canvas intersectionOf: mn and: ca) hide.
	bo _ (canvas perpendicular: ca at: b) hide.
	o _ (canvas intersectionOf: bo and: ca) hide.
	p _ (canvas middleOf: b and: o)  hide.
	k > 0 ifTrue: [ 
		triangle value: a value: n value: m value: k - 1.
		triangle value: o value: n value: m value: k - 1.
		triangle value: m value: p value: o value: k - 1.
		triangle value: m value: p value: b value: k - 1.		
		triangle value: b value: o value: c value: k - 1]
	 ].
triangle 
	value: ((canvas point: -6@0) name: 'A') lock
	value: ((canvas point: 6@0) name: 'B') lock
	value: ((canvas point: 6@6) name: 'C') lock
	value: 3
