'From Cuis6.3 [latest update: #6319] on 13 April 2024 at 11:23:35 am'!
'Description '!
!provides: 'DrGeoFrench' 1 11!
SystemOrganization addCategory: #DrGeoFrench!


!classDefinition: #DrGeoTutorial category: #DrGeoFrench!
EruditeBook subclass: #DrGeoTutorial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DrGeoFrench'!
!classDefinition: 'DrGeoTutorial class' category: #DrGeoFrench!
DrGeoTutorial class
	instanceVariableNames: ''!

!classDefinition: #DrGeoFigure category: #DrGeoFrench!
DrGeoSketch subclass: #DrGeoFigure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DrGeoFrench'!
!classDefinition: 'DrGeoFigure class' category: #DrGeoFrench!
DrGeoFigure class
	instanceVariableNames: ''!


!DrGeoFigure commentStamp: '' prior: 0!
Domain Specific Language (DSL) abstraction to construct programmatically interactive sketch. 
I come with methods with French names.!

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
initialize
    super initialize.
    title _ 'Dr. Geo Tutorial'.
        self addSection: self section_Introduction.
        self addSection: self section_Général.
        self addSection: self section_Point.
        self addSection: self section_Vecteur.
        self addSection: self section_LignesDroites.
        self addSection: self section_LignesCourbes.
        self addSection: self section_NumériqueTexte.
        self addSection: self section_Transformations.
        self addSection: self section_Styles.
! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_Angles
^(EruditeBookSection basicNew title: 'Angles'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_AnglesEtValeurs
^(EruditeBookSection basicNew title: 'Angles et valeurs'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 14:28:13'!
section_Autres
^(EruditeBookSection basicNew title: 'Autres'; document: ((EruditeDocument contents: '!!!!!!Equation
//<equation>// **equationDe:** //item//
//item//, droite ou cercle
⇒ équation de la droite ou du cercle

[[[| fig e d |
fig _ DrGeoFigure nouveau.
fig afficherAxes.
d _ fig droitePassantPar: 0@0 et: 15@13.
e _ fig équationDe: e]]] withDrGeoActions

!!!!!!Texte
//<texte>// **texte:** //string//
//string//, une chaîne de caractères
⇒ texte positionné arbitrairement

[[[| fig |
fig _ DrGeoFigure nouveau.
fig texte: ''Hello'']]] withDrGeoActions

//<texte>// **texte:a** //string point//
//string//, une chaîne de caractères
//point//, un couple de coordonnées
⇒ texte positionné à un emplacement souhaité

[[[| fig |
fig _ DrGeoFigure nouveau.
fig texte: ''Hello,
  je suis heureux !!'' a: 0@0]]] withDrGeoActions

!!!!!!!!Modifier un texte
**texte:** //string//
//string//, une chaîne de caractères
⇒ modifie le texte d’un objet texte

[[[| fig monTexte |
fig _ DrGeoFigure nouveau.
monTexte _ fig texte: ''Hello''.
monTexte texte: ''Au revoir'']]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 16:47:27'!
section_Autres_Equation
^(EruditeBookSection basicNew title: 'Equation'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 16:47:27'!
section_Autres_Texte
^(EruditeBookSection basicNew title: 'Texte'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_Exemples
^(EruditeBookSection basicNew title: 'Exemples'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Général
^(EruditeBookSection basicNew title: 'Général'; document: ((EruditeDocument contents: '!!!!!!Commandes générales
**faire:** //bloc//
//bloc//, bloc de code contenant des instructions de construction et/ou d’animation de la figure interactive

Exécute le bloc de code dans un processus en tâche de fond. A utiliser lorsque la construction doit se faire sous les yeux de l’utilisateur ou bien lorsque la figure est animée.

[[[| fig point | 
fig _ DrGeoFigure nouveau.
point _ fig point: 0@0.
fig do: [ 
   -5 à: 5 par: 0.1 faire: [:x |
      point déplacerA: x@(x cos * 3).
      (Delay forMilliseconds: 100) wait.
      fig actualiser]
] ]]] withDrGeoActions

**actualiser**
Mise à jour de la figure après modification des attributs de quelques items. La plupart du temps ce n’est pas nécessaire.

**afficherGrille**
Affiche la grille de la figure.

**afficherAxes**
Affiche les axes ox et oy de la figure.

**centrerVueEn:** //unPoint//
//unPoint//, coordonnées d’un point.

La figure est décalée afin d’afficher le point donné en argument au centre de la fenêtre.

[[[| fig | 
fig _ DrGeoFigure nouveau.
fig afficherAxes.
fig centrerVueEn: 5@0]]] withDrGeoActions

**echelle:** //unEntier
//unEntier//, échelle de la figure. Une unité représente approximativement 1 pixel.

Modifie l’échelle de la figure.

[[[| fig | 
fig _ DrGeoFigure nouveau.
fig afficherAxes.
fig centrerVueEn: 5@0.
fig échelle: 5]]] withDrGeoActions

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Introduction
^(EruditeBookSection basicNew title: 'Introduction'; document: ((EruditeDocument contents: 'Les Figures Smalltalk de Dr.Geo – ou plus simplement figure dans la suite de ce texte – sont des figures écrites en langage Smalltalk. Il ne s’agit donc plus de construire une figure à l’aide de l’interface graphique de Dr.Geo mais plutôt de décrire une figure avec le langage Smalltalk et des instructions dédiées. Cette documentation décrit ces instructions.

Dans cette fenêtre, le code source de la figure est écrit dans le panneau à gauche, la figure obtenue est dans le panneau à droite. 

!!!!!! Description de l''éditeur
Les icônes de la barre ont les fonctions suivantes :

[[[DrGIcons iconUI: #open]]] embedIt
//Reprendre le travail sur une figure que tu as sauvegardée précédemment.//

[[[DrGIcons iconUI: #keep]]] embedIt
//Sauver le code source de la figure en cours d''édition.//

[[[DrGIcons iconUI: #play]]] embedIt
//Exécuter le code source de la figure, la figure interactive résultante est affichée à droite.//

[[[DrGIcons iconUI: #pause]]] embedIt
//Lors de la construction d''une figure, tu peux mettre temporairement sur pause.//

[[[DrGIcons iconUI: #debug]]] embedIt
//Exécuter pas à pas la construction de la figure.//

[[[DrGIcons iconUI: #stop]]] embedIt
//Sopper la construction d''une figure. Utile lorsqu''une figure prend beaucoup de temps à s''exécuter entièrement.//') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Introduction_Exemples;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Introduction_Exemples
^(EruditeBookSection basicNew title: 'Exemples'; document: ((EruditeDocument contents: '!!!!!!Examples simples
//La figure la plus simple, une figure vide.//
[[[DrGeoFigure nouveau]]] withDrGeoActions

//Une figure avec un point.//
[[[DrGeoFigure nouveau
	point: 1.2 @ -2]]] withDrGeoActions

//Variables pour manipuler les objets.//
[[[| figure a |
figure _ DrGeoFigure nouveau.
a _ figure point: 1.2 @ -2.
a nommer: ''A'']]] withDrGeoActions

Cette description définit une figure avec un point libre //A// de coordonnées (1,2 ; -2). 

**Quelques explications sur ce code :**
Pour écrire le symbole "flèche" d''affectation **←**, taper le caractère souligné **_**. Il est possible d''écrire **:=** à la place.

Deux variables temporaires **figure** et **a** sont déclarées entre deux barres verticales **| |**.

Les objets sont ajoutés un à un à la **figure** en lui envoyant des messages. Ici le message à mot clé **point:**, avec comme argument deux coordonnées, crée un point libre.

Le résultat est un point qu''il est possible de modifier par l’envoi de messages, ici **nommer:** pour le renommer ’A’. D''autres message permettent de modifier l''aspect du point.

!!!!!!Exemples plus complexes
//Figure et hasard.//
[[[| c triangle hasard m n p |
triangle _ [:p1 :p2 :p3 |
	c segmentDe: p1 à: p2.
	c segmentDe: p2 à: p3.
	c segmentDe: p3 à: p1].
hasard _ [5 - 10 auHasard].
c _ DrGeoFigure nouveau.
m _ c point: hasard valeur @ 0.
n _ c point: 5 @ 0.
p _ c point: hasard valeur @ 3.
triangle valeur: m valeur: n valeur: p]]] withDrGeoActions

**Cet exemple montre trois choses importantes :**
1. L’introduction d’une construction de plus haut niveau, non prévue au départ par Dr.Geo. Ici nous avons défini le bloc de code **triangle** qui, à partir de trois points, construit le triangle passant par ces trois points. 

2. La définition du bloc de code associé **hasard** qui retourne un nombre entier compris entre -5 et 5. A l''aide de ce bloc, nous plaçons au hasard certains points de notre figure.

3. L’affectation (**_**) du résultat d’une construction à une variable n’est pas obligatoire, elle permet de réutiliser ultérieurement l’objet créé. Par exemple dans le bloc de code **triangle**, nous ne gardons pas de référence des segments créés, en revanche lorsque nous définissons nos trois points nous avons besoin de garder une référence dans des variables temporaires. Ainsi, lors de l’utilisation du bloc de code **triangle**, nous passons en paramètre les variables **m**, **n** et **p**.

!!!!!!Exemple avec style
[[[| c a b d |
c _ DrGeoFigure nouveau.
a _ c point: 1@0.
b _ c point: 5@0.
d _ c line: a to: b.
a couleur: Color yellow;
	rond;
 	large.
b cacher.
d tiret]]] withDrGeoActions

Deux points et une droite sont créés. Ensuite des messages sont envoyés pour modifier l’aspect des objets, voire pour en cacher.
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesCourbes
^(EruditeBookSection basicNew title: 'Lignes courbes'; document: ((EruditeDocument contents: 'La famille des lignes courbres regroupe les cercle, arc de cercle, polygone et lieu de points.

Déplie la section **▶ Lignes courbes** pour explorer ces types de ligne !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_LignesCourbes_Cercle;
        add: self section_LignesCourbes_ArcDeCercle;
        add: self section_LignesCourbes_Polygone;
        add: self section_LignesCourbes_LieuDePoint;
        add: self section_LignesCourbes_CourbeFonction;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesCourbes_ArcDeCercle
^(EruditeBookSection basicNew title: 'Arc de cercle'; document: ((EruditeDocument contents: '!!!!!!Arc passant par trois points
//<arc>// **arcDe:à:passantPar:** //p1 p2 p3//
//p1//, point ou coordonnées, 1ère extrémité de l’arc
//p2//, point ou coordonnées, 2ème extrémité de l’arc
//p3//, point ou coordonnées de l’arc
⇒ arc de cercle défini par ses extrémités et un point

[[[| fig a b |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
b _ fig point: 0@5.
fig arcDe: a à: -1@-2 passantPar: b]]] withDrGeoActions

!!!!!!Arc selon centre et deux points
//<arc>// **arcCentre:de:à:** //O A B//
//O//, point ou coordonnées, centre de l’arc
//A//, point ou coordonnées, origine de l’arc
//B//, point ou coordonnées, tel que l’angle de l’arc est AOB
⇒ arc de cercle défini par son centre et l’angle AOB

[[[| fig a b |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
b _ fig point: 0@5.
fig arcCentre: a de: b à: -1 @ -2]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesCourbes_Cercle
^(EruditeBookSection basicNew title: 'Cercle'; document: ((EruditeDocument contents: '!!!!!!Cercle selon centre et point
//<cercle>// **cercleCentre:passantPar:** //c p//
//c//, point ou coordonnées centre du cercle
//p//, point ou coordonnées sur le cercle
⇒ cercle défini par son centre et un point

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
fig cercleCentre: a passantPar: 10@4]]] withDrGeoActions

!!!!!!Cercle selon centre et rayon
//<cercle>// **cercleCentre:rayon:** //c r//
//c//, point ou coordonnées, centre du cercle
//r//, objet ou valeur numérique, rayon du cercle
⇒ cercle défini par son centre et son rayon

[[[| fig a r |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
r _ fig valeurLibre: 4.
fig cercleCentre: a rayon: r.
fig cercleCentre: 4@4 rayon: 5]]] withDrGeoActions

!!!!!!Cercle selon centre et segment
//<cercle>// **cercleCentre:segment:** //c s//
//c//, point ou coordonnées, centre du cercle
//r//, segment rayon du cercle
⇒ cercle défini par son centre et de rayon la longueur du segment

[[[| fig a s |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
s _ fig segmentDe: 0@0 à: 3@0.
fig cercleCentre: a segment: s]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesCourbes_CourbeFonction
^(EruditeBookSection basicNew title: 'Courbe fonction'; document: ((EruditeDocument contents: '!!!!!!Courbe d''une fonction
//<lieu>// **courbeDe:de:à:** //bloc x0 x1//
//bloc//, un bloc de code à un argument décrivant une fonction
//x0//, nombre, abscisse inférieure de la courbe
//x1//, nombre, abscisse supérieure de la courbe
⇒ lieu de point, courbe représentative de la fonction décrite par le bloc de code dans l''intervalle [x0 ; x1].

[[[| fig |
fig _ DrGeoFigure nouveau.
fig courbeDe: [:x | x * x] de: -3 à: 3]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesCourbes_LieuDePoint
^(EruditeBookSection basicNew title: 'Lieu de point'; document: ((EruditeDocument contents: '!!!!!!Lieu d''un point
//<lieu>// **lieuDe:lorsqueBouge:** //c m//
//m//, point mobile sur une ligne
//c//, point fixe dépendant du point //m// 

[[[| fig m c |
fig _ DrGeoFigure nouveau.
m _ fig 
	pointSurLigne: (fig cercleCentre: 0@0 rayon: 3)
	à: 0.
c _ fig milieuDe: m et: 5@0.
fig lieuDe: c lorsqueBouge: m]]] withDrGeoActions 


') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesCourbes_Polygone
^(EruditeBookSection basicNew title: 'Polygone'; document: ((EruditeDocument contents: '!!!!!!Polygone
//<polygone>// **polygone:** //collection//
//collection//, liste de points ou de coordonnées, sommets du polygone
⇒ polygone défini par ses sommets

[[[| fig b |
fig _ DrGeoFigure nouveau.
b _ fig point: 1@3.
fig polygone: {1@2. b. 0@0. 4@1}]]] withDrGeoActions


!!!!!!Polygone régulier
//<polygone>// **polygoneRégulierCentre:sommet:côtés:** //c s n//
//c//, point ou coordonnées, centre du polygone
//s//, point ou coordonnées, sommet du polygone
//n//,  objet ou valeur numérique, nombre de sommets du polygone
⇒ polygone régulier défini par son centre, un de ses sommets et le nombre de côtés

[[[| fig b |
fig _ DrGeoFigure nouveau.
b _ fig point: 1@3.
fig polygoneRégulierCentre: b sommet: 1@1 côtés: 7]]] withDrGeoActions

Le nombre de sommets est la valeur entière de la longueur du segment :
[[[| fig b s v|
fig _ DrGeoFigure nouveau afficherAxes.
b _ fig point: 1@3.
s _ fig segmentDe: b à: 0@0.
v _ fig longueurDe: s.
fig polygoneRégulierCentre: 0@0 sommet: b côtés: v]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesDroites
^(EruditeBookSection basicNew title: 'Lignes droites'; document: ((EruditeDocument contents: 'La famille des lignes droites regroupe les droites passant par deux points, parallèle, perpendiculaire,... ainsi que les demi-droites et les segments.

Déplie la section **▶ Lignes droites** pour explorer ces types de ligne !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_LignesDroites_Droite;
        add: self section_LignesDroites_Parallèle;
        add: self section_LignesDroites_Perpendiculaire;
        add: self section_LignesDroites_Médiatrice;
        add: self section_LignesDroites_Bissectrice;
        add: self section_LignesDroites_Demidroite;
        add: self section_LignesDroites_Segment;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesDroites_Bissectrice
^(EruditeBookSection basicNew title: 'Bissectrice'; document: ((EruditeDocument contents: '!!!!!!Bissectrice d''un angle
//<droite>// **bissectriceDe:** //a//
//a//, angle géométrique défini par trois points

[[[| fig angle |
fig _ DrGeoFigure nouveau.
angle _ fig angleSommet: 0@0 de: 1@0 à: 0@1.
fig bissectriceDe: angle]]] withDrGeoActions

!!!!!!Bissectrice trois points
//<droite>// **bissectriceSommet:côté1:côté2** //a b c//
//a b c//, points définissant l''angle géométrique bac
⇒ bissectrice de l’angle bac

[[[DrGeoFigure nouveau
	bissectriceSommet: 0@0 côté1: 1@0 côté2: 0@-1]]] withDrGeoActions

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesDroites_Demidroite
^(EruditeBookSection basicNew title: 'Demi-droite'; document: ((EruditeDocument contents: '!!!!!!Demi-droite
//<demi-droite>// **demiDroiteOrigine:passantPar:** //o p//

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 1@5.
fig demiDroiteOrigine: 0@0 passantPar: a]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesDroites_Droite
^(EruditeBookSection basicNew title: 'Droite'; document: ((EruditeDocument contents: '!!!!!!Passant par deux points
//<droite>// **droitePassantPar:et:** //p1 p2//

[[[DrGeoFigure nouveau
	droitePassantPar: 0@0 et: 1@2]]] withDrGeoActions

Avec un point référencé dans une variable :
[[[| figure point |
figure _ DrGeoFigure nouveau.
point _ figure point: 1@2.
figure droitePassantPar: 0@0 et: point]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesDroites_Médiatrice
^(EruditeBookSection basicNew title: 'Médiatrice'; document: ((EruditeDocument contents: '!!!!!!Médiatrice d''un segment
//<droite>// **médiatriceDe:** //s//
//s//, segment dont on souhaite la médiatrice

[[[| fig s |
fig _ DrGeoFigure nouveau.
s _ fig segmentDe: 0@0 à: 2@1.
fig médiatriceDe: s]]] withDrGeoActions

!!!!!!Médiatrice d''un segment défini par deux points
//<droite>// **médiatriceDe:à:** //a b//
//a, b//, deux points extrémités du segment dont on souhaite la médiatrice

[[[DrGeoFigure nouveau
	médiatriceDe: 0@0 à: 4@4]]] withDrGeoActions

Un exemple avec plusieurs objets :
[[[| fig d ptA  |
fig _ DrGeoFigure nouveau.
d _ fig droitePassantPar: 0@0 et: 10@1.
ptA _ fig pointSurLigne: d à: 0.1.
fig médiatriceDe: ptA à: (fig point: 0@5)]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_LignesDroites_Parallel
^(EruditeBookSection basicNew title: 'Parallel'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesDroites_Parallèle
^(EruditeBookSection basicNew title: 'Parallèle'; document: ((EruditeDocument contents: '!!!!!!Droite parallèle
//<droite>// **parallèleA:passantPar:** //d p//
//d//, direction (droite, segment, vecteur,...)
//p//, point ou couple de coordonnées

[[[| fig d |
fig _ DrGeoFigure nouveau.
d _ fig droitePassantPar: 0@0 et: 5@1.
fig parallèleA: d 	passantPar: 0@3]]] withDrGeoActions

Le même exemple avec une seule variable :
[[[| fig |
fig _ DrGeoFigure nouveau.
fig
	parallèleA: (fig droitePassantPar: 0@0 et: 5@1)
	passantPar: 0@3]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesDroites_Perpendiculaire
^(EruditeBookSection basicNew title: 'Perpendiculaire'; document: ((EruditeDocument contents: '!!!!!!Droite perpendiculaire
//<droite>// **perpendiculaireA:passantPar:** //d p//
//d//, direction (droite, segment, vecteur,...)
//p//, point ou couple de coordonnées

[[[| fig s p |
fig _ DrGeoFigure nouveau.
p _ fig point: 2@3.
s _ fig segmentDe: 0@0 à: 5@1.
fig perpendiculaireA: s passantPar: p]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_LignesDroites_Perpendicular
^(EruditeBookSection basicNew title: 'Perpendicular'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_LignesDroites_Ray
^(EruditeBookSection basicNew title: 'Ray'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_LignesDroites_Segment
^(EruditeBookSection basicNew title: 'Segment'; document: ((EruditeDocument contents: '!!!!!!Segment
//<segment>// **segmentDe:à:** //p1 p2//

[[[DrGeoFigure nouveau
	segmentDe: 0@0 à: 1@2]]] withDrGeoActions

Avec un point référencé par une variable :
[[[| figure point |
figure _ DrGeoFigure nouveau.
point _ figure point: 1@2.
figure segmentDe: 0@0 à: point]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_LignesDroites_StraightLine
^(EruditeBookSection basicNew title: 'Straight line'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines
^(EruditeBookSection basicNew title: 'Lines'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Lines_Segment;
        add: self section_Lines_StraightLine;
        add: self section_Lines_Ray;
        add: self section_Lines_Parallel;
        add: self section_Lines_Perpendicular;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_Parallel
^(EruditeBookSection basicNew title: 'Parallel'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_Perpendicular
^(EruditeBookSection basicNew title: 'Perpendicular'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_Ray
^(EruditeBookSection basicNew title: 'Ray'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_Segment
^(EruditeBookSection basicNew title: 'Segment'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 10/30/2022 21:07:54'!
section_Lines_StraightLine
^(EruditeBookSection basicNew title: 'Straight line'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs
^(EruditeBookSection basicNew title: 'Mesures et valeurs'; document: ((EruditeDocument contents: 'Cette section regroupe les commandes pour obtenir des valeurs numériques : angles, coordonnées, pente, distance et valeurs libres.

Déplie la section **▶ Mesures et valeurs** pour explorer ces types de valeurs numériques !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_MesuresEtValeurs_Angle;
        add: self section_MesuresEtValeurs_Coordonnée;
        add: self section_MesuresEtValeurs_Mesure;
        add: self section_MesuresEtValeurs_ValeurRéglette;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs_Angle
^(EruditeBookSection basicNew title: 'Angle'; document: ((EruditeDocument contents: '!!!!!!Angle géométrique
//<angle>// **angleGeometriqueCentre:de:a** //a b c//
//a//, point, sommet de l’angle
//b//, point sur le 1er côté de l''angle
//c//, point sur le 2ème coté de l''angle
⇒ angle géométrique bac dont la mesure appartient à [0 ; 180[

[[[| fig |
fig _ DrGeoFigure nouveau.
fig 
	segmentDe: 0@0 a: 3@0;
	segmentDe: 0@0 a: 0@3;
	angleGeometriqueCentre: 0@0 de: 3@0 a: 0@3.
(fig point: 0@3) montrer.
(fig point: 3@0) montrer]]] withDrGeoActions

!!!!!!Angle orienté
//<angle>// **angleCentre:de:a** //a b c//
//a//, point, sommet de l’angle
//b//, point sur le 1er côté de l''angle
//c//, point sur le 2ème coté de l''angle
⇒ angle orienté bac dont la mesure appartient à [0 ; 360[

[[[| fig |
fig _ DrGeoFigure nouveau.
fig 
	segmentDe: 0@0 a: 3@0;
	segmentDe: 0@0 a: 0@3;
	angleCentre: 0@0 de: 3@0 a: 0@3.
(fig point: 0@3) montrer.
(fig point: 3@0) montrer]]] withDrGeoActions

!!!!!!Angle vecteurs
//<angle>// **angleVecteur:et:** //v1 v2//
//v1, v2//, vecteurs
⇒ angle orienté, formé par les deux vecteurs, dont la mesure appartient à [-PI ; PI[

[[[| fig v1 v2 a |
fig _ DrGeoFigure nouveau.
v1 _ fig vecteurOrigine: 0@0 extremite: 3@1.
v2 _ fig vecteurOrigine: 0@0 extremite: -1@-3.
a _ fig angleVecteur: v1 et: v2]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs_Coordonnée
^(EruditeBookSection basicNew title: 'Coordonnée'; document: ((EruditeDocument contents: '!!!!!!Abscisse
//<valeur>// **abscisseDe:** //item//
//item//, un point ou un vecteur

[[[| fig m |
fig _ DrGeoFigure nouveau.
m _ fig milieuDe: 10@5 et: 7@8.
fig abscisseDe: m]]] withDrGeoActions

!!!!!!Ordonnée
//<valeur>// **ordonneeDe:** //item//
//item//, un point ou un vecteur

[[[| fig m |
fig _ DrGeoFigure nouveau.
m _ fig milieuDe: 10@5 et: 7@8.
fig ordonneeDe: m]]] withDrGeoActions

!!!!!!Coordonnées (fixe)
//<point>// **coordonnees**
⇒ coordonnées (statiques) d’un point

[[[| fig seg c p |
fig _ DrGeoFigure nouveau.
seg _ fig segmentDe: 0@0 a: 5@0.
p _ fig pointSurLigne: seg a: 0.5.
c _ p coordonnees.
c x]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs_Mesure
^(EruditeBookSection basicNew title: 'Mesure'; document: ((EruditeDocument contents: '!!!!!!Longueur
//<valeur>// **longueurDe:** //objet//
//objet//, segment, cercle, arc ou vecteur
⇒ nombre, longueur de l’item

[[[| fig point segment |
fig _ DrGeoFigure nouveau.
point _ fig point: 1@2.
segment _ fig segmentDe: 0@0 a: point.
fig longueurDe: segment]]] withDrGeoActions

!!!!!!Distance
//<valeur>// **distanceDe:a:** //objet p//
//objet//, droite ou point
//p//, point
⇒ nombre, distance entre deux points ou un point et une droite

[[[| fig point droite |
fig _ DrGeoFigure nouveau.
point _ fig point: -5@5.
droite _ fig droitePassantPar: 0@0 et: 1@2.
fig distanceDe: droite a: point.
fig distanceDe: 0@0 a: 12@2]]] withDrGeoActions

!!!!!!Pente
//<valeur>// **penteDe:** //d//
//d//, droite
⇒ nombre, pente de la droite

[[[| fig p d |
fig _ DrGeoFigure nouveau.
d _ fig droitePassantPar: 0@0 et: 3@8.
p _ fig penteDe: d]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 16:19:18'!
section_MesuresEtValeurs_Valeur
^(EruditeBookSection basicNew title: 'Valeur'; document: ((EruditeDocument contents: '!!!!!!Valeur libre
//<valeur>// **valeurLibre:** //v//
//v//, la valeur initiale du nombre
⇒ nombre à la valeur libre

[[[DrGeoFigure nouveau
	valeurLibre: 1/3)]]] withDrGeoActions

Valeur approchée de π :
[[[DrGeoFigure nouveau
	valeurLibre: (-1 arcCos)]]] withDrGeoActions

!!!!!!Editer une valeur libre
**valeur:** //v//
//v//, nouvelle valeur d''un nombre

[[[| fig n |
fig _ DrGeoFigure nouveau.
" π ≈ 3 :"
n _ fig 	valeurLibre: 3. 
" Valeur approchée de π plus précise :"
n valeur: Float pi]]] withDrGeoActions

!!!!!!Réglette
Une réglette est une valeur libre dans un intervalle numérique. Dans la figure, elle est représentée sous la forme d''un segment et d''un point glissant sur ce dernier. La position du point indique la valeur numérique de la réglette.

Son utilisation permet de construire des figures dynamiques aux paramètres numériques variables.
Une réglette est de valeur entière ou décimale.

!!!!!!!!Valeur entière

!!!!!!!!Valeur décimale') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/24/2022 17:14:16'!
section_MesuresEtValeurs_ValeurRéglette
^(EruditeBookSection basicNew title: 'Valeur & Réglette'; document: ((EruditeDocument contents: '!!!!!!Valeur libre
//<valeur>// **valeurLibre:** //v//
//v//, la valeur initiale du nombre
⇒ nombre à la valeur libre

[[[DrGeoFigure nouveau
	valeurLibre: 1/3)]]] withDrGeoActions

Valeur approchée de π :
[[[DrGeoFigure nouveau
	valeurLibre: (-1 arcCos)]]] withDrGeoActions

!!!!!!Editer une valeur libre
**valeur:** //v//
//v//, nouvelle valeur d''un nombre

[[[| fig n |
fig _ DrGeoFigure nouveau.
" π ≈ 3 :"
n _ fig 	valeurLibre: 3. 
" Valeur approchée de π plus précise :"
n valeur: Float pi]]] withDrGeoActions

!!!!!!Réglette
Une réglette est une valeur libre dans un intervalle numérique. Dans la figure, elle est représentée sous la forme d''un segment et d''un point glissant sur ce dernier. La position du point indique la valeur numérique de la réglette.

Son utilisation permet de construire des figures dynamiques aux paramètres numériques variables.
Une réglette est de valeur entière ou décimale.

!!!!!!!!Valeur entière
//<bloc>// **entier:a:min:max** //v1 p v2 v3//
//<bloc>// **eniter:a:min:max:nom:** //v1 p v2 v3 s//
//<bloc>// **entier:a:min:max:nom:affciherValeur:** //v1 p v2 v3 s b//
//v1//, valeur entière initiale
//p//, position du bord gauche de la réglette
//v2//, valeur minimum
//v3//, valeur maximum
//s//, nom de la valeur
//b//, booléen (true|false), affiche ou non la valeur numérique avec le nom sous la forme ’a = 1.2’
⇒ un bloc de code retournant la valeur courante, décimale ou entière, de la réglette

[[[| fig r | "XXX TO MAKE WORKING"
fig _ DrGeoFigure nouveau.
fig afficherAxes.
r _ fig entier: 1 a: 0@-5 min: 1 max: 5.
fig cercleCentre: 0@0 rayon: r]]] withDrGeoActions

!!!!!!!!Valeur décimale
Variante à valeur décimale.
//<bloc>// **decimal:a:min:max** //v1 p v2 v3//
//<bloc>// **decimal:a:min:max:nom:** //v1 p v2 v3 s//
//<bloc>// **decimal:a:min:max:nom:affciherValeur:** //v1') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_NumériqueTexte
^(EruditeBookSection basicNew title: 'Numérique & Texte'; document: ((EruditeDocument contents: 'Cette section regroupe les commandes pour obtenir des valeurs numériques et texte : angles, coordonnées, pente, distance, valeurs libres, etc.

Déplie la section **▶ Numérique & Texte** pour explorer ces types de valeurs numériques !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_NumériqueTexte_Angle;
        add: self section_NumériqueTexte_Coordonnée;
        add: self section_NumériqueTexte_Mesure;
        add: self section_NumériqueTexte_Equation;
        add: self section_NumériqueTexte_ValeurRéglette;
        add: self section_NumériqueTexte_Texte;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_NumériqueTexte_Angle
^(EruditeBookSection basicNew title: 'Angle'; document: ((EruditeDocument contents: '!!!!!!Angle géométrique
//<angle>// **angleGéométriqueSommet:de:à** //a b c//
//a//, point, sommet de l’angle
//b//, point sur le 1er côté de l''angle
//c//, point sur le 2ème coté de l''angle
⇒ angle géométrique bac dont la mesure appartient à [0 ; 180[

[[[| fig |
fig _ DrGeoFigure nouveau.
fig 
	segmentDe: 0@0 à: 3@0;
	segmentDe: 0@0 à: 0@3;
	angleGéométriqueSommet: 0@0 de: 3@0 à: 0@3.
(fig point: 0@3) montrer.
(fig point: 3@0) montrer]]] withDrGeoActions

!!!!!!Angle orienté
//<angle>// **angleSommet:de:à** //a b c//
//a//, point, sommet de l’angle
//b//, point sur le 1er côté de l''angle
//c//, point sur le 2ème coté de l''angle
⇒ angle orienté bac dont la mesure appartient à [0 ; 360[

[[[| fig |
fig _ DrGeoFigure nouveau.
fig 
	segmentDe: 0@0 à: 3@0;
	segmentDe: 0@0 à: 0@3;
	angleSommet: 0@0 de: 3@0 à: 0@3.
(fig point: 0@3) montrer.
(fig point: 3@0) montrer]]] withDrGeoActions

!!!!!!Angle vecteurs
//<angle>// **angleVecteur:et:** //v1 v2//
//v1, v2//, vecteurs
⇒ angle orienté, formé par les deux vecteurs, dont la mesure appartient à [-PI ; PI[

[[[| fig v1 v2 a |
fig _ DrGeoFigure nouveau.
v1 _ fig vecteurOrigine: 0@0 extrémité: 3@1.
v2 _ fig vecteurOrigine: 0@0 extrémité: -1@-3.
a _ fig angleVecteur: v1 et: v2]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_NumériqueTexte_Coordonnée
^(EruditeBookSection basicNew title: 'Coordonnée'; document: ((EruditeDocument contents: '!!!!!!Abscisse
//<valeur>// **abscisseDe:** //item//
//item//, un point ou un vecteur

[[[| fig m |
fig _ DrGeoFigure nouveau.
m _ fig milieuDe: 10@5 et: 7@8.
fig abscisseDe: m]]] withDrGeoActions

!!!!!!Ordonnée
//<valeur>// **ordonnéeDe:** //item//
//item//, un point ou un vecteur

[[[| fig m |
fig _ DrGeoFigure nouveau.
m _ fig milieuDe: 10@5 et: 7@8.
fig ordonnéeDe: m]]] withDrGeoActions

!!!!!!Coordonnées (fixe)
//<point>// **coordonnées**
⇒ coordonnées (statiques) d’un point

[[[| fig seg c p |
fig _ DrGeoFigure nouveau.
seg _ fig segmentDe: 0@0 à: 5@0.
p _ fig pointSurLigne: seg à: 0.5.
c _ p coordonnées.
c x]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_NumériqueTexte_Equation
^(EruditeBookSection basicNew title: 'Equation'; document: ((EruditeDocument contents: '!!!!!!Equation
//<equation>// **équationDe:** //item//
//item//, droite ou cercle
⇒ équation de la droite ou du cercle

[[[| fig e d |
fig _ DrGeoFigure nouveau.
fig afficherAxes.
d _ fig droitePassantPar: 0@0 et: 15@13.
e _ fig équationDe: e]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_NumériqueTexte_Mesure
^(EruditeBookSection basicNew title: 'Mesure'; document: ((EruditeDocument contents: '!!!!!!Longueur
//<valeur>// **longueurDe:** //objet//
//objet//, segment, cercle, arc ou vecteur
⇒ nombre, longueur de l’item

[[[| fig point segment |
fig _ DrGeoFigure nouveau.
point _ fig point: 1@2.
segment _ fig segmentDe: 0@0 à: point.
fig longueurDe: segment]]] withDrGeoActions

!!!!!!Distance
//<valeur>// **distanceDe:à:** //objet p//
//objet//, droite ou point
//p//, point
⇒ nombre, distance entre deux points ou un point et une droite

[[[| fig point droite |
fig _ DrGeoFigure nouveau.
point _ fig point: -5@5.
droite _ fig droitePassantPar: 0@0 et: 1@2.
fig distanceDe: droite à: point.
fig distanceDe: 0@0 à: 12@2]]] withDrGeoActions

!!!!!!Pente
//<valeur>// **penteDe:** //d//
//d//, droite
⇒ nombre, pente de la droite

[[[| fig p d |
fig _ DrGeoFigure nouveau.
d _ fig droitePassantPar: 0@0 et: 3@8.
p _ fig penteDe: d]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_NumériqueTexte_Texte
^(EruditeBookSection basicNew title: 'Texte'; document: ((EruditeDocument contents: '!!!!!!Texte
//<texte>// **texte:** //string//
//string//, une chaîne de caractères
⇒ texte positionné arbitrairement

[[[| fig |
fig _ DrGeoFigure nouveau.
fig texte: ''Hello'']]] withDrGeoActions

//<texte>// **texte:à** //string point//
//string//, une chaîne de caractères
//point//, un couple de coordonnées
⇒ texte positionné à un emplacement souhaité

[[[| fig |
fig _ DrGeoFigure nouveau.
fig texte: ''Hello,
  je suis heureux !!'' à: 0@0]]] withDrGeoActions

!!!!!!!!Modifier un texte
**texte:** //string//
//string//, une chaîne de caractères
⇒ modifie le texte d’un objet texte

[[[| fig monTexte |
fig _ DrGeoFigure nouveau.
monTexte _ fig texte: ''Hello''.
monTexte texte: ''Au revoir'']]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_NumériqueTexte_ValeurRéglette
^(EruditeBookSection basicNew title: 'Valeur & Réglette'; document: ((EruditeDocument contents: '!!!!!!Valeur libre
//<valeur>// **valeurLibre:** //v//
//v//, la valeur initiale du nombre
⇒ nombre à la valeur libre

[[[DrGeoFigure nouveau
	valeurLibre: 1/3)]]] withDrGeoActions

Valeur approchée de π :
[[[DrGeoFigure nouveau
	valeurLibre: (-1 arcCos)]]] withDrGeoActions

!!!!!!Editer une valeur libre
**valeur:** //v//
//v//, nouvelle valeur d''un nombre

[[[| fig n |
fig _ DrGeoFigure nouveau.
" π ≈ 3 :"
n _ fig 	valeurLibre: 3. 
" Valeur approchée de π plus précise :"
n valeur: Float pi]]] withDrGeoActions

!!!!!!Réglette
Une réglette est une valeur libre dans un intervalle numérique. Dans la figure, elle est représentée sous la forme d''un segment et d''un point glissant sur ce dernier. La position du point indique la valeur numérique de la réglette.

Son utilisation permet de construire des figures dynamiques aux paramètres numériques variables.
Une réglette est de valeur entière ou décimale.

!!!!!!!!Valeur entière
//<bloc>// **entier:à:min:max** //v1 p v2 v3//
//<bloc>// **eniter:à:min:max:nom:** //v1 p v2 v3 s//
//<bloc>// **entier:à:min:max:nom:affciherValeur:** //v1 p v2 v3 s b//
//v1//, valeur entière initiale
//p//, position du bord gauche de la réglette
//v2//, valeur minimum
//v3//, valeur maximum
//s//, nom de la valeur
//b//, booléen (true|false), affiche ou non la valeur numérique avec le nom sous la forme ’a = 1.2’
⇒ un bloc de code retournant la valeur courante, décimale ou entière, de la réglette

[[[| fig r | "XXX TO MAKE WORKING"
fig _ DrGeoFigure nouveau.
fig afficherAxes.
r _ fig entier: 1 à: 0@-5 min: 1 max: 5.
fig cercleCentre: 0@0 rayon: r]]] withDrGeoActions

!!!!!!!!Valeur décimale
Variante à valeur décimale.
//<bloc>// **décimal:à:min:max** //v1 p v2 v3//
//<bloc>// **décimal:à:min:max:nom:** //v1 p v2 v3 s//
//<bloc>// **décimal:à:min:max:nom:affciherValeur:** //v1') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Point
^(EruditeBookSection basicNew title: 'Point'; document: ((EruditeDocument contents: 'Tu peux créer toutes sortes de point : point libre que tu peux ensuite déplacer à la souris, point mobile sur une ligne, point milieu ou d''intersection entre deux lignes. Il est même possible de créer un point dont la position est déterminée par un bloc de code !!

Déplie la section **▶ Point** pour explorer ces types de point !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Point_Libre;
        add: self section_Point_Fixe;
        add: self section_Point_SurLigne;
        add: self section_Point_Milieu;
        add: self section_Point_Intersection;
        add: self section_Point_BlocDeCode;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Point_BlocDeCode
^(EruditeBookSection basicNew title: 'Bloc de code'; document: ((EruditeDocument contents: '!!!!!!Bloc de code
Fonctionalité avancée où la position du point est définie par un bloc de code.

//<point>// **point:parent:** //bloc item//
⇒ point dont les coordonnées sont calculées avec le //bloc// de code ayant comme argument //item//.

[[[| figure s mobile c bloc |
figure _ DrGeoFigure nouveau.
s _ figure segment: -5@0 to: 5@0.
mobile _ figure pointSurLigne: s à: 0.1.
bloc _ [:mathItem | |x|
   x _ mathItem point x.
   x @ (x * x * x / 25 - x)].
c _ figure point: bloc parent: mobile.
figure lieuDe: c lorsqueBouge: mobile]]] withDrGeoActions

//<point>// **point:parents:** //bloc list//
⇒ point dont les coordonnées sont calculées avec le //bloc// de code ayant comme argument //liste//.

[[[| figure d m p |
figure _ DrGeoFigure nouveau.
d _ figure droitePassantPar: -2 @ 1 et: 3 @ 3.
d couleur: Color blue.
m _ figure point: 1 @ -1.
p _ figure 
   point: [:parents | 
	parents first closestPointTo: parents second point]
   parents: {d . m}]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Point_Fixe
^(EruditeBookSection basicNew title: 'Fixe'; document: ((EruditeDocument contents: '!!!!!!Point valeur
//<point>// **pointX:Y:** //v1 v2//
⇒ point dont les coordonnées sont deux valeurs définies dans la figure

[[[| fig a cercle segment |
fig _ DrGeoFigure nouveau afficherAxes.
a  _ fig point: 1@0.
cercle _ fig cercleCentre: 0@0 passantPar: a.
segment _ fig segmentDe: 1@1 à: a.
fig 
	pointX: (fig longueurDe: cercle) 
	Y: (fig longueurDe: segment)]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Point_Intersection
^(EruditeBookSection basicNew title: 'Intersection'; document: ((EruditeDocument contents: '!!!!!!Intersection entre deux lignes
//<point>// **intersectionDe:et:** //l1 l2//
⇒ point d’intersection des deux lignes

[[[| f droite segment |
f _ DrGeoFigure nouveau.
droite _ f droitePassantPar: 0@0 et: 5@1.
segment _ f segmentDe: 2@1 à: -5@-4.
f intersectionDe: droite et: segment]]] withDrGeoActions

!!!!!!Intersection alternative
//<point>// **autreIntersectionDe:et:** //l1 l2//
⇒ l’autre point d’intersection des deux lignes, lorsqu’il existe.

[[[| f droite cercle |
f _ DrGeoFigure nouveau.
droite _ f droitePassantPar: 0@0 et: 5@1.
cercle _ f cercleCentre: 0@0 rayon: 5.
f intersectionDe: droite et: cercle.
f autreIntersectionDe: droite et: cercle]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Point_Libre
^(EruditeBookSection basicNew title: 'Libre'; document: ((EruditeDocument contents: '!!!!!!Point libre
//<point>// **point:** //pointOuBloc//
⇒ point mobile dans le plan

[[[DrGeoFigure nouveau
	point: 5@2;
	point: [ 5 auHasard @ 5 auHasard ] ]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Point_Milieu
^(EruditeBookSection basicNew title: 'Milieu'; document: ((EruditeDocument contents: '!!!!!!Milieu de deux points
//<point>// **milieuDe:et:** //p1 p2//
⇒ milieu de deux points de la figure

[[[| f a i |
f _ DrGeoFigure nouveau.
a _ f point: 1@1.
i _ f milieuDe: a et: 4@4]]] withDrGeoActions

!!!!!!Milieu d''un segment
//<point>// **milieuDe:** //s//
⇒ milieu d''un segment de la figure

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 à: 5@3.
f milieuDe: s]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Point_SurLigne
^(EruditeBookSection basicNew title: 'Sur ligne'; document: ((EruditeDocument contents: '!!!!!!Point sur ligne
//<point>// **pointSurLigne:à:** //curve a//
//curve//, ligne de type droite, segment, cercle, etc
//a//, abscisse curviligne dans l''intervalle [0 ; 1]
⇒ point mobile sur une ligne

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 à: 5@3.
f pointSurLigne: s à: 0.5]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_fixe
^(EruditeBookSection basicNew title: 'fixe'; document: ((EruditeDocument contents: '!!!!!!Point fixe
//<point>// **pointX:Y:** //v1 v2//

[[[DrGeoFigure nouveau
	pointX: 2 Y: 5]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_intersection
^(EruditeBookSection basicNew title: 'intersection'; document: ((EruditeDocument contents: '!!!!!!Point d''Intersection entre deux lignes
//<point>// **intersectionDe:et:** //l1 l2//
⇒ point d’intersection des deux lignes

[[[f intersectionDe: droite et: segment]]]

!!!!!!Intersection alternative
//<point>// **autreIntersectionDe:et:** //l1 l2//
⇒ l’autre point d’intersection des deux lignes, lorsqu’il existe.') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_milieu
^(EruditeBookSection basicNew title: 'milieu'; document: ((EruditeDocument contents: '!!!!!!Milieu de deux points
//<point>// **milieuDe:et:** //p1 p2//

[[[| f a i |
f _ DrGeoFigure nouveau.
a _ f point: 1@1.
i _ f milieuDe: a et: 4@4]]] withDrGeoActions

!!!!!!Milieu d''un segment
//<point>// **milieuDe:** //s//

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 a: 5@3.
f milieuDe: s]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_mobile
^(EruditeBookSection basicNew title: 'mobile'; document: ((EruditeDocument contents: '!!!!!!Point mobile
//<point>// **point:** //pointOuBloc//

[[[| fig |
fig _ DrGeoFigure nouveau.
fig point: 5@2.
fig point: [ 5 auHasard @ 5 auHasard ] ]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_Point_surLigne
^(EruditeBookSection basicNew title: 'sur ligne'; document: ((EruditeDocument contents: '!!!!!!Point sur ligne
//<point>// **pointSurLigne:a:** //curve a//

[[[| f s | 
f _ DrGeoFigure nouveau.
s _ f segmentDe: 0@0 a: 5@3.
f pointSurLigne: s a: 0.5]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Styles
^(EruditeBookSection basicNew title: 'Styles'; document: ((EruditeDocument contents: '!!!!!!Style
Pour modifier les attributs d’un objet déjà créé, nous lui envoyons le message approprié. La modification des attributs se fait donc toujours à posteriori.

Dans les sections suivantes, les styles communs à tous les types d''objets d''une figure.

!!!!!!!!Couleur
**couleur:** //uneCouleur//
//uneCouleur//, un objet de type [[[Color]]] inspectIt. Voir ses méthodes de classe pour des définitions existantes : Color black, Color red, Color blue, Color orange, Color yellow,...
⇒ modifie la couleur d’un item

[[[| fig p | 
fig _ DrGeoFigure nouveau.
p _ fig point: 0@0.
p couleur: Color green]]] withDrGeoActions

!!!!!!!!Nom
**nommer:** //string//
//string//, une chaîne de caractères
⇒ nomme un objet

[[[| fig s | 
fig _ DrGeoFigure nouveau.
s _ fig segmentDe: 0@0 a: 3@1.
s nommer: ''[AB]'']]] withDrGeoActions

!!!!!!!!Statut
**cacher**
⇒ masque un objet

[[[| fig s m |
fig _ DrGeoFigure nouveau.
s _ fig segmentDe: 0@0 a: 3@1.
(fig point: 3@1) montrer.
m _ fig milieuDe: s.
fig perpendiculaireA: s passantPar: m.
m cacher]]] withDrGeoActions

**montrer**
⇒ montre un objet

**bloquer**
⇒ bloque un objet à sa position actuelle, pour peu que cela ait un sens.

[[[| fig cercle |
fig _ DrGeoFigure nouveau.
cercle _ fig cercleCentre: 0@0 passantPar: 5@0.
fig segmentDe: 0@0 a: (fig pointSurLigne: cercle a: 0.2).
(fig point: 0@0) bloquer]]] withDrGeoActions

!!!!!!!!Position
**deplacerA:** //point//
//point//, couple de coordonnées
⇒ déplace un point ou une valeur à la position donnée, pour peu que cela ait un sens.

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 0@0.
a deplacerA: 5@5.
fig actualiser]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Styles_Point;
        add: self section_Styles_Ligne;
        add: self section_Styles_Segment;
        add: self section_Styles_Texte;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Styles_Ligne
^(EruditeBookSection basicNew title: 'Ligne'; document: ((EruditeDocument contents: '!!!!!!Ligne
Une ligne est un segment, une droite, une demi-droite, un cercle, un arc de cercle, un polygone ou un lieu géométrique.

!!!!!!!!Epaisseur
**fin**
⇒ donne une épaisseur fine à une ligne
**normal**
⇒ donne une épaisseur normal à une ligne
**épais**
⇒ donne une épaisseur large à une ligne

[[[| fig c |
fig _ DrGeoFigure nouveau.
c _ fig cercleCentre: 0@0 rayon: 1.
c épais]]] withDrGeoActions

!!!!!!!!Style de trait
**plein**
⇒ donne un style de trait continue, plein, à une ligne
**tiret**
⇒ donne un style de trait en tirets à une ligne 
**pointillé**
⇒ donne un style de trait en pointillés à une ligne

[[[| fig c r|
fig _ DrGeoFigure nouveau.
c _ fig cercleCentre: 0@0 rayon: 1.
c épais tiret.
r _ fig segmentDe: 0@0 à: 1@0.
r pointillé]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Styles_Point
^(EruditeBookSection basicNew title: 'Point'; document: ((EruditeDocument contents: '!!!!!!Point

!!!!!!!!Forme
**croix**
⇒ donne une forme en croix à un point

**rond**
⇒ donne une forme en rond à un point

**carré**
⇒ donne une forme carrée à un point

[[[| fig a |
fig _ DrGeoFigure nouveau.
(fig point: 0@0) croix
(fig point: 1@0) rond.
(fig point: 2@0) carré ]]] withDrGeoActions

!!!!!!!!Taille
**petit**
⇒ donne une petite taille à un point

**moyen**
⇒ donne une taille moyenne à un point

**large**
⇒ donne une taille large à un point

[[[| fig a |
fig _ DrGeoFigure nouveau.
(fig point: 0@0) petit
(fig point: 1@0) normal.
(fig point: 2@0) large ]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Styles_Segment
^(EruditeBookSection basicNew title: 'Segment'; document: ((EruditeDocument contents: '!!!!!!Segment

!!!!!!!!Marquage
**marquerAvecCercle**
⇒ marque – codage – un segment avec un cercle
**marquerAvecDisque**
⇒ marque un segment avec un disque
**marquerAvecSimpleTrait**
⇒ marque un segment avec un trait
**marquerAvecDoubleTrait**
⇒ marque un segment avec un double trait
**marquerAvecTripleTrait**
⇒ marque un segment avec un triple trait

[[[| fig a b c |
fig _ DrGeoFigure nouveau.
a _ fig segmentDe: -2@0 à: 2@0.
b _ fig segmentDe: -2@0 à: 0@4.
c _ fig segmentDe: 0@4 à: 2@0.
a marquerAvecDisque.
b marquerAvecSimpleTrait.
c marquerAvecSimpleTrait ]]] withDrGeoActions

!!!!!!!!Flèche
**flècheDebut**
ajoute à un segment une flèche en début de ligne
**flècheFin**
ajoute à un segment une flèche en fin ligne
**flèches**
ajoute à un segment des flèches en début et en fin de ligne

[[[| fig segment |
fig _ DrGeoFigure nouveau.
segment _ fig segmentDe: 0@0 à: 5@1.
segment flècheDebut]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Styles_Texte
^(EruditeBookSection basicNew title: 'Texte'; document: ((EruditeDocument contents: '!!!!!!Texte
**couleurFond:** //uneCouleur//
⇒ modifie la couleur d''arrière plan d''un texte

[[[| fig t |
fig _ DrGeoFigure nouveau.
t _ fig texte: ''Hello''.
t couleurFond: Color green]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Transformations
^(EruditeBookSection basicNew title: 'Transformations'; document: ((EruditeDocument contents: 'Avec les transformations géométriques construis des tranformés d''objets tels des point, segment, droite, demi-droite, vecteur, cercle, arc de cercle, polygone et lieu de point.

Déplie la section **▶ Transformations** pour les découvrir !!') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new        add: self section_Transformations_Rotation;
        add: self section_Transformations_Homothétie;
        add: self section_Transformations_SymétrieCentrale;
        add: self section_Transformations_SymétrieAxiale;
        add: self section_Transformations_Translation;
 yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 23:15:30'!
section_TransformationsGéométriques
^(EruditeBookSection basicNew title: 'Transformations géométriques'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Transformations_Homothétie
^(EruditeBookSection basicNew title: 'Homothétie'; document: ((EruditeDocument contents: '!!!!!!Homothétie
//<objet>// **homothétieDe:centre:facteur:** //i c k//
//i//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//c//, point ou couple de coordonnées, centre de l’homothétie
//k//, nombre ou valeur, facteur de l’homothétie
⇒ référence de l’objet transformé

[[[| fig a c l n |
fig _ DrGeoFigure nouveau.
fig afficherAxes.
a _ fig point: 3@0.
n _ fig distanceDe:a à: 0@0.
c _ fig point: 5@5.
l _ fig cercleCentre: 0@0 passantPar: 3@3.
fig homothétieDe: l centre: c facteur: 1.5.
fig homothétieDe: l centre: c facteur: n]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 3/9/2023 15:22:49'!
section_Transformations_Rotation
^(EruditeBookSection basicNew title: 'Rotation'; document: ((EruditeDocument contents: '!!!!!!Rotation
//<objet>// **rotationDe:centre:angle:** //i c a//
//i//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//c//, point ou d’un couple de coordonnées, centre de la rotation
//a//, nombre ou valeur, angle de la rotation
⇒ objet transformé

[[[| fig a c l n |
fig _ DrGeoFigure nouveau.
fig afficherAxes.
a _ fig point: 3@0.
n _ fig distanceDe:a à: 0@0.
c _ fig point: 5@5.
l _ fig droitePassantPar: 1@0 et: 5@5.
fig rotationDe: l centre: c angleDegrés: 30.
fig rotationDe: l centre: c angle: n]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Transformations_SymétrieAxiale
^(EruditeBookSection basicNew title: 'Symétrie axiale'; document: ((EruditeDocument contents: '!!!!!!Symétrie axiale (réflexion)
//<objet>// **symétriqueDe:selonAxe:** //o c//
//o//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//axe//, droite, axe de la réflexion
⇒ objet transformé

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 4@2.
fig 
	symétriqueDe: a 
	selonAxe: (fig droitePassantPar: 0@0 et: 4@5)]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Transformations_SymétrieCentrale
^(EruditeBookSection basicNew title: 'Symétrie centrale'; document: ((EruditeDocument contents: '!!!!!!Symétrie centrale
//<objet>// **symétriqueDe:selonCentre:** //o c//
//o//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//c//, point ou coordonnées, centre de la symétrie
⇒ objet transformé

[[[| fig a |
fig _ DrGeoFigure nouveau.
a _ fig point: 4@2.
fig symétriqueDe: a selonCentre: 0@0]]] withDrGeoActions') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Transformations_Translation
^(EruditeBookSection basicNew title: 'Translation'; document: ((EruditeDocument contents: '!!!!!!Translation
//<objet>// **translationDe:parVecteur:** //o v//
//o//, objet géométrique à transformer (point, segment, droite, demi-droite, vecteur, cercle, arc-cercle, polygone)
//v//, vecteur ou couple de coordonnées
⇒ objet transformé

[[[| fig u a |
fig _ DrGeoFigure nouveau.
u _ fig vecteurOrigine: 1@1 extrémité: 3@2.
a _ fig translationDe: (fig point: 2@1) parVecteur: u]]] withDrGeoActions

Un exemple dynamique :
[[[| fig u a c |
fig _ DrGeoFigure nouveau.
u _ fig 
	vecteurOrigine: 1@1 
	extrémité: (fig point: 3@2).
c _ fig cercleCentre: 0@0 passantPar: 3@3.
a _ fig translationDe: c parVecteur: u]]] withDrGeoActions
') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 11/2/2022 15:44:32'!
section_ValeursNumériques
^(EruditeBookSection basicNew title: 'Valeurs numériques'; document: ((EruditeDocument contents: '') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoTutorial methodsFor: 'as yet unclassified' stamp: 'hlsf 12/21/2022 22:16:02'!
section_Vecteur
^(EruditeBookSection basicNew title: 'Vecteur'; document: ((EruditeDocument contents: '!!!!!!Vecteur par deux points
//<vecteur>// **vecteurOrigine:extremité:** //o e//
//o//, point ou couple de coordonnées, origine du vecteur
//e//, point ou couple de coordonnées, extrémité du vecteur

[[[| fig b |
fig _ DrGeoFigure nouveau.
b _ fig point: 0@5.
fig vecteurOrigine: b extrémité: -1 @ -2]]] withDrGeoActions

!!!!!!Vecteur par coordonnées
<vecteur> **vecteur:** //p//
//p//, point ou couple de coordonnées, coordonnées du vecteur

[[[| fig p |
fig _ DrGeoFigure nouveau.
p _ fig point: 5@5.
fig vecteur: p.
fig vecteur: -5 @ -5]]] withDrGeoActions

') data: ((Dictionary new)); yourself); subsections: (OrderedCollection new yourself); yourself)! !

!DrGeoFigure methodsFor: 'user interface'!
afficherAxes
	^ self axesOn! !

!DrGeoFigure methodsFor: 'user interface'!
afficherGrille
	^ self gridOn! !

!DrGeoFigure methodsFor: 'user interface'!
centrerVueEn: aPoint
	^ self centerTo: aPoint! !

!DrGeoFigure methodsFor: 'user interface' stamp: 'hlsf 12/21/2022 14:17:46'!
échelle: anInteger
	^ self scale: anInteger ! !

!DrGeoFigure methodsFor: 'user interface'!
pleinEcran
	^ self fullscreen ! !

!DrGeoFigure methodsFor: 'text'!
texte: aText
	^ self text: aText! !

!DrGeoFigure methodsFor: 'text' stamp: 'hlsf 12/21/2022 14:18:03'!
texte: aText à: aPosition
	^ self text: aText at: aPosition! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:18:13'!
arcCentre: wrpPt1 de: wrpPt2 à: wrpPt3
	^ self arcCenter: wrpPt1 from: wrpPt2 to: wrpPt3! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:18:37'!
arcDe: wrpPt1 à: wrpPt3 passantPar: wrpPt2
	^ self arc: wrpPt1 to: wrpPt2 to: wrpPt3! !

!DrGeoFigure methodsFor: 'curve'!
bissectriceDe: wrpAngle
	^ self angleBisector: wrpAngle! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:19:14'!
bissectriceSommet: wrpSummit côté1: wrpPt1 côté2: wrpPt2
	^ self angleBisectorSummit: wrpSummit side1: wrpPt1 side2: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve'!
cercleCentre: wrpCenter passantPar: wrpPt
	^ self circleCenter: wrpCenter to: wrpPt! !

!DrGeoFigure methodsFor: 'curve'!
cercleCentre: wrpCenter rayon: wrpValue
	^ self circleCenter: wrpCenter radius: wrpValue! !

!DrGeoFigure methodsFor: 'curve'!
cercleCentre: wrpCenter segment: wrpSegment
	^ self circleCenter: wrpCenter segment: wrpSegment! !

!DrGeoFigure methodsFor: 'curve'!
demiDroiteOrigine: wrpPt1 passantPar: wrpPt2
	^ self ray: wrpPt1 to: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve'!
droitePassantPar: wrpPt1 et: wrpPt2
	^ self line: wrpPt1 to: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve'!
lieuDe: wrpPt1 lorsqueBouge: wrpPt2
	^ self locusOf: wrpPt1 when: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:19:40'!
médiatriceDe: wrpSegment
	^ self perpendicularBisector: wrpSegment! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:20:00'!
médiatriceDe: wrpPt1 à: wrpPt2
	^ self perpendicularBisector: wrpPt1 to: wrpPt2! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:20:20'!
parallèleA: wrpDirection passantPar: wrpPtOrPoint
	^ self parallel: wrpDirection at: wrpPtOrPoint! !

!DrGeoFigure methodsFor: 'curve'!
perpendiculaireA: wrpDirection passantPar: wrpPtOrPoint
	^ self perpendicular: wrpDirection at: wrpPtOrPoint! !

!DrGeoFigure methodsFor: 'curve'!
polygone: collection
	^ self polygon: collection! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:21:16'!
polygoneRégulierCentre: wrpCenter sommet: wrpVertex côtés: wrpValue
	^ self regularPolygonCenter: wrpCenter vertex: wrpVertex sides: wrpValue! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:21:33'!
segmentDe: wrpPt1 à: wrpPt2
	^ self segment: wrpPt1 to: wrpPt2 ! !

!DrGeoFigure methodsFor: 'curve'!
vecteur: wrpPt
	^ self vector: wrpPt! !

!DrGeoFigure methodsFor: 'curve' stamp: 'hlsf 12/21/2022 14:22:07'!
vecteurOrigine: wrpPt1 extrémité: wrpPt2
	^ self vector: wrpPt1 to: wrpPt2 ! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:19:20'!
courbeDe: f de: x0 à: x1
	^ self plot: f from: x0 to: x1! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:18:47'!
décimal: value à: aPoint min: startValue max: endValue
	^ self float: value at: aPoint from: startValue to: endValue ! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:19:49'!
décimal: value à: aPoint min: startValue max: endValue nom: name
	^ self float: value at: aPoint from: startValue to: endValue name: name! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:20:31'!
décimal: value à: aPoint min: startValue max: endValue nom: name afficherValeur: isValueDisplay
	^ self float: value at: aPoint from: startValue to: endValue name: name showValue: isValueDisplay! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:21:23'!
entier: value à: aPoint min: startValue max: endValue
	^ self integer: value at: aPoint from: startValue to: endValue ! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:22:25'!
entier: value à: aPoint min: startValue max: endValue nom: name
	^ self integer: value at: aPoint from: startValue to: endValue name: name! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 12/21/2022 14:23:22'!
entier: value à: aPoint min: startValue max: endValue nom: name afficherValeur: isValueDisplay
	^ self integer: value at: aPoint from: startValue to: endValue name: name showValue: isValueDisplay! !

!DrGeoFigure methodsFor: 'helpers' stamp: 'hlsf 3/13/2023 20:57:36'!
exporterVersImage: aFilename
	self exportToImage: aFilename! !

!DrGeoFigure methodsFor: 'helpers'!
faire: aBlock
	^ self do: aBlock! !

!DrGeoFigure methodsFor: 'equation' stamp: 'hlsf 12/21/2022 14:18:52'!
équationDe: wrpLineOrCircle
	^ self equationOf: wrpLineOrCircle! !

!DrGeoFigure methodsFor: 'initialize-release'!
supprimer
	self delete! !

!DrGeoFigure methodsFor: 'point'!
autreIntersectionDe: wrpCurve1 et: wrpCurve2
	^ self altIntersectionOf: wrpCurve1 and: wrpCurve2 ! !

!DrGeoFigure methodsFor: 'point'!
intersectionDe: wrpCurve1 et: wrpCurve2
	^ self intersectionOf: wrpCurve1 and: wrpCurve2 ! !

!DrGeoFigure methodsFor: 'point'!
milieuDe: wrpSegment
	^ self middleOf: wrpSegment ! !

!DrGeoFigure methodsFor: 'point'!
milieuDe: wrpPoint1 et: wrpPoint2
	^ self middleOf: wrpPoint1 and: wrpPoint2 ! !

!DrGeoFigure methodsFor: 'point' stamp: 'hlsf 12/21/2022 14:23:41'!
pointSurLigne: wrpCurve à: abscissa
	^ self pointOnLine: wrpCurve at: abscissa! !

!DrGeoFigure methodsFor: 'processing'!
actualiser
	^ self update! !

!DrGeoFigure methodsFor: 'value'!
abscisseDe:  wrpPointOrWrpVectorOrPoint
	^ self abscissaOf: wrpPointOrWrpVectorOrPoint ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 12/21/2022 15:06:06'!
angleGéométriqueSommet: wrpPt1 de: wrpPt2 à: wrpPt3
	^ self geometricAngle: wrpPt2  to: wrpPt1  to: wrpPt3 ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 12/21/2022 14:25:02'!
angleSommet: wrpPt1 de: wrpPt2 à: wrpPt3
	^ self angle: wrpPt2  to: wrpPt1  to: wrpPt3 ! !

!DrGeoFigure methodsFor: 'value'!
angleVecteur: wrpVecteur1 et: wrpVecteur2
	^ self angle: wrpVecteur1 to: wrpVecteur2 ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 12/21/2022 14:25:39'!
distanceDe: item1 à: item2
	^ self distance: item1 to: item2! !

!DrGeoFigure methodsFor: 'value'!
longueurDe: wrpItem
	^ self lengthOf: wrpItem ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 12/21/2022 14:25:51'!
ordonnéeDe: wrpItem
	^ self ordinateOf: wrpItem ! !

!DrGeoFigure methodsFor: 'value'!
penteDe: wrpLine
	^ self slopeOf: wrpLine! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 4/13/2024 11:09:26'!
valeur: aNumberOrBlock
	^ self value: aNumberOrBlock ! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 4/13/2024 11:10:53'!
valeur: aNumberOrBlock parent: wrpValue
	^ self value: aNumberOrBlock parent: wrpValue! !

!DrGeoFigure methodsFor: 'value' stamp: 'hlsf 4/13/2024 11:10:17'!
valeur: aNumberOrBlock parents: wrpValueArray à: aPosition
	^ self value: aNumberOrBlock parents: wrpValueArray at: aPosition! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 12/21/2022 14:26:15'!
homothétieDe: wrpItem centre: wrpCenter facteur: wrpValue
	^ self scale: wrpItem center: wrpCenter factor: wrpValue! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 12/21/2022 14:26:34'!
rotationDe: wrpItem centre: wrpCenter angle: wrpValue
	^ self rotate: wrpItem center: wrpCenter angle: wrpValue! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 3/9/2023 15:16:04'!
rotationDe: wrpItem centre: wrpCenter angleDegrés: wrpValue
	^ self rotate: wrpItem center: wrpCenter angleDegrees: wrpValue! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 12/21/2022 14:26:47'!
symétriqueDe: wrpItem selonAxe: wrpLine
	^ self reflect: wrpItem axis: wrpLine! !

!DrGeoFigure methodsFor: 'transformations' stamp: 'hlsf 12/21/2022 14:27:01'!
symétriqueDe: wrpItem selonCentre: wrpCenter
	^ self symmetry: wrpItem center: wrpCenter ! !

!DrGeoFigure methodsFor: 'transformations'!
translationDe: wrpItem parVecteur: wrpVecteur
	^ self translate: wrpItem vector: wrpVecteur! !

!DrGeoFigure class methodsFor: 'instance creation'!
nouveau
	^ self new! !

!Object methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:31:23'!
afficher
	self print! !

!Boolean methodsFor: '*DrGeoFrench'!
contraire
	"négation booléenne"
	
	^self not.! !

!Boolean methodsFor: '*DrGeoFrench'!
et: UnBloc
	"et au lieu de and"

	^self and: UnBloc.! !

!Boolean methodsFor: '*DrGeoFrench'!
ou: UnBloc
	"ou au lieu de or"

	^self or: UnBloc.! !

!Boolean methodsFor: '*DrGeoFrench'!
siFaux: UnBloc
	"test négatif"

	^self ifFalse: UnBloc.! !

!Boolean methodsFor: '*DrGeoFrench'!
siFaux: leBlocDuFaux siVrai: leBlocDuVrai
	"test alternatif"

	^self ifFalse: leBlocDuFaux ifTrue: leBlocDuVrai.! !

!Boolean methodsFor: '*DrGeoFrench'!
siVrai: UnBloc
	"test positif"

	^self ifTrue: UnBloc.! !

!Boolean methodsFor: '*DrGeoFrench'!
siVrai: leBlocDuVrai siFaux: leBlocDuFaux
	"test alternatif"

	^self ifTrue: leBlocDuVrai ifFalse: leBlocDuFaux.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:29:20'!
afficherEnBase: UneBase

	^self printStringBase: UneBase.! !

!Number methodsFor: '*DrGeoFrench'!
arrondir
"répond l'arrondi à l'entier le plus proche"
	^self rounded! !

!Number methodsFor: '*DrGeoFrench'!
arrondirA: UnNombre
"répond l'arrondi à UnNombre près.
Par exemple 2 racine arrondirA:  0.01 répond 1.41"

	^self roundTo: UnNombre .! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:49:40'!
arrondirParDéfautA: UnNombre
"répond l'arrondi par défaut;
par exemple, 2 racine arrondirExcesA: 0.01 répond 1.41"
	
	^self roundDownTo: UnNombre! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:50:39'!
arrondirParExcèsA: UnNombre
"répond l'arrondi à l'excès;
par exemple, 2 racine arrondirExcesA: 0.01 répond 1.42"
	^self roundUpTo: UnNombre! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:09'!
auCarré

	^self squared.! !

!Number methodsFor: '*DrGeoFrench'!
auCube

	^self puissance: 3.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:48:38'!
à: UnNombre

	^self to: UnNombre.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:48:53'!
à: UnNombre faire: UnBloc
	"boucle à condition de sortie"

	^self to: UnNombre do: UnBloc.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:48:59'!
à: UnNombre par: UnPas
"répond un intervalle avec un pas"
	^self to: UnNombre by: UnPas.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:49:09'!
à: UnNombre par: UnPas faire: UnBloc

	^self to: UnNombre by: UnPas do: UnBloc.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:51:03'!
commeDécimal

	^self asFloat.! !

!Number methodsFor: '*DrGeoFrench'!
commeEntier

	^self asInteger.! !

!Number methodsFor: '*DrGeoFrench'!
commeNombre

	^self asNumber.! !

!Number methodsFor: '*DrGeoFrench'!
cosinus
	"cosinus en degrés"
	
	^self degreeCos.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:52:37'!
degrés

	^self radiansToDegrees.! !

!Number methodsFor: '*DrGeoFrench'!
enPourcents
	^ String streamContents: [ :str | 
			(self * 100) storeOn: str.
			str nextPutAll: ' %'].! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:53:03'!
estDécimal

	^(self isFloat).! !

!Number methodsFor: '*DrGeoFrench'!
estDivisiblePar: UnNombre

	^self isDivisibleBy: UnNombre.! !

!Number methodsFor: '*DrGeoFrench'!
estEntier

	^(self isInteger).! !

!Number methodsFor: '*DrGeoFrench'!
estInfini

	^self isInfinite.! !

!Number methodsFor: '*DrGeoFrench'!
estNombre

	^self isNumber.! !

!Number methodsFor: '*DrGeoFrench'!
estNul

	^self isZero.! !

!Number methodsFor: '*DrGeoFrench'!
estPasNombre

	^self isNaN.! !

!Number methodsFor: '*DrGeoFrench'!
heures

	^self hours.! !

!Number methodsFor: '*DrGeoFrench'!
impair
	
	^self odd.! !

!Number methodsFor: '*DrGeoFrench'!
inverse

	^self reciprocal.! !

!Number methodsFor: '*DrGeoFrench'!
jours

	^self days.! !

!Number methodsFor: '*DrGeoFrench'!
millisecondes

	^self milliSeconds.! !

!Number methodsFor: '*DrGeoFrench'!
moyenneAvec: unNombre
	
	^((self + unNombre)/2).! !

!Number methodsFor: '*DrGeoFrench'!
nanosecondes

	^self nanoSeconds.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:53:25'!
négatif
	
	^self negative.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:53:33'!
opposé

	^self negated.! !

!Number methodsFor: '*DrGeoFrench'!
pair
	
	^self even.! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:53:48'!
partieDécimale
	^self fractionPart! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:54:01'!
partieEntière
	^self integerPart! !

!Number methodsFor: '*DrGeoFrench'!
positif
	
	^self positive.! !

!Number methodsFor: '*DrGeoFrench'!
pourcentsDe: UnNombre
	"répond un pourcentage.
	Par exemple 6 pourcentsDe: 200 répond 12"

	^self * UnNombre / 100.! !

!Number methodsFor: '*DrGeoFrench'!
procheDe: UnNombre

	^self closeTo: UnNombre.! !

!Number methodsFor: '*DrGeoFrench'!
puissance: UnNombre

	^self raisedTo: UnNombre.! !

!Number methodsFor: '*DrGeoFrench'!
racine

	^self sqrt.! !

!Number methodsFor: '*DrGeoFrench'!
racineCubique
	^self nthRoot: 3! !

!Number methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:54:15'!
racineNième: unEntier
	^self nthRoot: unEntier.! !

!Number methodsFor: '*DrGeoFrench'!
radians
	
	^self degreesToRadians.! !

!Number methodsFor: '*DrGeoFrench'!
reste: UnNombre
	^self rem: UnNombre! !

!Number methodsFor: '*DrGeoFrench'!
secondes

	^self seconds.! !

!Number methodsFor: '*DrGeoFrench'!
semaines

	^self weeks.! !

!Number methodsFor: '*DrGeoFrench'!
signe
	
	^self sign.! !

!Number methodsFor: '*DrGeoFrench'!
sinus
	"sinus en degrés"
	
	^self degreeSin.! !

!Number methodsFor: '*DrGeoFrench'!
strictementPositif

	^self strictlyPositive.! !

!Number methodsFor: '*DrGeoFrench'!
tangente
	"tangente en degrés"
	
	^(self sinus / (self cosinus)).! !

!Number methodsFor: '*DrGeoFrench'!
tronquer
	^self floor! !

!Number methodsFor: '*DrGeoFrench'!
tronquerA: UnNombre
"affiche le nombre tronqué à UnNombre près.
Par exemple, 2 racine tronquerA: 0.01 renvoie 1.41"
	^ self truncateTo: UnNombre! !

!Float methodsFor: '*DrGeoFrench'!
commeFraction

	^self asFraction.! !

!Float methodsFor: '*DrGeoFrench' stamp: 'hlsf 1/28/2024 17:18:32'!
commeFractionApprochée

	^self asApproximateFraction ! !

!Float methodsFor: '*DrGeoFrench'!
commeVraieFraction

	^self asTrueFraction.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:54:01'!
aLancienne
	"répond la fraction à l'ancienne, avec partie entière"

	| a b |
	a _ self partieEntière.
	b _ self partieDécimale.
	^(a asString),'+',(b asString).! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:54:01'!
aLegyptienne
	"répond la fraction comme somme de fractions égyptiennes
	soit de numérateurs 1;
	algorithme de Fibonacci-Sylvester"

	| liste b c chaine |
	liste _ #() commeCollectionOrdonnée.
	liste ajouter: self partieEntière.
	b _ self partieDécimale.
	[b numérateur > 1] tantQueVrai: [
		c _ (b inverse partieEntière + 1) inverse.
		b _ b-c.
		liste ajouter: c.
	].
	liste ajouter: b.
	chaine _ (liste commeTableau à: 1) asString.
	liste _ liste retirerTousLorsque: [ :n | n isInteger].
	liste _ liste commeTableau.
	liste faire: [ :elt | chaine _ chaine,' + ',(elt asString)].
	
	^chaine.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:32:14'!
commePari
	"répond la fraction comme probabilité"

	| c |
	c _ self numérateur asString.
	(self numérateur < 2) siVrai: [
		c _ c,' chance contre '.
		] siFaux:[
		c _ c,' chances contre '.
		].
	c _ c,(self dénominateur - self numérateur) asString.
	^c! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:32:14'!
commeProba
	"répond la fraction comme probabilité"

	| c |
	c _ self numérateur asString.
	(self numérateur < 2) siVrai: [
		c _ c,' chance sur '.
		] siFaux:[
		c _ c,' chances sur '.
		].
	c _ c,self dénominateur asString.
	^c! !

!Fraction methodsFor: '*DrGeoFrench'!
de: unNombre

	^self * unNombre.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:31:40'!
dénominateur

	^self denominator.! !

!Fraction methodsFor: '*DrGeoFrench'!
estUnePuissanceDe2

	^self isPowerOfTwo.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:32:14'!
numérateur

	^self numerator.! !

!Fraction methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:30:42'!
réduite

	^self reduced.! !

!Integer methodsFor: '*DrGeoFrench'!
auHasard

	^self atRandom.! !

!Integer methodsFor: '*DrGeoFrench'!
commeFraction

	^self asFraction.! !

!Integer methodsFor: '*DrGeoFrench'!
diviseurs
"diviseurs du nombre placés dans une collection" 
	^ (Array streamContents: [:str |
		1 to: self sqrtFloor do: [ :i | 
			(self rem: i) = 0 ifTrue: [ str nextPut: i; nextPut: self // i ]]]) asSet sorted! !

!Integer methodsFor: '*DrGeoFrench'!
enChiffresRomains

	^self printStringRoman.! !

!Integer methodsFor: '*DrGeoFrench'!
estDivisiblePar: unEntier

	^(self \\ unEntier) =0.! !

!Integer methodsFor: '*DrGeoFrench'!
estPremier

	^self isPrime.! !

!Integer methodsFor: '*DrGeoFrench'!
estPremierAvec: unEntier

	^(self pgdc: unEntier) = 1.! !

!Integer methodsFor: '*DrGeoFrench'!
estProbablementPremier

	^self isProbablyPrime.! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:09'!
estUnCarré
	
	^(self auCarré estEntier).! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:38:39'!
facteursPremiers
	^ Integer primesUpTo: self! !

!Integer methodsFor: '*DrGeoFrench'!
factorielle

	^self factorial.! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:32:43'!
foisRépéter: unBloc

	^self timesRepeat: unBloc.! !

!Integer methodsFor: '*DrGeoFrench'!
multiples: n
"Answer my first n multiple"
	^ Array streamContents: [:str |
		1 to: n do: [ :i | str nextPut: i * self ]]! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:41:26'!
nombreDeChiffres

	^self numberOfDigitsInBase: 10! !

!Integer methodsFor: '*DrGeoFrench'!
nombreDeChiffresEnBase: uneBase

	^self numberOfDigitsInBase: uneBase.! !

!Integer methodsFor: '*DrGeoFrench'!
pgdc: unEntier

	^self gcd: unEntier.! !

!Integer methodsFor: '*DrGeoFrench'!
ppmc: unEntier

	^self lcm: unEntier.! !

!Integer methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:33:59'!
précèdent
	"décrémente un entier"

	^self - 1.! !

!Integer methodsFor: '*DrGeoFrench'!
suivant
	"incrémente un entier"

	^self + 1.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
de: unArgument
	
	^self value: unArgument.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
de: unArgument de: unAutre
	
	^self value: unArgument value: unAutre.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
de: unArgument de: unAutre de: unTroisieme
	^self value: unArgument value: unAutre value: unTroisieme.! !

!BlockClosure methodsFor: '*DrGeoFrench' stamp: 'hlsf 1/3/2024 11:05:57'!
de: unArgument de: unAutre de: unTroisieme de: unQuatrieme
	^self value: unArgument value: unAutre value: unTroisieme value: unQuatrieme .! !

!BlockClosure methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:42:27'!
jusquàVrai: unBloc

	^self whileFalse: unBloc.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
tantQueFaux: unBloc

	^self whileFalse: unBloc.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
tantQueVrai: unBloc

	^self whileTrue: unBloc.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
tempsPourFaire
	
	^self timeToRun.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
valeur
	
	^self value.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
valeur: unArgument
	
	^self value: unArgument.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
valeur: unArgument valeur: unAutre
	
	^self value: unArgument value: unAutre.! !

!BlockClosure methodsFor: '*DrGeoFrench'!
valeur: unArgument valeur: unAutre valeur: unTroisieme	
	^self value: unArgument value: unAutre value: unTroisieme.! !

!BlockClosure methodsFor: '*DrGeoFrench' stamp: 'hlsf 1/3/2024 11:06:08'!
valeur: unArgument valeur: unAutre valeur: unTroisieme	 valeur: unQuatrieme
	^self value: unArgument value: unAutre value: unTroisieme value: unQuatrieme .! !

!Collection methodsFor: '*DrGeoFrench'!
ajouter: unObjet

	^self add: unObjet.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:32:43'!
ajouter: unObjet fois: unEntier

	unEntier foisRépéter: [self ajouter: unObjet].! !

!Collection methodsFor: '*DrGeoFrench'!
ajouterSiAbsent: unObjet

	^self addIfNotPresent: unObjet.! !

!Collection methodsFor: '*DrGeoFrench'!
ajouterTout: uneCollection

	^self addAll: uneCollection.! !

!Collection methodsFor: '*DrGeoFrench'!
arrondir

	^self rounded.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:09'!
auCarré

	^self squared.! !

!Collection methodsFor: '*DrGeoFrench'!
auHasard

	^self atRandom.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:21'!
aucunNeVérifie: unBloc

	^self noneSatisfy: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
choisir: unBloc
	
	^self select: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
choisir: bloc puisFaire: unBloc
	
	^self select: bloc thenDo: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
collecter: unBloc
	
	^self collect: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
collecter: unBloc dans: uneCollection
	
	^self collect: unBloc into: uneCollection.! !

!Collection methodsFor: '*DrGeoFrench'!
collecter: unBloc puisChoisir: critere
	^self collect: unBloc thenSelect: critere.! !

!Collection methodsFor: '*DrGeoFrench'!
collecter: unBloc puisFaire: autreBloc
	
	^self collect: unBloc thenDo: autreBloc.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:37'!
commeCollectionOrdonnée

	^self asOrderedCollection.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:49'!
commeCollectionTriée

	^self asSortedCollection.! !

!Collection methodsFor: '*DrGeoFrench'!
commeDictionnaire

	^self asDictionary.! !

!Collection methodsFor: '*DrGeoFrench'!
commeEnsemble

	^self asSet.! !

!Collection methodsFor: '*DrGeoFrench'!
commeSac

	^self asBag.! !

!Collection methodsFor: '*DrGeoFrench'!
commeTableau

	^self asArray.! !

!Collection methodsFor: '*DrGeoFrench'!
compter: unBloc
	
	^self count: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
contient: unObjet
	
	^(self includes: unObjet).! !

!Collection methodsFor: '*DrGeoFrench'!
cosinus
	
	^self degreeCos.! !

!Collection methodsFor: '*DrGeoFrench'!
effectifs
	"construit une table d'effectifs"

	| table cles |
	table _ Dictionary new.
	cles _ self asSet.
	cles do: [ :n | table at: n put: (self count: [ :t | t=n])].
	^table.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:45:02'!
effectifsEnClasses: unEntier
	"construit une table pour histogramme"

	| table cles h |
	h _ self étendue / unEntier.
	table _ Dictionary new.
	cles _ self min to: (self max - 1.0e-6) by: h.
	cles do: [ :n | table at: n put: (self count: [ :t | (t>=n) and: [t<(n+h)]])].
	^table.! !

!Collection methodsFor: '*DrGeoFrench'!
estVide

	^self isEmpty.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:32:43'!
échantillonDeTaille: unEntier 

	"tirage au hasard sans remise"
	| copie ech t n |
	n _ unEntier min: (self taille).
	n _ n max: 0.
	copie _ self collecter: [ :x | x ].
	ech _ #() commeSac.
	n foisRépéter: [ 
		t _ copie auHasard.
		ech ajouter: t.
		copie retirer: t.
		 ].
	^ech.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:45:02'!
étendue

	^self range.! !

!Collection methodsFor: '*DrGeoFrench'!
faire: unBloc
	
	^self do: unBloc.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:45:12'!
fréquences
	"construit une table de fréquences"

	| table cles total |
	total _ self size.
	table _ Dictionary new.
	cles _ self asSet.
	cles do: [ :n | table at: n put: ((self count: [ :t | t=n])/total)].
	^table.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:45:22'!
fréquencesEnClasses: unEntier
	"construit une table pour histogramme"

	| table cles h total |
	total _ self size.
	h _ self étendue / unEntier.
	table _ Dictionary new.
	cles _ self min to: (self max - 0.000001) by: h.
	cles do: [ :n | table at: n put: ((self count: [ :t | (t>=n) and: [t<(n+h)]])/total)].
	^table.! !

!Collection methodsFor: '*DrGeoFrench'!
grouperPar: unBloc

	^self groupedBy: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
grouperPar: unBloc lorsque: condition

	^self groupedBy: unBloc having: condition.! !

!Collection methodsFor: '*DrGeoFrench'!
injecter: valeur dans: unBloc

	^self inject: valeur into: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
inter: uneCollection
	
	^self intersection: uneCollection.! !

!Collection methodsFor: '*DrGeoFrench'!
inverses

	^self reciprocal.! !

!Collection methodsFor: '*DrGeoFrench'!
moyenne

	^self average.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:46:24'!
opposés

	^self negated.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:43:49'!
premierQuartile

	^(self commeCollectionTriée Q1).! !

!Collection methodsFor: '*DrGeoFrench'!
puissances: unExposant

	^self raisedTo: unExposant.! !

!Collection methodsFor: '*DrGeoFrench'!
racines

	^self sqrt.! !

!Collection methodsFor: '*DrGeoFrench'!
regrouper: unBloc
	
	^self gather: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
rejeter: unBloc
	
	^self reject: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
rejeter: bloc puisFaire: unBloc
	
	^self reject: bloc thenDo: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
retirer: unBloc

	^self remove: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
retirerTousLorsque: unBloc

	^self removeAllSuchThat: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
retirerTout

	^self removeAll.! !

!Collection methodsFor: '*DrGeoFrench'!
retirerToutDans: uneCollection

	^self removeAll: uneCollection.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:47:22'!
réduire: unBloc

	^self reduce: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
sinus
	
	^self degreeSin.! !

!Collection methodsFor: '*DrGeoFrench'!
somme

	^self sum.! !

!Collection methodsFor: '*DrGeoFrench'!
taille

	^self size.! !

!Collection methodsFor: '*DrGeoFrench'!
total

	^self sum.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:47:01'!
tousVérifient: unBloc

	^self allSatisfy: unBloc.! !

!Collection methodsFor: '*DrGeoFrench'!
trier
	
	^self sorted.! !

!Collection methodsFor: '*DrGeoFrench'!
trierSelon: unBloc
	
	^self sorted: unBloc.! !

!Collection methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:46:38'!
unVérifie: unBloc

	^self anySatisfy: unBloc.! !

!String methodsFor: '*DrGeoFrench'!
commeNombre
	^ self asNumber! !

!String methodsFor: '*DrGeoFrench'!
contient: unString
	^self includesSubString: unString! !

!String methodsFor: '*DrGeoFrench'!
correspond: unTexte
"
'toute*' correspond: 'Toute' -> true
'toute#' correspond: 'Toute' -> false
'toute#' correspond: 'Toutete' -> false
'toute*' correspond: 'Toutete' -> true
'toute#' correspond: 'Toutes' -> true
"	
	^self match: unTexte! !

!String methodsFor: '*DrGeoFrench'!
enMajuscule
	^self asUppercase! !

!String methodsFor: '*DrGeoFrench'!
enMinuscule
	^self asLowercase! !

!String methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:34:29'!
formater: uneCollection
	^ self format: uneCollection! !

!String methodsFor: '*DrGeoFrench'!
lettrine
	^self capitalized! !

!Array methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:48:38'!
à: unIndice
	
	^self at: unIndice.! !

!Array methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:36:03'!
à: unIndice mettre: unObjet
	
	^self at: unIndice put: unObjet.! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:36:20'!
afficher: unObjet
	^ self show: unObjet; newLine ! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:37:07'!
effacer
	^self clear.! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 9/28/2022 17:55:34'!
espace
	^self space! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/26/2022 16:37:13'!
montrer: unObjet
	^self show: unObjet! !

!Transcript class methodsFor: '*DrGeoFrench' stamp: 'hlsf 9/28/2022 17:55:42'!
retourLigne
	^ self cr! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
bloquer
	self lock! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
cacher
	self hide! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
couleur: aColor
	self color: aColor! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
decacher
	self unhide! !

!DrGWrappedItem methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:55:58'!
débloquer
	self unlock! !

!DrGWrappedItem methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:10'!
déplacerA: aPoint
	self moveTo: aPoint! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
montrer
	self show! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
nommer: aString
	self name: aString! !

!DrGWrappedItem methodsFor: '*DrGeoFrench'!
renommer: aString
	self rename: aString! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:55:47'!
épais
	self large! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench'!
fin
	self small! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench'!
plein
	self plain! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:55:40'!
pointillé
	self dotted! !

!DrGWrappedCurve methodsFor: '*DrGeoFrench'!
tiret
	self dashed ! !

!DrGWrappedFinitCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:28'!
flècheDebut
	self backArrow! !

!DrGWrappedFinitCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:41'!
flècheFin
	self forwardArrow! !

!DrGWrappedFinitCurve methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:33'!
flèches
	self bothArrows ! !

!DrGWrappedFilledCurve methodsFor: '*DrGeoFrench'!
remplir
	self filled! !

!DrGWrappedFilledCurve methodsFor: '*DrGeoFrench'!
transparent
	self translucent! !

!DrGWrappedFilledCurve methodsFor: '*DrGeoFrench'!
vider
	self unfilled! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAucun
	self noMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecCercle
	self circleMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecDisque
	self discMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecDoubleTrait
	self doubleMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecSimpleTrait
	self simpleMark ! !

!DrGWrappedSegment methodsFor: '*DrGeoFrench'!
marquerAvecTripleTrait
	self tripleMark ! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:52'!
carré
	self square! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench' stamp: 'hlsf 12/21/2022 14:56:58'!
coordonnées
	^ self coordinates! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench'!
croix
	self cross! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench'!
moyen
	self medium! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench'!
petit
	self small! !

!DrGWrappedPoint methodsFor: '*DrGeoFrench'!
rond
	self round! !

!DrGWrappedText methodsFor: '*DrGeoFrench'!
couleurFond: aColor
	self backgroundColor: aColor! !

!DrGWrappedText methodsFor: '*DrGeoFrench'!
texte: aString
	self text: aString! !

!DrGWrappedValue methodsFor: '*DrGeoFrench'!
nommer: aString
	self name: aString! !

!DrGWrappedValue methodsFor: '*DrGeoFrench'!
valeur: aNumber
	self value: aNumber ! !
