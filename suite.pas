{$librarypath 'blibs'}
{$librarypath 'benchmarks'}

program Suite;

uses
  b_system,
  bsort, sieve, countdown, montecarlo;

const
  lms = $e000;

var
  a       : byte absolute $20;
  b       : byte absolute $21;
  c       : byte absolute $22;
  d       : byte absolute $23;
  e       : byte absolute $24;
  sdlstl  : word absolute $D402;
  chbas   : byte absolute $D409;

var px: TPoint;

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

procedure printScore(name: string; row: byte);
var
  crow    : word;
  i       : byte;
begin
  crow := lms+(40*row);
  Move(name[1], pointer(crow), length(name));
  for i := 0 to 4 do begin
    poke(crow+i+$f,peek($20+i)+16);
  end;
end;

begin
  initSuite;

  initCounter;

  startCounter(bsort.name);
  bsort.run;
  DisableVBLI;
  printScore(bsort.name,0);

  startCounter(sieve.name);
  sieve.run;
  DisableVBLI;
  printScore(sieve.name,1);

  startCounter(countdown.name);
  countdown.run;
  DisableVBLI;
  printScore(countdown.name,2);

  startCounter(montecarlo.name);
  montecarlo.run;
  DisableVBLI;
  printScore(montecarlo.name,3);

  chbas := $80;
  sdlstl := word(@dlScore);

  repeat until false;
end.
