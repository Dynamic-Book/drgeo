'From Cuis 6.0 [latest update: #6068] on 11 November 2023 at 3:41:26 am'!
'Description '!
!provides: 'DrGeoSpanish' 1 6!
SystemOrganization addCategory: #DrGeoSpanish!


!classDefinition: #DrGeoFigura category: #DrGeoSpanish!
DrGeoSketch subclass: #DrGeoFigura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DrGeoSpanish'!
!classDefinition: 'DrGeoFigura class' category: #DrGeoSpanish!
DrGeoFigura class
	instanceVariableNames: ''!


!DrGeoFigura commentStamp: '<historical>' prior: 0!
Domain Specific Language (DSL) abstraction to construct programmatically interactive sketch. 
I come with methods with Spanish names.!

!DrGeoFigura methodsFor: 'interfaz de usuario' stamp: 'drgeo 11/9/2023 14:25:53'!
centrarEn: aPoint
	^ self centerTo: aPoint! !

!DrGeoFigura methodsFor: 'interfaz de usuario' stamp: 'drgeo 11/9/2023 14:26:16'!
escala: anInteger
	^ self scale: anInteger ! !

!DrGeoFigura methodsFor: 'interfaz de usuario' stamp: 'drgeo 11/9/2023 15:27:42'!
mostrarEje
	^ self axesOn! !

!DrGeoFigura methodsFor: 'interfaz de usuario' stamp: 'drgeo 11/9/2023 15:27:47'!
mostrarGrilla
	^ self gridOn! !

!DrGeoFigura methodsFor: 'interfaz de usuario' stamp: 'drgeo 11/9/2023 14:26:31'!
pantallaCompleta
	^ self fullscreen ! !

!DrGeoFigura methodsFor: 'texto' stamp: 'drgeo 11/9/2023 14:42:46'!
texto: aText
	^ self text: aText! !

!DrGeoFigura methodsFor: 'texto' stamp: 'drgeo 11/9/2023 14:43:58'!
texto: aText en: aPosition
	^ self text: aText at: aPosition! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 14:49:15'!
arcoDesde: wrpPt1 hasta: wrpPt3 pasandoPor: wrpPt2
	^ self arc: wrpPt1 to: wrpPt2 to: wrpPt3! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 14:58:04'!
bisectrizDe: wrpAngle
	^ self angleBisector: wrpAngle! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 14:59:36'!
bisectrizDelVértice: wrpSummit lado1: wrpPt1 lado2: wrpPt2
	^ self angleBisectorSummit: wrpSummit side1: wrpPt1 side2: wrpPt2 ! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:18:27'!
bisectrizPerpendicularDe: wrpSegment
	^ self perpendicularBisector: wrpSegment! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:18:56'!
bisectrizPerpendicularDe: wrpPt1 hasta: wrpPt2
	^ self perpendicularBisector: wrpPt1 to: wrpPt2! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 14:46:22'!
centrarArco: wrpPt1 desde: wrpPt2 hasta: wrpPt3
	^ self arcCenter: wrpPt1 from: wrpPt2 to: wrpPt3! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 19:16:45'!
círculoCentro: wrpCenter hasta: wrpPt
	^ self circleCenter: wrpCenter to: wrpPt! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 19:16:49'!
círculoCentro: wrpCenter radio: wrpValue
	^ self circleCenter: wrpCenter radius: wrpValue! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 19:16:54'!
círculoCentro: wrpCenter segmento: wrpSegment
	^ self circleCenter: wrpCenter segment: wrpSegment! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:16:45'!
lugarDe: wrpPt1 cuandoVaríe: wrpPt2
	^ self locusOf: wrpPt1 when: wrpPt2 ! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:06:43'!
paralelaA: wrpDirection pasandoPor: wrpPtOrPoint
	^ self parallel: wrpDirection at: wrpPtOrPoint! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:07:11'!
perpendicularA: wrpDirection pasandoPor: wrpPtOrPoint
	^ self perpendicular: wrpDirection at: wrpPtOrPoint! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:07:46'!
polígono: collection
	^ self polygon: collection! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:09:16'!
polígonoRegularCentro: wrpCenter vértice: wrpVertex lados: wrpValue
	^ self regularPolygonCenter: wrpCenter vertex: wrpVertex sides: wrpValue! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:15:07'!
rectaPasandoPor: wrpPt1 y: wrpPt2
	^ self line: wrpPt1 to: wrpPt2 ! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:09:29'!
segmentoDe: wrpPt1 hasta: wrpPt2
	^ self segment: wrpPt1 to: wrpPt2 ! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:14:10'!
semirrectaOrigen: wrpPt1 pasandoPor: wrpPt2
	^ self ray: wrpPt1 to: wrpPt2 ! !

!DrGeoFigura methodsFor: 'curva' stamp: 'drgeo 11/9/2023 15:10:24'!
vectorOrigen: wrpPt1 hasta: wrpPt2
	^ self vector: wrpPt1 to: wrpPt2 ! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 15:25:56'!
decimal: value en: aPoint min: startValue max: endValue
	^ self float: value at: aPoint from: startValue to: endValue ! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 15:26:18'!
decimal: value en: aPoint min: startValue max: endValue nombre: name
	^ self float: value at: aPoint from: startValue to: endValue name: name! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 15:27:03'!
decimal: value en: aPoint min: startValue max: endValue nombre: name mostrarValor: isValueDisplay
	^ self float: value at: aPoint from: startValue to: endValue name: name showValue: isValueDisplay! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 15:28:07'!
entero: value en: aPoint min: startValue max: endValue
	^ self integer: value at: aPoint from: startValue to: endValue ! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 15:28:22'!
entero: value en: aPoint min: startValue max: endValue nombre: name
	^ self integer: value at: aPoint from: startValue to: endValue name: name! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 15:28:37'!
entero: value en: aPoint min: startValue max: endValue nombre: name mostrarValor: isValueDisplay
	^ self integer: value at: aPoint from: startValue to: endValue name: name showValue: isValueDisplay! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 15:29:10'!
exportarImagen: aFilename
	self exportToImage: aFilename! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 19:22:57'!
gráficoDe: f desde: x0 hasta: x1
	^ self plot: f from: x0 to: x1! !

!DrGeoFigura methodsFor: 'auxiliares' stamp: 'drgeo 11/9/2023 15:29:27'!
hacer: aBlock
	^ self do: aBlock! !

!DrGeoFigura methodsFor: 'ecuacion' stamp: 'drgeo 11/9/2023 19:21:20'!
ecuaciónDe: wrpLineOrCircle
	^ self equationOf: wrpLineOrCircle! !

!DrGeoFigura methodsFor: 'initialize-release' stamp: 'drgeo 11/9/2023 18:59:31'!
borrar
	self delete! !

!DrGeoFigura methodsFor: 'punto' stamp: 'drgeo 11/9/2023 19:00:26'!
intersecciónDe: wrpCurve1 en: wrpCurve2
	^ self intersectionOf: wrpCurve1 and: wrpCurve2 ! !

!DrGeoFigura methodsFor: 'punto' stamp: 'drgeo 11/9/2023 19:00:50'!
mitadDe: wrpSegment
	^ self middleOf: wrpSegment ! !

!DrGeoFigura methodsFor: 'punto' stamp: 'drgeo 11/9/2023 19:00:59'!
mitadDe: wrpPoint1 en: wrpPoint2
	^ self middleOf: wrpPoint1 and: wrpPoint2 ! !

!DrGeoFigura methodsFor: 'punto' stamp: 'drgeo 11/9/2023 19:00:17'!
otraIntersecciónDe: wrpCurve1 en: wrpCurve2
	^ self altIntersectionOf: wrpCurve1 and: wrpCurve2 ! !

!DrGeoFigura methodsFor: 'punto' stamp: 'hlsf 11/11/2023 03:28:09'!
punto: aPointOrBlock
	^ self point: aPointOrBlock ! !

!DrGeoFigura methodsFor: 'punto' stamp: 'hlsf 11/11/2023 03:34:33'!
punto: block padre: wrpValue
	^ self point: block parent: wrpValue ! !

!DrGeoFigura methodsFor: 'punto' stamp: 'hlsf 11/11/2023 03:40:39'!
punto: block padres: wrpValueArray
	^ self point: block parents: wrpValueArray ! !

!DrGeoFigura methodsFor: 'punto' stamp: 'drgeo 11/9/2023 19:02:57'!
puntoEnLinea: wrpCurve en: abscissa
	^ self pointOnLine: wrpCurve at: abscissa! !

!DrGeoFigura methodsFor: 'punto' stamp: 'hlsf 11/11/2023 03:33:25'!
puntoX: wrpValue1 Y: wrpValue2
	^ self pointX: wrpValue1 Y: wrpValue2 ! !

!DrGeoFigura methodsFor: 'procesamiento' stamp: 'drgeo 11/9/2023 19:03:21'!
actualizar
	^ self update! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:03:56'!
abscisaDe:  wrpPointOrWrpVectorOrPoint
	^ self abscissaOf: wrpPointOrWrpVectorOrPoint ! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:04:49'!
ánguloGeométricoVértice: wrpPt1 en: wrpPt2 y: wrpPt3
	^ self geometricAngle: wrpPt2  to: wrpPt1  to: wrpPt3 ! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:20:36'!
ánguloVector: wrpVecteur1 en: wrpVecteur2
	^ self angle: wrpVecteur1 to: wrpVecteur2 ! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:07:32'!
ánguloVértice: wrpPt1 en: wrpPt2 y: wrpPt3
	^ self angle: wrpPt2  to: wrpPt1  to: wrpPt3 ! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:07:42'!
distanciaEntre: item1 y: item2
	^ self distance: item1 to: item2! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:08:24'!
longitudDe: wrpItem
	^ self lengthOf: wrpItem ! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:08:43'!
ordenadaDe: wrpItem
	^ self ordinateOf: wrpItem ! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:09:03'!
pendienteDe: wrpLine
	^ self slopeOf: wrpLine! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:09:21'!
valorLibre: aNumber
	^ self freeValue: aNumber ! !

!DrGeoFigura methodsFor: 'valor' stamp: 'drgeo 11/9/2023 19:09:29'!
valorLibre: aNumber en: aPosition
	^ self freeValue: aNumber at: aPosition! !

!DrGeoFigura methodsFor: 'transformaciones' stamp: 'drgeo 11/9/2023 19:10:53'!
escalaDe: wrpItem centro: wrpCenter factor: wrpValue
	^ self scale: wrpItem center: wrpCenter factor: wrpValue! !

!DrGeoFigura methodsFor: 'transformaciones' stamp: 'drgeo 11/9/2023 19:21:40'!
rotaciónDe: wrpItem centro: wrpCenter angulo: wrpValue
	^ self rotate: wrpItem center: wrpCenter angle: wrpValue! !

!DrGeoFigura methodsFor: 'transformaciones' stamp: 'drgeo 11/9/2023 19:21:55'!
rotaciónDe: wrpItem centro: wrpCenter gradosDelÁngulo: wrpValue
	^ self rotate: wrpItem center: wrpCenter angleDegrees: wrpValue! !

!DrGeoFigura methodsFor: 'transformaciones' stamp: 'drgeo 11/9/2023 19:12:09'!
simétricoDe: wrpItem segúnCentro: wrpCenter
	^ self symmetry: wrpItem center: wrpCenter ! !

!DrGeoFigura methodsFor: 'transformaciones' stamp: 'drgeo 11/9/2023 19:11:49'!
simétricoDe: wrpItem segúnEje: wrpLine
	^ self reflect: wrpItem axis: wrpLine! !

!DrGeoFigura methodsFor: 'transformaciones' stamp: 'drgeo 11/9/2023 19:15:48'!
trasladoDe: wrpItem porVector: wrpVecteur
	^ self translate: wrpItem vector: wrpVecteur! !

!DrGeoFigura class methodsFor: 'instance creation' stamp: 'hlsf 11/11/2023 03:26:22'!
nueva
	^ self new! !
