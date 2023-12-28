<TeXmacs|1.0.1.21>

<style|article>

<\body>
  <\expand|make-title>
    <title|Géométrie et Programmation Scheme avec Dr. Geo>

    <author|Andrea Centomo>

    <\address>
      Organization for Free Software in Education and Teaching
    </address>

    <expand|title-email|acentomo@ofset.org>

    <expand|title-date|<date><expand|made-by-TeXmacs>>
  </expand>

  <\abstract>
    One of the most peculiar aspects of Dr. Geo is related to the presence of
    a powerful programming ambient strongly connected to its geometrical
    engine. In this paper, after a brief introduction to the concept of
    Scheme Figure, we present an easy example of iterative figure with some
    generalizations. \ 
  </abstract>

  Dans Dr. Geo, la forte intégration que l'on trouve entre le langage Scheme
  et le moteur de géométrie interactive du logiciel, ouvre de nouvelles
  perspectives pour la didactique des mathématiques à différents niveaux,
  dans un horizon qui s'étend de l'école secondaire de premier degré jusqu'à
  l'école de deuxième degré.

  Nous ne sommes pas encore à même d'offrir un exposé systématique et
  exhaustif à propos des possibilités didactiques relatives à ce marriage
  entre programmation et géométrie et, nous procéderons donc en analysant
  seulement certains exemples où se mélangent figures interactives et script
  Schme.

  L'idée d'exploiter des structures interactives par l'intermédiare du
  langage de haut niveau Scheme représente l'exemple le plus naturel
  d'articulation entre géométrie et programmation. Cet exemple est
  certainement connu par tous ceux qui connaissent le langage Logo. D'autres
  domaines d'application, moins évidents, pourraient être liés à l'étude de
  la théorie de la probabilité.

  <section|Figures Scheme de Dr. Geo>

  Les <strong|Figures Scheme de Dr. Geo> -- <acronym|fsd> -- sont des figures
  écrites dans un langage relativement naturel. Il ne s'agit donc plus de
  construire une figure à l'aide de l'interface graphique de Dr. Geo mais
  plutôt de décrire une figure dans le langage Scheme. Nous avons apporté le
  plus grand soin afin que la syntaxe utilisée soit facile et légère. Aussi
  l'ensemble des mots clés utilisés pour décrire une figure simple sont
  adaptables dans différentes langues. Ainsi une figure pourra être décrite
  en Français, en Anglais, en Espagnol, etc. Un mélange de langues est même
  possible mais ce n'est pas souhaitable.

  <subsection|Exemples base>

  En lui même Scheme est un langage de très haut niveau, lorsqu'une figure
  est définie dans ce langage, nous disposons également de toute sa puissance
  pour par exemple définir récursivement telle partie de la figure, ou bien
  pour placer aléatoirement certains objets de telle sorte qu'à chaque
  ouverture de la figure, celle-ci est légèrement différente. Bref, les
  <acronym|fsd> sont libérées du carcan de l'interface graphique tout en
  étant renforcés du langage Scheme. Une <acronym|fsd> est donc un fichier
  créé à l'aide d'un éditeur de texte, il est ensuite ouvert dans Dr. Geo à
  l'aide de la commande <samp|Fichier><with|mode|math|\<rightarrow\>><samp|Évaluer>.

  Commençons par étudier un exemple simple de <acronym|fsd> :

  <\code>
    (new-figure "Figura")\ 

    (lets Point "A" free 2 -2)
  </code>

  Cette <acronym|fsd> définie une figure avec un point libre
  <with|mode|math|A> de coordonnées initiales <with|mode|math|(2;-2)>. Comme
  nous pouvons le voir la syntaxe de définition d'un objet géométrique est
  relativement agréable, d'autant plus qu'elle est exprimée dans une langue
  maternelle. Intéressons nous de plus près à la deuxième instruction, en
  effet celle-ci suit une syntaxe qui est commune à toutes les commandes de
  définition d'objet. Ce type de commande se décompose comme suit :

  <\expand|enumerate-alpha>
    <item>Elle commence toujours par le mot-clé <verbatim|lets>, il indique
    que nous souhaitons définir un nouvel objet.

    <item>Il est immédiatement suivi de la catégorie de l'objet, ici
    <verbatim|Point>.

    <item>Le nom de l'objet vient ensuite, <verbatim|A>, il doit toujours
    être entouré de ". Si nous ne souhaitons pas nommer l'objet, il faut tout
    de même donner un nom vide comme suit: "".

    <item>Enfin, nous précisons le type de l'objet -- le type de point dans
    notre exemple -- ici <verbatim|free>. Cela signifie que le point
    <with|mode|math|A> est libre.

    <item>Le type de l'objet est suivit d'une liste d'argument spécifique.
    Dans notre exemple cette liste est composée de deux nombres, les
    coordonnées du point libre <with|mode|math|A>.
  </expand>

  Poursuivons avec un autre exemple :

  <\code>
    (define (triangle p1 p2 p3)\ 

    (Segment "" extremities p1 p2)\ 

    (Segment "" extremities p2 p3)\ 

    (Segment "" extremities p1 p3))

    \;

    (define (rand) (- 8 (* 16 (random:uniform))))

    \;

    (new-figure "Exemple")

    (lets Point "A" free (rand) 0)\ 

    (lets Point "B" free 5 0)\ 

    (lets Point "C" free (rand) 5)

    (triangle A B C)
  </code>

  Cet exemple est particulièrement intéressant, il nous montre trois choses
  importantes :

  <\expand|enumerate-numeric>
    <item>L'introduction de construction de plus haut niveau, non prévue au
    départ par Dr. Geo. Ici nous avons défini la fonction <verbatim|triangle>
    qui, à partir de trois points, construit le triangle passant par ces
    trois points. Nous pouvons comparer ceci avec les macro-constructions
    mais avec un degré de liberté beaucoup plus important.

    <item>La définition de fonctions associées, ici nous avons défini la
    fonction <verbatim|rand> qui retourne un nombre décimal compris entre -8
    et 8. Nous utilisons cette fonction pour placer au hasard certains points
    de notre figure, ainsi à chaque ouverture la figure est légèrement
    différente.

    <item>En fait l'utilisation du mot clé <verbatim|lets> n'est pas
    obligatoire, nous l'utilisons lorsque nous souhaitons garder une
    référence de l'objet créé. Par exemple dans la fonction
    <verbatim|triangle>, nous ne gardons pas de références des segments
    créés, en revanche lorsque nous définissons nos points
    <with|mode|math|A>, <with|mode|math|B> et <with|mode|math|C> nous avons
    besoin de garder une référence, ces références ont le même nom<\footnote>
      D'un point de vue interne au langage Scheme, ces références sont des
      symboles pointant sur une strucuture interne de l'objet -- un prototype
      -- alors que les noms sont des chaînes de caractères.
    </footnote> sans guillemet : <verbatim|A>, <verbatim|B> et <verbatim|C>.
    Dans la suite nous appellerons <strong|symbole> ces références, c'est la
    terminologie exacte du langage Scheme. Ainsi, lors de l'appel de la
    fonction <verbatim|triangle>, nous passons en paramètre les symboles
    <verbatim|A>, <verbatim|B> et <verbatim|C> qui sont utilisés pour définir
    nos trois segments.
  </expand>

  \ 

  Noter que lors de la définition des segments, nous ne donnons pas de nom,
  dans ce cas Dr. Geo va attribuer un nom par défaut défini à partir du nom
  des extrémités. Nos trois segments auront donc comme nom
  <with|mode|math|[AB]>, <with|mode|math|[BC]> et <with|mode|math|[AC]>.

  Pour clure cette section, voici un dernier exemple :

  <\code>
    (new-figure "Send")

    \;

    (lets Point "A" free 1 0)\ 

    (lets Point "B" free 2 0)\ 

    (lets Point "C" free 2 0)

    \;

    (lets Line "d1" 2points A B)

    \;

    (send A color yellow)\ 

    (send A shape round)\ 

    (send A size large)

    \;

    (send B color green)

    \;

    (send C masked)

    \;

    (send d1 thickness dashed)
  </code>

  Les trois premières commandes créent deux points et une droite. La partie
  qui nous intéresse plus particulièrement est la série de commande
  <verbatim|send>. Cette commande permet de communiquer avec un objet dont
  nous avons gardé un symbole, ici nous avons les symboles <verbatim|A>,
  <verbatim|B>, <verbatim|C> et <verbatim|d1>. Elle consiste à envoyer un
  message à un objet, son premier argument est l'objet avec lequel nous
  communiquons, le deuxième argument le message, le troisième et les suivants
  sont déterminés par la nature du message. Par exemple <verbatim|(send A
  color yellow)> envoi le message <verbatim|color> avec comme paramètre
  <verbatim|yellow>, le point A est peint en jaune. Il est assez facile de
  comprendre le sens des autres commandes <verbatim|send>.

  <subsection|Figures Scheme Récursives>

  Un premier exemple est représenté par la figure :

  <expand|big-figure|<postscript|spitri.ps|*5/8|||||>|Base>

  Le code Scheme qui permet de la réaliser est le suivant :

  <\code>
    (new-figure "Base")

    \;

    (define (triangle p1 p2 p3 n)

    \ \ 

    \ \ (let* ((s1 (Segment "" extremities p1 p2))

    \ \ \ \ \ \ \ \ \ (s2 (Segment "" extremities p2 p3))

    \ \ \ \ \ \ \ \ \ (s3 (Segment "" extremities p3 p1))

    \ \ \ \ \ \ \ \ \ (A \ (Point "" on-curve s1 1/10))

    \ \ \ \ \ \ \ \ \ (B \ (Point "" on-curve s2 1/10))

    \ \ \ \ \ \ \ \ \ (C \ (Point "" on-curve s3 1/10)))

    \;

    \ \ \ \ \ \ \ \ \ (send A masked)

    \ \ \ \ \ \ \ \ \ (send B masked)

    \ \ \ \ \ \ \ \ \ (send C masked)

    \ \ \ \ \ \ \ \ \ 

    \ \ \ \ \ \ \ \ \ (if (\<gtr\> n 0)

    \ \ \ \ \ \ \ \ \ \ \ \ \ 

    \ \ \ \ \ \ \ \ \ \ \ \ \ (triangle A B C (- n 1)))))

    \;

    (lets Point "L" free -5 0)\ 

    (lets Point "M" free \ 5 0)

    (lets Point "N" free \ 0 ( * 5 (sqrt 3)))

    \;

    (triangle L M N 20)
  </code>

  Ici nous avons utilisés la fonction <verbatim|triangle> qui, à partir de
  trois points, construit le triangle passant par ces trois points. Une
  petite récursion est suffisante pour obtenir la figure à partir de
  <with|mode|math|L M N>.

  <\problem>
    Construire une selon le même procédé une <acronym|fsd> à partir de
    <with|mode|math|ABCD> où le polygone <with|mode|math|ABCD> est un carré.
  </problem>

  Une solution est donnée par le code Scheme :

  <\code>
    (new-figure "General")

    \;

    (define (carre p1 p2 p3 p4 n)

    \ \ 

    \ \ (let* ((s1 (Segment "" extremities p1 p2))

    \ \ \ \ \ \ \ \ \ (s2 (Segment "" extremities p2 p3))

    \ \ \ \ \ \ \ \ \ (s3 (Segment "" extremities p3 p4))

    \ \ \ \ \ \ \ \ \ (s4 (Segment "" extremities p4 p1))

    \ \ \ \ \ \ \ \ \ (A \ (Point "" on-curve s1 1/10))

    \ \ \ \ \ \ \ \ \ (B \ (Point "" on-curve s2 1/10))

    \ \ \ \ \ \ \ \ \ (C \ (Point "" on-curve s3 1/10))

    \ \ \ \ \ \ \ \ \ (D \ (Point "" on-curve s4 1/10)))

    \;

    \ \ \ \ \ \ \ \ \ (send A masked)

    \ \ \ \ \ \ \ \ \ (send B masked)

    \ \ \ \ \ \ \ \ \ (send C masked)

    \ \ \ \ \ \ \ \ \ (send D masked)

    \ \ \ \ \ \ \ \ \ 

    \ \ \ \ \ \ \ \ \ (if (\<gtr\> n 0)

    \ \ \ \ \ \ \ \ \ \ \ \ \ 

    \ \ \ \ \ \ \ \ \ \ \ \ \ (carre A B C D (- n 1)))))

    \;

    (lets Point "A" free \ 5 \ 5)\ 

    (lets Point "B" free -5 \ 5)

    (lets Point "C" free -5 -5)

    (lets Point "D" free \ 5 -5)

    \;

    (carre A B C D 30)
  </code>

  La figure est :

  <expand|big-figure|<postscript|spicar.ps|*5/8|||||>|Generalization>

  <section|Quelques éléments pour écire des figures Scheme>

  <subsection|Un éditeur adapté>

  \;

  La syntaxe du langage Scheme fait que beaucoup de parenthèses sont
  présentes dans une figure Scheme. Pour faciliter la rédaction d'une figure,
  nous vous conseillons l'utilisation d'un éditeur capable d'appereiller les
  parenthèses ouvrantes et fermentes. Par exemple l'éditeur <samp|Scite>
  convient parfaitement.

  <samp|Scite> peut être configuré pour évaluer directement un fichier ayant
  l'extension <samp|.scm> dans Dr. Geo. Pour ce faire, en tant que
  <samp|root> éditer le fichier <samp|/usr/share/scite/lisp.properties> et
  remplacer la ligne :

  <verbatim|command.go.$(file.patterns.scheme)=c:/tools/gambit/gsi.exe -f
  $(FilePath)>

  <\with|first indentation|>
    par la ligne :
  </with>

  <verbatim|command.go.$(file.patterns.scheme)=/usr/bin/drgeo -e $(FilePath)>

  \;

  Par la suite, lorsque vous éditer un fichier <samp|.scm> il suffit de
  presser <kbd|F5> pour évaluer la figure dans Dr. Geo.

  <subsection|Quelques éléments sur le langage Scheme>

  \;

  Dans les quelques exemples ci-dessus, nous avons vu l'emploi d'éléments
  <expand|code*|define>, <expand|code*|let*> et <expand|code*|if>.

  \;

  <expand|code*|define> pour définir un symbole vers une constante ou une
  fonction :

  <\expand|itemize-minus>
    <item><expand|code*|(define x 1.4)>

    <item><expand|code*|<verbatim|(define (f x) (cos x))>>
  </expand>

  \;

  <expand|code*|let*> s'emploie dans le préambule d'une définition de
  fonction, il permet de déclarer des variables locales.

  <expand|code*|if> est de la forme <expand|code*|(if (test) (vrai) (faux))>

  \;

  Scheme est un langqge postfixé, il s'utilise donc comme les fonctions
  mathématiques : le nom de l'opérateur suivi des arguments. Pour écire
  <with|mode|math|2*\<times\>x+4> on écrira <expand|code*|(+ (* 2 x) 4)>.
  Effet intéressant d'un point de vue pédagogique, le travail d'évaluation
  algébrique n'est pas escamoté par le langage, mais il doit être fait par
  l'utilisateur.

  <expand|section*|Bibliographie>

  [1] H. Fernandes, <em|Manuel utilisateur de Dr. Geo>, Ofset, 2004.
</body>

<\initial>
  <\collection>
    <associate|odd page margin|30mm>
    <associate|paragraph width|150mm>
    <associate|page right margin|30mm>
    <associate|page top margin|30mm>
    <associate|reduction page right margin|25mm>
    <associate|reduction page bottom margin|15mm>
    <associate|even page margin|30mm>
    <associate|reduction page left margin|25mm>
    <associate|page bottom margin|30mm>
    <associate|reduction page top margin|15mm>
    <associate|language|french>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|gly-1|<tuple|1|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|toc-1|<tuple|1|?>>
    <associate|gly-2|<tuple|2|?>>
    <associate|toc-2|<tuple|1.1|?>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|toc-3|<tuple|1.2|?>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|toc-4|<tuple|2|?>>
    <associate|auto-4|<tuple|1|3>>
    <associate|toc-5|<tuple|2.1|?>>
    <associate|auto-5|<tuple|2|5>>
    <associate|toc-6|<tuple|2.2|?>>
    <associate|auto-6|<tuple|2|5>>
    <associate|footnote-1|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|Base|<pageref|gly-1>>

      <tuple|normal|Generalization|<pageref|gly-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font series|<quote|bold>|math font
      series|<quote|bold>|1<space|2spc>Figures Scheme de Dr.
      Geo><value|toc-dots><pageref|toc-1><vspace|0.5fn>

      1.1<space|2spc>Exemples base<value|toc-dots><pageref|toc-2>

      1.2<space|2spc>Figures Scheme Iteratives<value|toc-dots><pageref|toc-3>
    </associate>
  </collection>
</auxiliary>
