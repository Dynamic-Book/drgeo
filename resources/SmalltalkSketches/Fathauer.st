| canvas tile alfa beta  A  B C O |
canvas _ DrGeoSketch new.
alfa _ canvas freeValue: -1.047.
beta _ canvas freeValue: 2.094.
tile _ [ ].
tile _ [ :a :b :k | | s sb c bc apar bperp f d e g|
	canvas segment: a to: b .
	s _ (canvas rotate: a center: b angle: alfa) hide.
	sb _ (canvas line: s to: b) hide.
	c _ (canvas reflect: a axis: sb) hide.
	bc _ (canvas segment: b to: c) hide.
	apar _ (canvas parallel: bc at: a) hide.
	bperp _ (canvas perpendicular: bc at: b) hide.
	f _ (canvas intersectionOf: apar and: bperp) hide.
	d _ (canvas reflect: f axis: sb) hide.
	e _ (canvas middleOf: a and: c) hide.
	canvas segment: c to: d.
	canvas segment: d to: e.
	canvas segment: e to: f.
	canvas segment: f to: a.
	g _ (canvas rotate: f center: a angle: beta) hide.
	k > 0 ifTrue: [ 
		tile value: g value: a value: k - 1.
		tile value: f value: e value: k - 1.
		tile value: d value: c value: k - 1]
].

A _ (canvas point: -3@0) lock.
B _ (canvas point: 3@0) lock.
C _ (canvas point: 0@(3 * 3 sqrt)) lock.
O _ (canvas point: 0@3 sqrt) lock.
canvas ray: O to: A.
canvas ray: O to: B.
canvas ray: O to: C.

tile value: A value: O value: 3.
tile value: B value: O value: 3.
tile value: C value: O value: 3
