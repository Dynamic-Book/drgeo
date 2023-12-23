| canvas dragon rec|
canvas _ DrGeoSketch new fullscreen. 
dragon _ [  ].
dragon _ [ :a :b :k | | c m n |
	k > 0 ifTrue: [ 
		c _ canvas 
			altIntersectionOf: (canvas circleCenter: a to: b) hide
			and: (canvas circleCenter: b to: a) hide.
		c hide.
		m _ (canvas middleOf: a and: c) hide.
		n _ (canvas middleOf: b and: c) hide.
		dragon value: m value: a value: k - 1.	
		dragon value: m value: n value: k - 1.	
		dragon value: b value: n value: k - 1].
	k = 0 ifTrue: [ canvas segment: a to: b ].
].	

rec _ 5.
canvas text: 'Sierpinski Dragon, recursion: ', rec printString at: 0@0.
dragon value: (canvas point: -4@1.5) value: (canvas point: 4@1.5) value: rec