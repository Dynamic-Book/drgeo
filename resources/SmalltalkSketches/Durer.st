| canvas durer o1 a1 r1 c1b p1 t1 m1 k1 n1 h1 b1 e1 alfa d1 c11|
canvas _ DrGeoSketch new fullscreen. 
durer _ [  ].
durer _ [ :a :b :c :d :e :k | 
	| ab bc cd de ea ac ad bd be ce f g h l m c1 c2 c3 c4 c5 n o p q r s t u v z|
	k > 1 ifTrue: [ 
		"Sides of the pentagon"
		ab _ (canvas line: a to: b) hide.
		bc _ (canvas line: b to: c) hide.
		cd _ (canvas line: c to: d) hide.
		de _ (canvas line: d to: e) hide.
		ea _ (canvas line: e to: a) hide.
		"Diagonal"
		ac _ (canvas line: a to: c) hide.
		ad _ (canvas line: a to: d) hide.
		bd _ (canvas line: b to: d) hide.	
		be _ (canvas line: b to: e) hide	.
		ce _ (canvas line: c to: e) hide.
		"Central pentagon"
		f _ (canvas intersectionOf: ac and: be) hide.
		g _ (canvas intersectionOf: ac and: bd) hide.
		h _ (canvas intersectionOf: ce and: bd) hide.
		l _ (canvas intersectionOf: ce and: ad) hide.
		m _ (canvas intersectionOf: ad and: be) hide.
		"Auxialiary circles"
		c1 _ (canvas circleCenter: h to: g) hide.
		c2 _ (canvas circleCenter: l to: h) hide.
		c3 _ (canvas circleCenter: m to: l) hide.
		c4 _ (canvas circleCenter: f to: m) hide.
		c5 _ (canvas circleCenter: g to: f) hide.
		"Vertex of the new pentagons"
		n _ (canvas intersectionOf: cd and: c1) hide.
		o _ (canvas altIntersectionOf: cd and: c1) hide.
		p _ (canvas intersectionOf: c2 and: de) hide.	
		q _ (canvas altIntersectionOf: c2 and: de) hide. 	
		r _ (canvas intersectionOf: c3 and: ea) hide.
		s _ (canvas altIntersectionOf: c3 and: ea) hide.
		t _ (canvas intersectionOf: c4 and: ab) hide.
		u _ (canvas altIntersectionOf: c4 and: ab) hide.
		v _ (canvas intersectionOf: c5 and: bc) hide.
		z _ (canvas altIntersectionOf: c5 and: bc) hide.
		"Go recursive"
		durer valueWithArguments: { f . g . h . l . m . k - 1 }.
		durer valueWithArguments: { g . z . c . n . h . k - 1 }.
		durer valueWithArguments: { l . h . o . d . p . k - 1 }.		
		durer valueWithArguments: { r . m . l . q . e . k - 1 }.
		durer valueWithArguments: { a . t . f . m . s . k - 1 }.
		durer valueWithArguments: { u. b . v . g . f . k - 1 }.

	]
	ifFalse: [ canvas polygon: { a . b . c . d . e }]
].
o1 _ (canvas point: 0@0) name: 'O'.
a1 _ (canvas point: 0@3.5) name: 'A'.
r1 _ (canvas line: o1 to: a1) hide.
c11 _ (canvas circleCenter: o1 to: a1) hide.
p1 _ (canvas perpendicular: r1 at: o1) hide.
t1 _ (canvas intersectionOf: p1 and: c11) hide.
m1 _ (canvas middleOf: o1 and: t1) hide.
k1 _ (canvas circleCenter: m1 to: a1) hide.
n1 _ (canvas altIntersectionOf: k1 and: p1) hide.
h1 _ (canvas circleCenter: a1 to: n1) hide.
b1 _ (canvas intersectionOf: h1 and: c11) name: 'B'.
e1 _ (canvas altIntersectionOf: h1 and: c11) name: 'E'.
alfa _ canvas geometricAngle: e1 to: a1 to: b1.
d1 _ (canvas rotate: a1 center: e1 angle: alfa) name: 'D'.
c1b _ (canvas reflect: d1 axis: r1) name: 'C'.

durer valueWithArguments: { a1 . b1 . c1b . d1 . e1 . 4 }
