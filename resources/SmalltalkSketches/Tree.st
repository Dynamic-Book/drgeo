| canvas tree angl angr fac|
canvas _ DrGeoSketch new. 
fac _ (canvas freeValue: 2/3) hide.
angl _ (canvas freeValue: 2.8) hide.
angr _ (canvas freeValue: -2.8) hide.

tree _ [ ].
tree _ [ :a :b :k | | ab  m v bm lbc rbc lb rb mb |
	"construction of the tree"
	ab _ canvas segment: a to: b.
	m _ (canvas middleOf: ab) hide.
	v _ (canvas vector: b to: m) hide.
	bm _ (canvas scale:  ab center: b factor: fac) hide.
	lbc _ canvas rotate: bm center: b angle: angr.
	rbc _ canvas rotate: bm center:  b angle: angl.
	canvas translate:  lbc vector: v.
	lb _ (canvas rotate: m center: b angle: angr) hide.
	rb _ (canvas rotate: m center: b angle: angl) hide.
	mb _ (canvas translate: rb vector: v) hide.
	k > 0 ifTrue: [ 		
		tree value: m value: mb value: k - 1.
		tree value: b value: lb value: k - 1.
		tree value: b value: rb value: k - 1]].

tree value: (canvas point: 0@0) value: (canvas point: 0@6) value: 4
