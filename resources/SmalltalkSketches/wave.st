|canvas curveBlock curve w R A F S f Phi phi s pMobile pCurve time|

canvas _ DrGeoSketch new.

R _ canvas float:  1 at: -10@5 from: 0 to: 10 name: 'R'. 
A _ canvas float: 1 at: -10@4 from: 0 to: 10 name:  'A'.
F _ canvas integer: 3 at: -10@3 from: 0 to: 10 name: 'F' showValue: true.
S _ canvas float: 0 at: -10@2 from: 0 to: 3 name: 'S'.
f _ canvas float: 0.2 at: -10@1 from:  0 to: 1 name: 'f'.
Phi _ canvas float: 0 at: -10@0 from: 0 to: Float twoPi name: 'ro'.
phi _ canvas float: 0 at: -10@ -1 from: 0 to: Float twoPi name: 'phi'.
s _ canvas segment: -10@ -3 to: -5@ -3.
pMobile _ canvas pointOnLine: s at: 0.
time _ 0.
w _ [:theta :t | A value * (F  value * theta + (S value  * t) + Phi value) sin * (f value * t + phi value) cos].
curveBlock _ [:mobile | |wValue thetaValue x y |
	thetaValue _ mobile abscissa * Float twoPi.
	wValue _ w value: thetaValue value: time. 
	x _ (R value + wValue) * thetaValue cos.
	y _ (R value + wValue) * thetaValue sin.
	x @ y].
pCurve _ canvas point: curveBlock parent: pMobile.
curve _ canvas locusOf: pCurve when: pMobile.
curve large; color: Color blue.
canvas do: [
	1 to: 1000 by: 0.03 do: [:t |
		time _ t.
		canvas update.
		(Delay forMilliseconds: 100) wait]]
