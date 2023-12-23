| canvas branch alfa beta gamma delta|
canvas _ DrGeoSketch new.
alfa _ (canvas freeValue: 135 degreesToRadians) hide.
beta _ (canvas freeValue: 202.5 degreesToRadians) hide.
gamma _ (canvas freeValue: 68.5 degreesToRadians ) hide.
delta _ (canvas freeValue: 157.5 degreesToRadians ) hide.
branch _ [  ].
branch _ [ :a :b :k | | m  c d e f g h |
	m _ (canvas middleOf: a and: b) hide.
	canvas segment: a to: m.
	canvas segment: m to: b.
	""
	c _ (canvas rotate: m center: b angle: alfa) hide.
	d _ (canvas rotate: b center: c angle: beta) hide.
	e _ (canvas rotate: c center: d angle: beta) hide.
	canvas segment: b to: c.
	canvas segment: c to: d.
	canvas segment: d to: e.
	""
	f _ (canvas rotate: c center: b angle: gamma) hide.
	g _ (canvas rotate: b center: f angle: delta) hide.
	h _ (canvas rotate: f center: g angle: delta) hide.
	canvas segment: b to: f.
	canvas segment: f to: g.
	canvas segment: g to: h.
	k > 0 ifTrue: [ 
		branch value: a value: m value: k - 1.
		branch value: m value: b value: k - 1.
		branch value: b value: c value: k - 1.
		branch value: c value: d value: k - 1.
		branch value: d value: e value: k - 1.
		branch value: b value: f value: k - 1.
		branch value: f value: g value: k - 1.		
		branch value: g value: h value: k - 1.
	]
].
branch value: (canvas point: 0 @ -2) value: (canvas point: 0 @ 1) value: 3