| canvas s mobile pen convertFactor|
canvas _ DrGeoSketch new fullscreen axesOn gridOn.
s _ canvas segment: 0@0 to: 30@0.
mobile _ canvas pointOnLine:	 s at: 0.
convertFactor _ 180 / Float halfPi.
pen _ canvas 
	point: [ :item |
		Point r: 0.5 * ( 1.1 raisedTo: item point x) degrees: item point x * convertFactor ]
	parent: mobile.
canvas locusOf: pen when: mobile.
