|canvas shape alfa fibo a b m s|
canvas _ DrGeoSketch new.
alfa _ (canvas freeValue: -90 degreesToRadians) hide.
shape _ [:c :o :f| | e p |
	e _ (canvas rotate: o center: c angle: alfa) hide.
	(canvas arcCenter: c from: e to: o) large.
	p _ canvas translate: e vector: (canvas vector: c to: o) hide.
	(canvas polygon: { c. o. p hide. e }) name: f; unfilled; small.
	e].
fibo _ [ ].
fibo _ [ :f :o :c :k | | e f1 f2 f3 c2|
"f1: term Fn-1, f2: term Fn, o & c: origin and center of spiral arm
e: extremity of the spiral arm"
	f1 _ f first.
	f2 _ f second.
	f3 _ f1 + f2.
	e _ shape value: c value: o value: f3.	
	c2 _ (canvas scale: c center: e factor: f3 / f2) hide.
	k > 0 ifTrue: [ fibo value: {f2. f3} value: e value: c2 value: k - 1 ]].

a _ canvas point: 1@0.
b _ canvas point: -1 @0.
m _ (canvas middleOf: a and: b) hide.
s _ shape value: m value: a value: 1.
shape value: m value: s value: 1.
fibo value: {1. 2} value: b value: a value: 10
