{$librarypath 'zlibs'}

//---------------------- INTERFACE ---------------------------------------------

interface
  procedure run;

  var
    name   : string[25];

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

  uses counter;

  const
    lms = $a010;
    charset = $8000;

  var
    rtclok        : byte absolute $14;
    rnd           : byte absolute $D20A;
    chbas         : byte absolute $D409;
    sdlstl        : word absolute $D402;
    isRewritable  : boolean = false;
