| sketch f df xn ptA ptB|
sketch _ DrGeoSketch new axesOn.
xn _ 2.
f _ [ :x | x cos + x ].
df _ [ :x | (f value: x + 1e-8) - (f value: x) * 1e8]. "Derivate number"
sketch plot: f from: -20 to: 20.
ptA _ (sketch point: xn@0) large; name: 'Drag me'.
5 timesRepeat: [ 
	ptB _ sketch point: [ :pt | pt point x @ (f value: pt point x)] parent: ptA.
	ptB hide.
	(sketch segment: ptA to: ptB) dotted forwardArrow .
	ptA _ sketch point: [:pt | 
		| x |
		x _ pt point x.
		x - ( (f value: x) / (df value: x) )  @ 0 ] parent: ptB.
	ptA hide.
	(sketch segment: ptB to: ptA) dotted forwardArrow].
