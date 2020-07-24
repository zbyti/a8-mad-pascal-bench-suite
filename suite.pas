{$librarypath 'blibs'}
{$librarypath 'benchmarks'}

program Suite;

uses
  b_system,
  bsort, sieve, countdown, montecarlo;

const
  lms = $e000;

var
  b       : byte absolute $21;
  a       : byte absolute $20;
  c       : byte absolute $22;
  d       : byte absolute $23;
  e       : byte absolute $24;
  sdlstl  : word absolute $D402;
  chbas   : byte absolute $D409;

procedure dlScore():assembler;
  asm
  {
  :3  .byte $70
      .byte $42,a(lms)
  :21 .byte $02
      .byte $41,a(dlScore)
  };
end;

procedure initSuite();
begin
  Move(pointer($e000), pointer($8000), $400);
  SystemOff;
  FillChar(pointer($20), $28, $ff);
  FillChar(pointer(lms), $fff, 0);
end;

{$i counter.inc}

begin
  initSuite;

  initCounter;

  startCounter(bsort.name);
  bsort.run;
  DisableVBLI;

  startCounter(sieve.name);
  sieve.run;
  DisableVBLI;

  startCounter(countdown.name);
  countdown.run;
  DisableVBLI;

  startCounter(montecarlo.name);
  montecarlo.run;
  DisableVBLI;

  //chbas := $80;
  //sdlstl := word(@dlScore);

  repeat until false;
end.
