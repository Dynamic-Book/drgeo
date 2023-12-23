| canvas s mobile pen convertFactor locus|
canvas _ DrGeoSketch new fullscreen axesOn gridOn scale: 0.1.
s _ canvas segment: 0@0 to: 40@0.
mobile _ canvas pointOnLine:	 s at: 0.
convertFactor _ 180 / Float halfPi.
pen _ canvas 
	point: [ :item | Point r: item point x squared  degrees: item point x * convertFactor ]
	parent: mobile.
locus _ canvas locusOf: pen when: mobile.