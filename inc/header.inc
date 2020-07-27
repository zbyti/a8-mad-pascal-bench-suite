{$librarypath 'zlibs'}

//---------------------- INTERFACE ---------------------------------------------

interface

  procedure benchmark;
  procedure rewriteCounter;
  procedure run;

  var
    name   : string[25];

implementation

  uses counter;

  const
    lms = $a000;

  var
    rtclok : byte absolute $14;
    rnd    : byte absolute $D20A;
    chbas  : byte absolute $D409;
    sdlstl : word absolute $D402;
