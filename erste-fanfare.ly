\version "2.19.3"

\header {
  title = "Erste Fanfare – die Ankunft des Engels"
  subtitle = "aus: Ein Engel kommt nach Babylon"
  composer = "Christian Schramm"
  tagline = \markup {
    \column {
      "Version 0.1"
      #(strftime "%d-%m-%Y" (localtime (current-time)))
    }
  }

}

global = {
  \key c \major
  \time 4/4
}

altoSax = \relative c'' {
  \global
  \transposition es
  R1*16
  
  r4 g\mp c g'
  f bes, d a'
  g c,2.
  r1
  
  r4 g c g'
  f bes, d a'
  g1
  r1
  
  r4 bes,\< es bes'
  a f a c
  b g2.\f
  r1
  
  r4 c,,\p g' c
  c g c g'
  g1
  r1
  
  r1
  r4 bes,\mp d a'
  g1
  g2\< bes
  
  g1\sfp
  f
  e
  es
  
  r4 c,\< g' c
  c g c g'\!
  r1
}

tenorSax = \relative c''' {
  \global
  \transposition bes,
  R1*16
  
  r4 g\mp c c
  bes f g d
  c g2.
  r1
  
  r4 g' c c
  bes f g d
  es1
  r
  
  r4 bes\< es bes
  c c f a
  g d2.\f
  r1
  
  r4 c\p g' es
  f d f bes
  c1
  r1
  
  r4 g\mp c g'
  f1
  e
  es4\< e f2
  
  e1\sfp
  d
  c
  bes
  
  r4 c,\< g' es
  f d f bes\!
  r1
}

trumpetBbI = \relative c'' {
  \global
  \transposition bes
  r4\fermata g\mp c g'
  f bes, d a'
  g c,2.
  r1
  
  r4 g c g'
  f bes, d a'
  g1
  r1
  
  r4 g, c g'
  f bes, d a'
  g c,2.
  r1
  
  r4 c g' c
  c g c g'
  g1
  r1
  
  R1*16
  
  r1
  r
  r4 c,,\mp c'2
  bes4\< c d2
  
  c1\sfp
  bes
  g
  g

  r4 c,\< g' c
  c g c g'\!
  g1\p\fermata
}

trumpetBbII = \relative c'' {
  \global
  \transposition bes
  r4\fermata g\mp c g'
  f bes, d a'
  g c,2.
  r1
  
  r4 g c g'
  f bes, d a'
  g1
  r1
  
  r4 g, c g'
  f bes, d a'
  g c,2.
  r1
  
  r4 c g' c
  c g c g'
  g1
  r1
  
  R1*16
  
  r1
  r
  r2. c,,4\mp
  bes4\< c d bes
  
  c1\sfp
  d
  e
  es
  
  r4 c\< g' c
  c g c d\!
  r1
}

right = \relative c'' {
  \global
  R1*3
  c'1~(
  
  c~
  c
  bes~
  bes)
  
  R1*4
  
  R1*3
  <e g c>1~(
  
  q1
  <f bes c>
  <e g c>~
  q)
  
  q1(
  <f bes c>
  <es g bes>~
  q)
  
  q(
  <f a c>
  <g b d>~
  q)
  
  R1*3
  <e g c>1
  
  R1*4
  
  c'8 bes f a g d c bes
  g f' bes, d c g f bes
  e1
  es
  
  <as, c es>
  <f bes d>
  r1
}

left = \relative c' {
  \global
  c1~
  c~
  c~
  c
  
  c1~(
  c
  es~
  es)
  
  c1~
  c~
  c~
  c
  
  as(
  bes
  c~
  c)
  
  c(
  d
  e~
  e)
  
  e(
  f
  g~
  g)
  
  g,(
  a
  <b d>2 e
  f4 g a b)
  
  c1(
  bes
  g~
  g)
  
  R1*4
  
  R1*2
  g'8 bes, c d c bes g f
  g d es a, g bes, a g
  
  as bes c d es f g as
  f g bes c es f g bes
  r1
}

pedal = \relative c {
  \global
  R1*16
  
  c1~
  c~
  c~
  c
  
  c(
  d
  es~
  es)
  
  es(
  f
  g~
  g)
  
  as(
  bes
  c~
  c)
  
  R1*4
  
  c,1~(
  c~
  c
  es)
  
  as(
  bes)
  r1
  \bar "|."
}

altoSaxPart = \new Staff \with {
  instrumentName = "Altsaxophon"
  shortInstrumentName = "Alt"
  midiInstrument = "alto sax"
} \transpose c a \altoSax

tenorSaxPart = \new Staff \with {
  instrumentName = "Tenorsaxophon"
  shortInstrumentName = "Tenor"
  midiInstrument = "tenor sax"
} \transpose c d \tenorSax

trumpetBbIPart = \new Staff \with {
  instrumentName = "B-Trompete I"
  shortInstrumentName = "Tr. I"
  midiInstrument = "trumpet"
} \transpose c d \trumpetBbI

trumpetBbIIPart = \new Staff \with {
  instrumentName = "B-Trompete II"
  shortInstrumentName = "Tr. II"
  midiInstrument = "trumpet"
} \transpose c d \trumpetBbII

organPart = <<
  \new PianoStaff \with {
    instrumentName = "Orgel"
    shortInstrumentName = "Orgel"
  } <<
    \new Staff = "right" \with {
      midiInstrument = "church organ"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "church organ"
    } { \clef bass \left }
  >>
  \new Staff = "pedal" \with {
    midiInstrument = "church organ"
  } { \clef bass \pedal }
>>

\score {
  <<
    \transpose c es, \altoSaxPart
    \transpose c es, \tenorSaxPart
    \transpose c es, \trumpetBbIPart
    \transpose c es, \trumpetBbIIPart
    \transpose c es, \organPart
  >>
  
  \layout {
    indent = 2.5\cm
    short-indent = 1.2\cm
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
}

