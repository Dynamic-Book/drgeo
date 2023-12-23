| canvas koch |
canvas _ DrGeoSketch new fullscreen. 
koch _ [ ].
koch _ [ :a :b :k | |ab c d v |
	k > 0 ifTrue: [ 
		ab _ (canvas segment: a to: b) hide.
		c _ (canvas pointOnLine: ab at: 1 / 3) hide.
		d _ (canvas pointOnLine: ab at: 2 / 3) hide.
		v _ (canvas 
		altIntersectionOf: (canvas perpendicularBisector: ab) hide 
		and: (canvas circleCenter: c to: d) hide) hide.
		koch value: a value: c value: k - 1. 
		koch value: c value: v value: k - 1. 
		koch value: v value: d value: k - 1.
		koch value: d value: b value: k - 1].
	canvas segment: a to: b].
koch 
	value: ((canvas point: -8@3) name: 'A')
	value: ((canvas point: 8@3) name: 'B')
	value: 5
