| figure a b c m1 m2|
figure _ DrGeoFigure nouveau.
figure afficherGrille; afficherAxes.
a _ figure segmentDe: 2@ 3 à: 0@0.
a nommer: 'a'.
b _ figure segmentDe: 0@0 à: -1@2.
b nommer: 'b'.
c _ figure segmentDe: -1@2 à: 2@3.
c nommer: 'c'.
m1 _ (figure médiatriceDe: a) couleur: Color red.
m2 _ (figure médiatriceDe: b) couleur: Color red.
(figure médiatriceDe: c) couleur: Color red.
figure cercleCentre: (figure intersectionDe: m1 et: m2) passantPar: 0@0.
(figure point: 0@0) montrer
