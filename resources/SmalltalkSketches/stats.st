|canvas s stats points|

points _ Array new: 12.
stats _ Array new: 12 withAll: 0.

canvas _ DrGeoSketch new.
canvas 	scale: 20;
	centerTo: 6@10.
2 to: 12 do: [:i |
	points at: i put: (canvas point: i@0.1).
	(points at: i) square; color: Color blue.
	s _ canvas segment: i@0 to: (points at: i).
	s color: Color red].

canvas do: [
	1 to: 10000 do: [:i|
		s _ 6 atRandom + 6 atRandom.
		stats at: s put: ((stats at: s)+1).
		(points at: s) 
			name: (stats at: s) asString;
			moveTo: s @ ((stats at: s) / 100).
		canvas update].
	canvas gridOn.
	2 to: 12 do: [:i |
		(points at: i) name: (stats at: i) / 100.0]].
	
