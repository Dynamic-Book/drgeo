<TeXmacs|1.0.1>

<style|article>

<\body>
  <\expand|make-title>
    <title|SYMÉTRIES AXIALES SUCCESSIVES (1)>

    <author|Philippe Béthune>
  </expand>

  <section|La figure de base>

  <expand|tabular*|<tformat|<twith|table width|1par>|<twith|table
  hyphen|y>|<cwith|1|-1|1|1|cell width|7cm>|<cwith|1|-1|1|1|cell
  hyphen|t>|<cwith|1|-1|1|-1|cell halign|l>|<cwith|1|-1|2|2|cell
  width|7cm>|<cwith|1|-1|1|1|cell halign|l>|<cwith|1|-1|2|2|cell
  halign|l>|<cwith|1|-1|2|2|cell hyphen|n>|<cwith|4|4|2|2|cell
  hyphen|n>|<table|<row|<cell|Trace un segment <with|mode|math|[I
  J]>.>|<\cell>
    Menu <samp|Point<with|mode|math|\<rightarrow\>>Point libre>

    Menu <samp|Ligne<with|mode|math|\<rightarrow\>>Segment>

    Menu <samp|Autres<with|mode|math|\<rightarrow\>>Style>

    \;
  </cell>>|<row|<\cell>
    Trace les droites <with|mode|math|(d)> et <with|mode|math|(e)> passant
    respectivement par <with|mode|math|I> et <with|mode|math|J> et toutes
    deux perpendiculaire au segment <with|mode|math|[I J]>.

    \;
  </cell>|<\cell>
    Menu <samp|Transformation<with|mode|math|\<rightarrow\>>Droite
    Orthogonale>

    Menu <samp|Autres<with|mode|math|\<rightarrow\>>Style>
  </cell>>|<row|<cell|Dessine un triangle <with|mode|math|A B C>.>|<\cell>
    Menu <samp|Point<with|mode|math|\<rightarrow\>>Point libre>

    Menu <samp|Ligne<with|mode|math|\<rightarrow\>>Segment>

    Menu <samp|Autres<with|mode|math|\<rightarrow\>>Style>

    \;
  </cell>>|<row|<cell|Construis le triangle
  <with|mode|math|A<rprime|'>B<rprime|'>C<rprime|'>> symétrique du triangle
  <with|mode|math|A B C> par rapport à la droite
  <with|mode|math|(d)>.>|<\cell>
    Menu <samp|Transformation<with|mode|math|\<rightarrow\>>Symétrie Axiale>

    (Symétrie sur les sommets et côtés du triangle)

    Menu <samp|Autres<with|mode|math|\<rightarrow\>>Style>

    \;
  </cell>>>>>

  <\strong>
    \;

    ATTENTION : le symétrique de <with|mode|math|A> est
    <with|mode|math|A<rprime|'>>, celui de <with|mode|math|B> est
    <with|mode|math|B<rprime|'>> et celui de <with|mode|math|C> est
    <with|mode|math|C<rprime|'>>.
  </strong>

  \;

  <tabular|<tformat|<cwith|1|3|1|1|cell width|7cm>|<cwith|1|3|1|1|cell
  hyphen|t>|<cwith|1|3|1|2|cell halign|l>|<cwith|1|3|2|2|cell
  width|7cm>|<cwith|1|3|1|1|cell halign|l>|<table|<row|<cell|Construis le
  triangle <with|mode|math|A<rprime|''>B<rprime|''>C<rprime|''>> symétrique
  de <with|mode|math|A<rprime|'>B<rprime|'>C<rprime|'>> par rapport à la
  droite <with|mode|math|(e)>.>|<\cell>
    Menu <samp|Transformation<with|mode|math|\<rightarrow\>>Symétrie
    Axiale><format|next line>

    (Symétrie sur les sommets et côtés du triangle)

    Menu <samp|Autres<with|mode|math|\<rightarrow\>>Style>

    \;
  </cell>>|<row|<\cell>
    Mesure les angles et les côtés des deux triangles <with|mode|math|A B C>
    et <with|mode|math|A<rprime|''>B<rprime|''>C<rprime|''>>.
  </cell>|<\cell>
    Menu <samp|Numérique<with|mode|math|\<rightarrow\>>Angle>

    Menu <samp|Numérique<with|mode|math|\<rightarrow\>>Distance & longueur>
  </cell>>>>>

  <section|Animation, mesurs et observations>

  <\expand|enumerate-alpha>
    <item>Les points <with|mode|math|I> et <with|mode|math|J> restent fixes

    <\with|first indentation|0>
      Déforme le triangle <with|mode|math|A B C>. Compare ses mesures avec
      celles du triangle <with|mode|math|A<rprime|''>B<rprime|''>C<rprime|''>>.
      Qu'observes-tu sur les longueurs des côtés et sur les angles ?
    </with>

    <item>Les points A, B et C restent fixes

    <\with|first indentation|0>
      Trace et mesure les segments <with|mode|math|[A A<rprime|''>]>,
      <with|mode|math|[B B<rprime|''>]>, <with|mode|math|[C C<rprime|''>]> et
      <with|mode|math|[I J]>.

      Construis un tableau donnant 4 valeurs de <with|mode|math|I J> et les
      longueurs correspondantes <with|mode|math|A A<rprime|''>>,
      <with|mode|math|B<space|0.2spc>B<rprime|''>> et
      <with|mode|math|C<space|0.2spc>C<rprime|''>>.

      Rédige ton observation.
    </with>
  </expand>

  <section|Démonstrations>

  Démontre les égalités <with|mode|math|A<space|0.2spc>A<rprime|''>=B<space|0.2spc>B<rprime|''>=C<space|0.2spc>C<rprime|''>=2.I<space|0.2spc>J>.

  As-tu reconnu la transfromation qui fait passer directement du triangle
  <with|mode|math|A B C> au triangle <with|mode|math|A<rprime|''>B<rprime|''>C<rprime|''>>
  ?

  \;

  <\with|paragraph mode|center>
    <expand|big-figure|<postscript|figure.eps|12cm|||||>|>
  </with>

  \;
</body>

<\initial>
  <\collection>
    <associate|paragraph width|150mm>
    <associate|odd page margin|30mm>
    <associate|page right margin|30mm>
    <associate|page top margin|30mm>
    <associate|reduction page right margin|25mm>
    <associate|page type|a4>
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
    <associate|toc-1|<tuple|1|1>>
    <associate|gly-1|<tuple|1|2>>
    <associate|toc-2|<tuple|2|1>>
    <associate|toc-3|<tuple|3|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal||<pageref|gly-1>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font series|<quote|bold>|math font
      series|<quote|bold>|1<space|2spc>La figure de
      base><value|toc-dots><pageref|toc-1><vspace|0.5fn>

      <vspace*|1fn><with|font series|<quote|bold>|math font
      series|<quote|bold>|2<space|2spc>Animation, mesurs et
      observations><value|toc-dots><pageref|toc-2><vspace|0.5fn>

      <vspace*|1fn><with|font series|<quote|bold>|math font
      series|<quote|bold>|3<space|2spc>Démonstrations><value|toc-dots><pageref|toc-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>
