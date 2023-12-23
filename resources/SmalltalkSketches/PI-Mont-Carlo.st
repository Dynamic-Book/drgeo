| fig point comment x y random inArc tries|
"Monte-Carlo PI approximation"
fig _ DrGeoSketch new scale: 400.
fig centerTo: 0.5@0.5.
fig arcCenter: 0@0 from:  1@0 to: 0@1.
fig polygon: { 0@0. 0@1. 1@1. 1@0 }.
comment _ fig text: '' at: 0@ -0.1.
random _ Random seed: Time millisecondClockValue.
tries _ 200.
inArc _ 0.
1 to: tries do: [: try |
	x _ random next.
	y _ random next.
	point _ (fig point: x@y) small.
	(x squared + y squared) > 1
		ifTrue: [point color: Color blue  ]
		ifFalse: [inArc _ inArc + 1 ].
comment text: 'Tries: ', try asString, '
approx: ', (inArc * 4 / try) asFloat asString.
(try \\ 10) isZero ifTrue: [(Delay forMilliseconds: 10) wait]
]
